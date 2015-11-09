package soporte.seguridad

import groovy.sql.Sql
import soporte.Categoria
import soporte.Estado
import soporte.Ticket

//import org.codehaus.groovy.grails.commons.ApplicationAttributes

class InicioController extends Shield {
    static final sistema="T"
    def dataSource
    def index() {
        def abiertos = Ticket.findAllByEstado(Estado.findByCodigo("P01"),[sort:"fecha",order:"asc"])
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
        /*Grafico de categorias*/
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
        def masAntiguo = null
        def duracionMasAntiguo = null
        def datosHS=[0,0]
        /*tickets por meses*/
        def meses ="['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']"
        def datosMeses=[0,0,0,0,0,0,0,0,0,0,0,0]
        (abiertos+cerrados).each {ticket->

            /*Datos por mes*/
            def mes = ticket.fecha.format("MM").toInteger()-1
            datosMeses[mes]++

            /*fin datos por mes*/
            datosCategorias[indice[ticket.categoria.descripcion]]++
            /*Grafico de hardware vs software*/
            if(ticket.categoria.tipo=="H")
                datosHS[0]++
            else
                datosHS[1]++
            if(ticket.estado.codigo=="P02"){

                use(groovy.time.TimeCategory) {
                    def duration = ticket.cierre-ticket.fecha
                    tiempos.add(duration.seconds+duration.minutes*60+duration.hours*60*60+duration.days*24*60*60)
                }


            }else{
                if(!masAntiguo){
                    masAntiguo=ticket
                    use(groovy.time.TimeCategory) {
                        duracionMasAntiguo = new Date() - ticket.fecha
                    }
                }else{
                    if(ticket.fecha<masAntiguo.fecha){
                        masAntiguo=ticket
                        use(groovy.time.TimeCategory) {
                            duracionMasAntiguo=new Date() - ticket.fecha
                        }
                    }
                }
            }
        }
        categorias+="]"
        def promedio = 0
        if(tiempos.size()>0)
            promedio = tiempos.sum()/tiempos.size()

        /*tickets por estacion*/
        def sql ="select c.nombre_cliente as cliente,count(*) as num from spt_ticket s,cliente_sistema c where c.codigo_cliente=s.cliente_id  group by 1 order by 2 desc limit 6;"
        def cn = new Sql(dataSource)
        def clientes = "["
        def datosClientes=[]
        cn.eachRow(sql.toString()){r->
            if(r["cliente"].length()>15){
                clientes+="'"+r["cliente"].substring(0,15)+"',"
            }else{
                clientes+="'"+r["cliente"]+"',"
            }

            datosClientes.add(r["num"])
        }
        clientes=clientes.substring(0,clientes.length()-1)
        clientes+="]"


        [abiertos:abiertos,hoyAbiertos:hoyAbiertos,totalDia:hoyAbiertos.size()+hoyCerrados.size(),masAntiguo:masAntiguo,duracionMasAntiguo:duracionMasAntiguo,
         cerrados:cerrados,categorias:categorias,datosCategorias:datosCategorias,datosHS:datosHS,clientes:clientes,datosClientes:datosClientes,meses:meses,datosMeses:datosMeses,
         totalSemana:semanaAbiertos.size()+semanaCerrados.size(), pDia:(int)porcentajeDia,pSemana:(int)porcentajeSemana,pTotal:(int)pTotal,promedio:promedio]
    }




    def demoUI() {

    }

    def parametros() {

    }
}


