package soporte

class Surtidor {

    Cliente cliente
    Hardware hardware
    Integer mangueras
    String observaciones
    String estado="A"

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_surtidor'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            cliente column:'cliente_id'
            hardware column:'hardware_id'
            mangueras column:'cantidad_mangueras'
            observaciones column:'observaciones'
            estado column:'estado'
        }
    }


    static constraints = {
        observaciones(size: 1..255,nullable: true)
        estado(size: 1..1)
    }
}
