package soporte

import grails.transaction.Transactional

@Transactional
class TicketsService {

    def abrirTicket(Ticket ticket){
        ticket.cierre=null
    }
    def cerrarTicket(Ticket ticket){
        ticket.cierre= new Date()

    }
}
