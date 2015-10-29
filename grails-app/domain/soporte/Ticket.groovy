package soporte

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
        }
    }


    static constraints = {
        descripcion(size: 1..200)
        cierre(nullable: true)
        observaciones(size: 1..1024,nullable: true,blank: true)
    }
}
