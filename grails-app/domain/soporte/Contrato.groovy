package soporte

class Contrato {

    Cliente cliente
    TipoDeContrato tipo
    Date inicio
    Date fin
    String path
    String numero
    Double valor
    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_contrato'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            cliente column:'cliente_id'
            tipo column: 'tipo_contrato_id'
            inicio column:'fecha_inicio'
            fin column:'fecha_fin'
            path column:'path'
            numero column:'numero'
            valor column: 'valor'
        }
    }


    static constraints = {
        fin(nullable: true,blank:true)
        path(nullable: true,blank:true,size: 1..150)
        numero(nullable: true,blank:true,size: 1..20)
    }
}
