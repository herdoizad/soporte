package soporte

class TipoHardware {
    String descripcion
    String codigo

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_tipo_hw'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            descripcion column: 'descripcion'
            codigo column: 'codigo'
        }
    }


    static constraints = {
        descripcion(size: 1..50)
        codigo(size: 1..5)
    }
}
