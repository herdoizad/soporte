package soporte

class Actualizacion {

    Date fecha
    String versionSoftware
    String observaciones

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_actualiazacion'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            fecha column:'fecha'
            versionSoftware column:'version'
            observaciones column:'observaciones'
        }
    }


    static constraints = {
        version(size: 1..10)
        observaciones(size: 1..500)
    }
}
