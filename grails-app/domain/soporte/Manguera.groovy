package soporte

class Manguera {

    Surtidor surtidor
    Producto producto
    Integer lado
    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_manguera'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            surtidor column:'surtidor_id'
            producto column:'producto_id'
            lado column:'lado'
        }
    }


    static constraints = {

    }
}
