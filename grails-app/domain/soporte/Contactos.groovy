package soporte

class Contactos {

    Cliente cliente
    String nombre
    String telefono
    String email
    String estado = "A"
    String condicion

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_contactos'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            cliente column: 'cliente_id'
            nombre column: 'nombre'
            telefono column: 'telefono'
            email column: 'email'
            estado column: 'estado'
            condicion column: 'condicion'
        }
    }


    static constraints = {
        nombre(size: 1..75)
        telefono(size: 1..10)
        email(size: 1..100,nullable: true,email: true)
        estado(size: 1..1)
        condicion(size: 1..1,nullable: true)
    }
}
