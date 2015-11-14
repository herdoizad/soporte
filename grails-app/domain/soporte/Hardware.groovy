package soporte

class Hardware {

    String nombre
    String modelo
    String marca
    TipoHardware tipo
    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_hardware'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            nombre column: 'nombre'
            modelo column: 'modelo'
            marca column: 'marca'
            tipo column: 'tipo'
        }
    }


    static constraints = {
        nombre(size: 1..150)
        modelo(nullable: true, size: 1..20)
        marca(nullable: true, size: 1..50)
        tipo(nullable: true)
    }
}
