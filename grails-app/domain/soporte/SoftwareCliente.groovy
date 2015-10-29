package soporte

class SoftwareCliente {

    Cliente cliente
    Software software
    String versionSoftware
    Date instalacion
    String estado="A"

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_software_cliente'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            cliente column:'cliente_id'
            software column:'software_id'
            versionSoftware column:'version'
            instalacion column:'fecha_instalacion'
            estado column:'estado'
        }
    }


    static constraints = {
        estado(size: 1..1)
        versionSoftware(size: 1..10)
        instalacion(nullable: true)
    }
}
