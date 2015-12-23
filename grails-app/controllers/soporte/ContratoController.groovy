package soporte


import org.springframework.dao.DataIntegrityViolationException
import soporte.seguridad.Shield


/**
 * Controlador que muestra las pantallas de manejo de Contrato
 */
class ContratoController extends Shield {

    static allowedMethods = [save_ajax: "POST", delete_ajax: "POST"]
    def mailService
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
            def c = Contrato.createCriteria()
            list = c.list(params) {
                or {
                    /* TODO: cambiar aqui segun sea necesario */

                    ilike("numero", "%" + params.search + "%")
                    ilike("path", "%" + params.search + "%")
                }
            }
        } else {
            list = Contrato.list(params)
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
        def contratoInstanceList = getList(params, false)
        def contratoInstanceCount = getList(params, true).size()
        return [contratoInstanceList: contratoInstanceList, contratoInstanceCount: contratoInstanceCount]
    }

    /**
     * Acción llamada con ajax que muestra la información de un elemento particular
     */
    def show_ajax() {
        if (params.id) {
            def contratoInstance = Contrato.get(params.id)
            if (!contratoInstance) {
                render "ERROR*No se encontró Contrato."
                return
            }
            return [contratoInstance: contratoInstance]
        } else {
            render "ERROR*No se encontró Contrato."
        }
    } //show para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que muestra un formaulario para crear o modificar un elemento
     */
    def form_ajax() {
        def contratoInstance = new Contrato()
        if (params.id) {
            contratoInstance = Contrato.get(params.id)
            if (!contratoInstance) {
                render "ERROR*No se encontró Contrato."
                return
            }
        }
        contratoInstance.properties = params
        return [contratoInstance: contratoInstance]
    } //form para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que guarda la información de un elemento
     */
    def save_ajax() {
        def contratoInstance = new Contrato()
        if (params.id) {
            contratoInstance = Contrato.get(params.id)
            if (!contratoInstance) {
                render "ERROR*No se encontró Contrato."
                return
            }
        }
        contratoInstance.properties = params
        contratoInstance.cliente=Cliente.findByCodigo(params.codigo_cliente)
        def f = request.getFile('file')
        def ext2
        if(f && !f.empty){

            def nombre = f.getOriginalFilename()
            def parts2 = nombre.split("\\.")
            nombre = ""
            parts2.eachWithIndex { obj, i ->
                if (i < parts2.size() - 1) {
                    nombre += obj
                } else {
                    ext2 = obj
                }
            }
            def path = servletContext.getRealPath("/") + "contratos/" + contratoInstance.cliente.codigo+ "/"
            def pathLocal = "contrato/"
            if(ext2 == 'pdf' || ext2 == 'PDF'){
                /* upload */
                new File(path).mkdirs()
                if (f && !f.empty) {

                    def fileName = f.getOriginalFilename()
                    def ext

                    def parts = fileName.split("\\.")
                    fileName = ""
                    parts.eachWithIndex { obj, i ->
                        if (i < parts.size() - 1) {
                            fileName += obj
                        }
                    }
                    def name = "contrato_"+new Date().format("ddMMyyyyHHssmm")+"."+ext2
                    def pathFile = path + name
                    def fn = fileName
                    def src = new File(pathFile)
                    def i = 1
                    while (src.exists()) {
                        nombre = fn + "_" + i + "." + ext2
                        pathFile = path + nombre
                        src = new File(pathFile)
                        i++
                    }
                    try {
                        f.transferTo(new File(pathFile))
                        contratoInstance.path=pathLocal+name


                    } catch (e) {
                        println "????????\n" + e + "\n???????????"
                    }
                }

            }

        }
        if (!contratoInstance.save(flush: true)) {
            render "ERROR*Ha ocurrido un error al guardar Contrato: " + renderErrors(bean: contratoInstance)
            return
        }
        redirect(controller: 'cliente',action: 'verCliente',id: contratoInstance.cliente.codigo)
        return
    } //save para grabar desde ajax

    /**
     * Acción llamada con ajax que permite eliminar un elemento
     */
    def delete_ajax() {
        if (params.id) {
            def contratoInstance = Contrato.get(params.id)
            if (!contratoInstance) {
                render "ERROR*No se encontró Contrato."
                return
            }
            try {
                contratoInstance.delete(flush: true)
                render "SUCCESS*Eliminación de Contrato exitosa."
                return
            } catch (DataIntegrityViolationException e) {
                render "ERROR*Ha ocurrido un error al eliminar Contrato"
                return
            }
        } else {
            render "ERROR*No se encontró Contrato."
            return
        }
    } //delete para eliminar via ajax


    def nuevo(){
        def cliente = Cliente.findByCodigo(params.cliente)
        def contrato = new Contrato()
        if(params.id && params.id!=""){
            contrato= Contrato.get(params.id)
        }
        println "contrato "+contrato
        [cliente:cliente,contratoInstance: contrato]
    }

    def enviarEmailContratoVencido(Contrato contrato){
        def email = "valentinsvt@hotmail.com"
//        email=contrato.cliente.email
        mailService.sendMail {
            multipart true
            to email
            subject "Control system - AVISO DE RENOVACIÓN DE SERVICIO"
            body( view:"mailContrato",
                    model:[cliente: contrato.cliente,contrato:contrato])
            inline 'logo','image/png',grailsApplication.mainContext.getResource('/images/logo-login.png').getFile().readBytes()
        }
    }

}
