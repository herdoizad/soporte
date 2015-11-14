package soporte

class HardwareCliente {

    Cliente cliente
    Hardware hardware
    Double cantidad = 1
    String observaciones
    String estado="A"  /*A-> activo */
    Date instalacion
    String versionHardware

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_hardware_cliente'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            cliente column:'cliente_id'
            hardware column:'hardware_id'
            cantidad column:'cantidad'
            observaciones column:'observaciones'
            estado column:'estado'
            instalacion column:'fecha_instalacion'
            versionHardware column: 'version'
        }
    }


    static constraints = {
        observaciones(size: 1..250,nullable: true,blank: true)
        estado(size: 1..1)
        instalacion(nullable: true)
        versionHardware(nullable: true,blank: true,size: 1..10)
    }
}
