package soporte

import soporte.seguridad.Persona

class Visita {

    Cliente cliente
    Persona usuario
    Date fecha
    String observaciones

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_visita'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            cliente column:'cliente_id'
            usuario column:'usuario_id'
            fecha column:'fecha'
            observaciones column:'observaciones'
            observaciones type: "text"
        }
    }


    static constraints = {
        observaciones(nullable: true)
    }
}
