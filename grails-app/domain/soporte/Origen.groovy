package soporte

class Origen {

    String descripcion
    String codigo

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_origen'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            descripcion column: 'descripcion'
            codigo column: 'codigo'
        }
    }


    static constraints = {
        descripcion(size: 1..100)
        codigo(size: 1..5)
    }
    String toString(){
        return this.descripcion
    }
}
