package soporte

import org.springframework.dao.DataIntegrityViolationException
import soporte.seguridad.Shield


/**
 * Controlador que muestra las pantallas de manejo de TipoHardware
 */
class TipoHardwareController extends Shield {

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
            def c = TipoHardware.createCriteria()
            list = c.list(params) {
                or {
                    /* TODO: cambiar aqui segun sea necesario */

                    ilike("codigo", "%" + params.search + "%")
                    ilike("descripcion", "%" + params.search + "%")
                }
            }
        } else {
            list = TipoHardware.list(params)
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
        def tipoHardwareInstanceList = getList(params, false)
        def tipoHardwareInstanceCount = getList(params, true).size()
        return [tipoHardwareInstanceList: tipoHardwareInstanceList, tipoHardwareInstanceCount: tipoHardwareInstanceCount]
    }

    /**
     * Acción llamada con ajax que muestra la información de un elemento particular
     */
    def show_ajax() {
        if (params.id) {
            def tipoHardwareInstance = TipoHardware.get(params.id)
            if (!tipoHardwareInstance) {
                render "ERROR*No se encontró TipoHardware."
                return
            }
            return [tipoHardwareInstance: tipoHardwareInstance]
        } else {
            render "ERROR*No se encontró TipoHardware."
        }
    } //show para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que muestra un formaulario para crear o modificar un elemento
     */
    def form_ajax() {
        def tipoHardwareInstance = new TipoHardware()
        if (params.id) {
            tipoHardwareInstance = TipoHardware.get(params.id)
            if (!tipoHardwareInstance) {
                render "ERROR*No se encontró TipoHardware."
                return
            }
        }
        tipoHardwareInstance.properties = params
        return [tipoHardwareInstance: tipoHardwareInstance]
    } //form para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que guarda la información de un elemento
     */
    def save_ajax() {
        def tipoHardwareInstance = new TipoHardware()
        if (params.id) {
            tipoHardwareInstance = TipoHardware.get(params.id)
            if (!tipoHardwareInstance) {
                render "ERROR*No se encontró TipoHardware."
                return
            }
        }
        tipoHardwareInstance.properties = params
        if (!tipoHardwareInstance.save(flush: true)) {
            render "ERROR*Ha ocurrido un error al guardar TipoHardware: " + renderErrors(bean: tipoHardwareInstance)
            return
        }
        render "SUCCESS*${params.id ? 'Actualización' : 'Creación'} de TipoHardware exitosa."
        return
    } //save para grabar desde ajax

    /**
     * Acción llamada con ajax que permite eliminar un elemento
     */
    def delete_ajax() {
        if (params.id) {
            def tipoHardwareInstance = TipoHardware.get(params.id)
            if (!tipoHardwareInstance) {
                render "ERROR*No se encontró TipoHardware."
                return
            }
            try {
                tipoHardwareInstance.delete(flush: true)
                render "SUCCESS*Eliminación de TipoHardware exitosa."
                return
            } catch (DataIntegrityViolationException e) {
                render "ERROR*Ha ocurrido un error al eliminar TipoHardware"
                return
            }
        } else {
            render "ERROR*No se encontró TipoHardware."
            return
        }
    } //delete para eliminar via ajax

    /**
     * Acción llamada con ajax que valida que no se duplique la propiedad codigo
     * @render boolean que indica si se puede o no utilizar el valor recibido
     */
    def validar_unique_codigo_ajax() {
        params.codigo = params.codigo.toString().trim()
        if (params.id) {
            def obj = TipoHardware.get(params.id)
            if (obj.codigo.toLowerCase() == params.codigo.toLowerCase()) {
                render true
                return
            } else {
                render TipoHardware.countByCodigoIlike(params.codigo) == 0
                return
            }
        } else {
            render TipoHardware.countByCodigoIlike(params.codigo) == 0
            return
        }
    }

}
