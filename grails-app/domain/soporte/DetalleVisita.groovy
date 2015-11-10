package soporte

class DetalleVisita {

    Visita visita
    ItemVisita itemVisita
    String estado
    String observaciones

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_detalle_visita'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            visita column: 'visita_id'
            itemVisita column: 'item_id'
            estado column: 'estado'
            observaciones column: 'observaciones'
        }
    }


    static constraints = {
        estado(size: 1..1)
        observaciones(nullable: true,size: 1..255)
    }
}
