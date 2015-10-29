package soporte

class TipoDeContrato {

    String descripcion
    String condiciones

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_tipo_contrato'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            descripcion column: 'descripcion'
            condiciones column: 'condiciones'
        }
    }


    static constraints = {
        descripcion(size: 1..100)
        condiciones(size: 1..500,nullable: true)
    }
}
