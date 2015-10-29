package soporte

class Correo {

    String tipo /*R o C*/
    String email
    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_correo'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            tipo column: 'tipo'
            email column: 'email'
        }
    }


    static constraints = {

        email(size: 1..100,nullable: true,email: true)
        tipo(size: 1..1)
    }
}
