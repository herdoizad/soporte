package soporte

class Producto {

    String nombre

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_producto'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            nombre column: 'nombre'
        }
    }


    static constraints = {
        nombre(size: 1..75)
    }
    String toString(){
        return this.nombre
    }
}
