package soporte

import org.springframework.dao.DataIntegrityViolationException
import soporte.seguridad.Shield


/**
 * Controlador que muestra las pantallas de manejo de Software
 */
class SoftwareController extends Shield {

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
            def c = Software.createCriteria()
            list = c.list(params) {
                or {
                    /* TODO: cambiar aqui segun sea necesario */

                    ilike("descripcion", "%" + params.search + "%")
                    ilike("nombre", "%" + params.search + "%")
                    ilike("ultimaVersion", "%" + params.search + "%")
                }
            }
        } else {
            list = Software.list(params)
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
        def softwareInstanceList = getList(params, false)
        def softwareInstanceCount = getList(params, true).size()
        return [softwareInstanceList: softwareInstanceList, softwareInstanceCount: softwareInstanceCount]
    }

    /**
     * Acción llamada con ajax que muestra la información de un elemento particular
     */
    def show_ajax() {
        if (params.id) {
            def softwareInstance = Software.get(params.id)
            if (!softwareInstance) {
                render "ERROR*No se encontró Software."
                return
            }
            return [softwareInstance: softwareInstance]
        } else {
            render "ERROR*No se encontró Software."
        }
    } //show para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que muestra un formaulario para crear o modificar un elemento
     */
    def form_ajax() {
        def softwareInstance = new Software()
        if (params.id) {
            softwareInstance = Software.get(params.id)
            if (!softwareInstance) {
                render "ERROR*No se encontró Software."
                return
            }
        }
        softwareInstance.properties = params
        return [softwareInstance: softwareInstance]
    } //form para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que guarda la información de un elemento
     */
    def save_ajax() {
        def softwareInstance = new Software()
        if (params.id) {
            softwareInstance = Software.get(params.id)
            if (!softwareInstance) {
                render "ERROR*No se encontró Software."
                return
            }
        }
        softwareInstance.properties = params
        if (!softwareInstance.save(flush: true)) {
            render "ERROR*Ha ocurrido un error al guardar Software: " + renderErrors(bean: softwareInstance)
            return
        }
        render "SUCCESS*${params.id ? 'Actualización' : 'Creación'} de Software exitosa."
        return
    } //save para grabar desde ajax

    /**
     * Acción llamada con ajax que permite eliminar un elemento
     */
    def delete_ajax() {
        if (params.id) {
            def softwareInstance = Software.get(params.id)
            if (!softwareInstance) {
                render "ERROR*No se encontró Software."
                return
            }
            try {
                softwareInstance.delete(flush: true)
                render "SUCCESS*Eliminación de Software exitosa."
                return
            } catch (DataIntegrityViolationException e) {
                render "ERROR*Ha ocurrido un error al eliminar Software"
                return
            }
        } else {
            render "ERROR*No se encontró Software."
            return
        }
    } //delete para eliminar via ajax

}
