package soporte

class Software {

    String nombre
    String descripcion
    String ultimaVersion

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_software'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            nombre column: 'nombre'
            descripcion column: 'descripcion'
            ultimaVersion column: 'ultima_version'
        }
    }


    static constraints = {
        nombre(size: 1..150)
        descripcion(nullable: true, size: 1..300)
        ultimaVersion(nullable: true, size: 1..10)
    }
}
