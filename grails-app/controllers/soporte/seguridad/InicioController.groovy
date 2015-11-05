package soporte.seguridad

import soporte.Categoria
import soporte.Estado
import soporte.Ticket

//import org.codehaus.groovy.grails.commons.ApplicationAttributes

class InicioController extends Shield {
    static final sistema="T"
    def index() {
        def abiertos = Ticket.findAllByEstado(Estado.findByCodigo("P01"))
        def hoyAbiertos = Ticket.findAllByEstadoAndFechaBetween(Estado.findByCodigo("P01"),new Date().clearTime(),new Date().clearTime().plus(1))
        def hoyCerrados = Ticket.findAllByEstadoAndFechaBetween(Estado.findByCodigo("P02"),new Date().clearTime(),new Date().clearTime().plus(1))
        def now = new Date().clearTime()
        def firstDay = now - (now.calendarDate.dayOfWeek-2)
        println "first "+firstDay
        def semanaAbiertos = Ticket.findAllByEstadoAndFechaBetween(Estado.findByCodigo("P01"),firstDay,firstDay.plus(5))
        def semanaCerrados = Ticket.findAllByEstadoAndFechaBetween(Estado.findByCodigo("P02"),firstDay,firstDay.plus(5))
        def porcentajeDia = 0
        def porcentajeSemana = 0
        if(hoyAbiertos.size() + hoyCerrados.size() >0){
            porcentajeDia = Math.ceil(hoyCerrados.size()*100/(hoyAbiertos.size()+hoyCerrados.size()))
        }
        if(semanaAbiertos.size() + semanaCerrados.size() >0){
            porcentajeSemana = Math.ceil(semanaCerrados.size()*100/(semanaAbiertos.size()+semanaCerrados.size()))
        }
        def cerrados = Ticket.findAllByEstado(Estado.findByCodigo("P02"))
        def pTotal = 0
        if(cerrados.size()>0){
            pTotal =  Math.ceil(cerrados.size()*100/(abiertos.size()+cerrados.size()))
        }
        def lista=  Categoria.list()
        def categorias = "["
        def datosCategorias = []
        def indice = [:]
        lista.eachWithIndex {it,i->
            categorias+="'${it.descripcion}'"
            indice.put(it.descripcion,i)
            datosCategorias.add(0)
            if(i<lista.size()-1){
                categorias+=","
            }
        }
        def tiempos = []
        (abiertos+cerrados).each {ticket->
            datosCategorias[indice[ticket.categoria.descripcion]]++
            if(ticket.estado.codigo=="P02"){
                use(groovy.time.TimeCategory) {
                    def duration = ticket.cierre-ticket.fecha
                    tiempos.add(duration.seconds+duration.minutes*60+duration.hours*60*60+duration.days*24*60*60)
                }


            }
        }
        categorias+="]"
        def promedio = 0
        if(tiempos.size()>0)
            promedio = tiempos.sum()/tiempos.size()
        [abiertos:abiertos,hoyAbiertos:hoyAbiertos,totalDia:hoyAbiertos.size()+hoyCerrados.size(),cerrados:cerrados,categorias:categorias,datosCategorias:datosCategorias,
         totalSemana:semanaAbiertos.size()+semanaCerrados.size(), pDia:(int)porcentajeDia,pSemana:(int)porcentajeSemana,pTotal:(int)pTotal,promedio:promedio]
    }




    def demoUI() {

    }

    def parametros() {

    }
}


