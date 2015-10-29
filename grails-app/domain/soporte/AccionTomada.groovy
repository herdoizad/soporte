package soporte

import soporte.seguridad.Persona

class AccionTomada {

    Ticket ticket
    Persona usuario
    Date fecha
    String resumen

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_accion_tomada'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            ticket column:'ticket_id'
            usuario column:'usuario_id'
            fecha column:'fecha'
            resumen column:'resumen'
            resumen type: 'text'
        }
    }


    static constraints = {

    }
}
