package soporte

import soporte.seguridad.Persona

class Turno {

    Persona usuario
    Date inicio
    Date fin

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_turno'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            usuario column:'usuario'
            inicio column:'fecha_inicio'
            fin column:'fecha_fin'
        }
    }


    static constraints = {

    }
}
