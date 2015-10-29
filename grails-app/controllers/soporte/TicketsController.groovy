package soporte

import groovy.time.TimeCategory
import soporte.seguridad.Shield

class TicketsController  extends Shield{

    def index() {}
    def nuevo(){

    }

    def save_ajax(){
        def cliente = Cliente.findByCodigo(params.cliente_codigo)
        def ticket = new Ticket(params)
        if(params.id){
            ticket=Ticket.get(params.id)
            ticket.properties=params
        }
        ticket.cliente=cliente
        if(!ticket.estado){
            ticket.estado=Estado.findByCodigo("P01")
        }
        if(!ticket.usuario){
            ticket.usuario=session.usuario
        }
        if(!ticket.save(flush: true))
            println "error save ticket "+ticket.errors
        redirect(action: 'verTicket',id: ticket.id)
    }

    def verTicket(){
        def ticket = Ticket.get(params.id)
        def fechaLimite=ticket.fecha
        use( TimeCategory ) {
            fechaLimite = fechaLimite + ticket.prioridad.alerta.hours
        }
        def acciones = AccionTomada.findAllByTicket(ticket,[sort:"fecha"])

        [ticket:ticket,fechaLimite:fechaLimite,accciones:acciones]
    }

    def saveAccion_ajax(){
        def accion = new AccionTomada()
        accion.usuario=session.usuario
        accion.fecha=new Date()
        accion.resumen=params.resumen
        accion.ticket=Ticket.get(params.ticket)
        accion.save(flush: true)
        redirect(action: "verTicket",id: accion.ticket.id)
    }

}
