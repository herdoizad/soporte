package soporte

import org.springframework.dao.DataIntegrityViolationException
import soporte.seguridad.Shield


/**
 * Controlador que muestra las pantallas de manejo de Contactos
 */
class ContactosController extends Shield {

    static allowedMethods = [save_ajax: "POST", delete_ajax: "POST"]

    /**
     * Acción que redirecciona a la lista (acción "list")
     */
    def index() {
        redirect(action: "list", params: params)
    }

    /**
     * Función que saca la lista de elementos según los parámetros recibidos
     * @param params objeto que contiene los parámetros para la búsqueda:: max: el máximo de respuestas, offset: índice del primer elemento (para la paginación), search: para efectuar búsquedas
     * @param all boolean que indica si saca todos los resultados, ignorando el parámetro max (true) o no (false)
     * @return lista de los elementos encontrados
     */
    def getList(params, all) {
        params = params.clone()
        params.max = params.max ? Math.min(params.max.toInteger(), 100) : 10
        params.offset = params.offset ?: 0
        if (all) {
            params.remove("max")
            params.remove("offset")
        }
        def list
        if (params.search) {
            def c = Contactos.createCriteria()
            list = c.list(params) {
                or {
                    /* TODO: cambiar aqui segun sea necesario */

                    ilike("condicion", "%" + params.search + "%")
                    ilike("email", "%" + params.search + "%")
                    ilike("estado", "%" + params.search + "%")
                    ilike("nombre", "%" + params.search + "%")
                    ilike("telefono", "%" + params.search + "%")
                }
            }
        } else {
            list = Contactos.list(params)
        }
        if (!all && params.offset.toInteger() > 0 && list.size() == 0) {
            params.offset = params.offset.toInteger() - 1
            list = getList(params, all)
        }
        return list
    }

    /**
     * Acción que muestra la lista de elementos
     */
    def list() {
        def contactosInstanceList = getList(params, false)
        def contactosInstanceCount = getList(params, true).size()
        return [contactosInstanceList: contactosInstanceList, contactosInstanceCount: contactosInstanceCount]
    }

    /**
     * Acción llamada con ajax que muestra la información de un elemento particular
     */
    def show_ajax() {
        if (params.id) {
            def contactosInstance = Contactos.get(params.id)
            if (!contactosInstance) {
                render "ERROR*No se encontró Contactos."
                return
            }
            return [contactosInstance: contactosInstance]
        } else {
            render "ERROR*No se encontró Contactos."
        }
    } //show para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que muestra un formaulario para crear o modificar un elemento
     */
    def form_ajax() {
        def contactosInstance = new Contactos()
        if (params.id) {
            contactosInstance = Contactos.get(params.id)
            if (!contactosInstance) {
                render "ERROR*No se encontró Contactos."
                return
            }
        }
        contactosInstance.properties = params
        return [contactosInstance: contactosInstance,cliente:params.cliente]
    } //form para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que guarda la información de un elemento
     */
    def save_ajax() {
        def contactosInstance = new Contactos()
        if (params.id) {
            contactosInstance = Contactos.get(params.id)
            if (!contactosInstance) {
                render "ERROR*No se encontró Contactos."
                return
            }
        }
        contactosInstance.properties = params
        contactosInstance.cliente=Cliente.findByCodigo(params.cliente_codigo)
        if (!contactosInstance.save(flush: true)) {
            render "ERROR*Ha ocurrido un error al guardar Contactos: " + renderErrors(bean: contactosInstance)
            return
        }
        render "SUCCESS*${params.id ? 'Actualización' : 'Creación'} de Contactos exitosa."
        return
    } //save para grabar desde ajax

    /**
     * Acción llamada con ajax que permite eliminar un elemento
     */
    def delete_ajax() {
        if (params.id) {
            def contactosInstance = Contactos.get(params.id)
            if (!contactosInstance) {
                render "ERROR*No se encontró Contactos."
                return
            }
            try {
                contactosInstance.delete(flush: true)
                render "SUCCESS*Eliminación de Contactos exitosa."
                return
            } catch (DataIntegrityViolationException e) {
                render "ERROR*Ha ocurrido un error al eliminar Contactos"
                return
            }
        } else {
            render "ERROR*No se encontró Contactos."
            return
        }
    } //delete para eliminar via ajax

    /**
     * Acción llamada con ajax que valida que no se duplique la propiedad email
     * @render boolean que indica si se puede o no utilizar el valor recibido
     */
    def validar_unique_email_ajax() {
        params.email = params.email.toString().trim()
        if (params.id) {
            def obj = Contactos.get(params.id)
            if (obj.email.toLowerCase() == params.email.toLowerCase()) {
                render true
                return
            } else {
                render Contactos.countByEmailIlike(params.email) == 0
                return
            }
        } else {
            render Contactos.countByEmailIlike(params.email) == 0
            return
        }
    }

}
