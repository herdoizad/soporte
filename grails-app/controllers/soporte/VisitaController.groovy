package soporte

import org.springframework.dao.DataIntegrityViolationException
import soporte.seguridad.Shield


/**
 * Controlador que muestra las pantallas de manejo de Visita
 */
class VisitaController extends Shield {

    static allowedMethods = [save_ajax: "POST", delete_ajax: "POST"]

    /**
     * Acción que redirecciona a la lista (acción "list")
     */
    def index() {
        redirect(action: "nueva", params: params)
    }


    def nuevaVisita(){
        def hardware = ItemVisita.findAllByTipo("H",[sort:"codigo"])
        def software = ItemVisita.findAllByTipo("S",[sort:"codigo"])
        [hardware:hardware,software:software]
    }

    def verVisita(){
        def visita = Visita.get(params.id)
        def hw = ItemVisita.findAllByTipo("H",[sort:"codigo"])
        def sw = ItemVisita.findAllByTipo("S",[sort:"codigo"])
        def hardware = DetalleVisita.findAllByVisitaAndItemVisitaInList(visita,hw)
        def software = DetalleVisita.findAllByVisitaAndItemVisitaInList(visita,sw)
        [visita:visita,hardware:hardware,software:software]
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
            def c = Visita.createCriteria()
            list = c.list(params) {
                or {
                    /* TODO: cambiar aqui segun sea necesario */

                    ilike("observaciones", "%" + params.search + "%")
                }
            }
        } else {
            list = Visita.list(params)
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
        def visitaInstanceList = getList(params, false)
        def visitaInstanceCount = getList(params, true).size()
        return [visitaInstanceList: visitaInstanceList, visitaInstanceCount: visitaInstanceCount]
    }

    /**
     * Acción llamada con ajax que muestra la información de un elemento particular
     */
    def show_ajax() {
        if (params.id) {
            def visitaInstance = Visita.get(params.id)
            if (!visitaInstance) {
                render "ERROR*No se encontró Visita."
                return
            }
            return [visitaInstance: visitaInstance]
        } else {
            render "ERROR*No se encontró Visita."
        }
    } //show para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que muestra un formaulario para crear o modificar un elemento
     */
    def form_ajax() {
        def visitaInstance = new Visita()
        if (params.id) {
            visitaInstance = Visita.get(params.id)
            if (!visitaInstance) {
                render "ERROR*No se encontró Visita."
                return
            }
        }
        visitaInstance.properties = params
        return [visitaInstance: visitaInstance]
    } //form para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que guarda la información de un elemento
     */
    def save_ajax() {
        def visitaInstance = new Visita()
        if (params.id) {
            visitaInstance = Visita.get(params.id)
            if (!visitaInstance) {
                render "ERROR*No se encontró Visita."
                return
            }
        }
        visitaInstance.properties = params
        visitaInstance.cliente=Cliente.findByCodigo(params.codigo_cliente)
        visitaInstance.usuario=session.usuario
        if (!visitaInstance.save(flush: true)) {
            render "ERROR*Ha ocurrido un error al guardar Visita: " + renderErrors(bean: visitaInstance)
            return
        }else{
            def data = params.data
            if(data.size()>0){
                data = data.split("\\|")
                println "data "+data
                data.each {
                    if(it.size()>2){
                        def parts = it.split(";")
                        println "parts "+parts
                        def detalle = new DetalleVisita()
                        detalle.visita=visitaInstance
                        detalle.itemVisita=ItemVisita.get(parts[0])
                        detalle.estado="R"
                        if(parts.size()>2)
                            detalle.observaciones=parts[2]

                        detalle.save(flush: true)
                    }

                }
            }
        }
        flash.message="Visita registrada"
        redirect(action: "nuevaVisita")
    } //save para grabar desde ajax

    /**
     * Acción llamada con ajax que permite eliminar un elemento
     */
    def delete_ajax() {
        if (params.id) {
            def visitaInstance = Visita.get(params.id)
            if (!visitaInstance) {
                render "ERROR*No se encontró Visita."
                return
            }
            try {
                visitaInstance.delete(flush: true)
                render "SUCCESS*Eliminación de Visita exitosa."
                return
            } catch (DataIntegrityViolationException e) {
                render "ERROR*Ha ocurrido un error al eliminar Visita"
                return
            }
        } else {
            render "ERROR*No se encontró Visita."
            return
        }
    } //delete para eliminar via ajax

}
