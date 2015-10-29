package soporte

import org.springframework.dao.DataIntegrityViolationException
import soporte.seguridad.Shield


/**
 * Controlador que muestra las pantallas de manejo de Cliente
 */
class ClienteController extends Shield {

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
            def c = Cliente.createCriteria()
            list = c.list(params) {
                or {
                    /* TODO: cambiar aqui segun sea necesario */

                    ilike("codigo", "%" + params.search + "%")
                    ilike("direccion", "%" + params.search + "%")
                    ilike("email", "%" + params.search + "%")
                    ilike("nombre", "%" + params.search + "%")
                    ilike("propietario", "%" + params.search + "%")
                    ilike("telefono", "%" + params.search + "%")
                }
            }
        } else {
            list = Cliente.list(params)
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
        def clientes = Cliente.list([sort: "nombre"])
        return [clientes:clientes]
    }

    /**
     * Acción llamada con ajax que muestra la información de un elemento particular
     */
    def show_ajax() {
        if (params.id) {
            def clienteInstance = Cliente.findByCodigo(params.id)
            if (!clienteInstance) {
                render "ERROR*No se encontró Cliente."
                return
            }
            return [clienteInstance: clienteInstance]
        } else {
            render "ERROR*No se encontró Cliente."
        }
    } //show para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que muestra un formaulario para crear o modificar un elemento
     */
    def form_ajax() {
        def clienteInstance = new Cliente()
        if (params.id) {
            clienteInstance = Cliente.findByCodigo(params.id)
            if (!clienteInstance) {
                render "ERROR*No se encontró Cliente."
                return
            }
        }
        clienteInstance.properties = params
        return [clienteInstance: clienteInstance]
    } //form para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que guarda la información de un elemento
     */
    def save_ajax() {
        def clienteInstance = new Cliente()
        if (params.id) {
            clienteInstance = Cliente.findByCodigo(params.id)
            if (!clienteInstance) {
                render "ERROR*No se encontró Cliente."
                return
            }
        }
        clienteInstance.properties = params
        clienteInstance.comercializador=Comercializador.findByCodigo(params.comercializadora)
        if (!clienteInstance.save(flush: true)) {
            render "ERROR*Ha ocurrido un error al guardar Cliente: " + renderErrors(bean: clienteInstance)
            return
        }
        render "${clienteInstance.codigo}"
        return
    } //save para grabar desde ajax

    /**
     * Acción llamada con ajax que permite eliminar un elemento
     */
    def delete_ajax() {
        if (params.id) {
            def clienteInstance = Cliente.findByCodigo(params.id)
            if (!clienteInstance) {
                render "ERROR*No se encontró Cliente."
                return
            }
            try {
                clienteInstance.delete(flush: true)
                render "SUCCESS*Eliminación de Cliente exitosa."
                return
            } catch (DataIntegrityViolationException e) {
                render "ERROR*Ha ocurrido un error al eliminar Cliente"
                return
            }
        } else {
            render "ERROR*No se encontró Cliente."
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
            def obj = Cliente.get(params.id)
            if (obj.codigo.toLowerCase() == params.codigo.toLowerCase()) {
                render true
                return
            } else {
                render Cliente.countByCodigoIlike(params.codigo) == 0
                return
            }
        } else {
            render Cliente.countByCodigoIlike(params.codigo) == 0
            return
        }
    }

    /**
     * Acción llamada con ajax que valida que no se duplique la propiedad email
     * @render boolean que indica si se puede o no utilizar el valor recibido
     */
    def validar_unique_email_ajax() {
        params.email = params.email.toString().trim()
        if (params.id) {
            def obj = Cliente.findByCodigo(params.id)
            if (obj.email.toLowerCase() == params.email.toLowerCase()) {
                render true
                return
            } else {
                render Cliente.countByEmailIlike(params.email) == 0
                return
            }
        } else {
            render Cliente.countByEmailIlike(params.email) == 0
            return
        }
    }


    def verCliente(){
        def cliente = Cliente.findByCodigo(params.id)
        def ultimaVisita = Visita.findAllByCliente(cliente,[sort: "fecha",order:"desc"])
        if(ultimaVisita.size()>0)
            ultimaVisita=ultimaVisita.first()
        else
            ultimaVisita=null
        def ultimoTicket = Ticket.findAllByCliente(cliente,[sort: "fecha",order:"desc"])
        if(ultimoTicket.size()>0)
            ultimoTicket=ultimoTicket.first()
        else
            ultimoTicket=null
        def contactos = Contactos.findAllByCliente(cliente,[sort: "nombre"])
        def software = SoftwareCliente.findAllByCliente(cliente)
        def hardware = HardwareCliente.findAllByCliente(cliente)
        def contrato =  Contrato.findAllByCliente(cliente,[sort: "fin",order:"desc"])
        if(contrato.size()>0)
            contrato=contrato.first()
        else
            contrato=null
        [cliente:cliente,ultimaVisita:ultimaVisita,ultimoTicket:ultimoTicket,contactos:contactos,software:software,hardware:hardware,contrato:contrato]
    }


    def contratos_ajax(){
        def cliente = Cliente.findByCodigo(params.cliente)
        def contratos = Contrato.findAllByCliente(cliente,[sort: "fin",order: "desc"])
        [contratos:contratos,cliente: cliente]
    }

}
