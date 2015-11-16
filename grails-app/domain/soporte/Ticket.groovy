package soporte

import groovy.time.TimeCategory
import soporte.seguridad.Persona

class Ticket {

    Cliente cliente
    Persona usuario
    Estado estado
    Prioridad prioridad
    Categoria categoria
    Origen origen
    Date registro = new Date()
    Date fecha
    Date cierre
    String descripcion
    String observaciones
    String fuente
    String ip
    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_ticket'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            cliente column:'cliente_id'
            usuario column:'usuario_id'
            estado column:'estado_id'
            prioridad  column:'prioridad_id'
            categoria column:'categoria_id'
            origen column:'origen_id'
            registro column:'fecha_registro'
            registro column:'fecha_evento'
            cierre column:'fecha_cierre'
            descripcion column: 'descripcion'
            observaciones column:'observaciones'
            fuente column: 'fuente'
            ip column: 'ip'
        }
    }


    static constraints = {
        descripcion(size: 1..600)
        cierre(nullable: true)
        observaciones(size: 1..1024,nullable: true,blank: true)
        fuente(size: 1..1,nullable: true,blank: true)
        ip(nullable: true,blank: true,size: 1..20)
    }


    def getColorSemaforo(){
        def colores = ['card-bg-green','svt-bg-warning','svt-bg-danger']
        def now = new Date()
        def fechaLimite=this.fecha
        use( TimeCategory ) {
            fechaLimite = fechaLimite + this.categoria.tiempo.hours
        }
        if(fechaLimite<now)
            return colores[2]
       def dif
        use(groovy.time.TimeCategory) {
             dif = now - fechaLimite
             println "dif "+dif.minutes+"  "
            if(dif.minutes<10)
                return colores[1]
        }
        return colores[0]
    }

}
