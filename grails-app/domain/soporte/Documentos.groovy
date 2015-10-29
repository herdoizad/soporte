package soporte

class Documentos {

    String path
    Cliente cliente
    String descripcion

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_documento'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            path column: 'path'
            cliente column: 'cliente_id'
            descripcion column: 'descripcion'
        }
    }


    static constraints = {
        path(size: 1..100)
        descripcion(size: 1..250,nullable: true)
    }
}
