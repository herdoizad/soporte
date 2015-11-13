package soporte

class Cliente {
    String codigo
    String nombre
    Integer estado=1
    String direccion
    String propietario
    String telefono
    Comercializador comercializador
    String email
    Double latitud
    Double longitud

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'cliente_sistema'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        id name: "codigo", generator: 'assigned', type:"string"
        columns {
            codigo column: 'codigo_cliente'
            nombre column:'nombre_cliente'
            estado column: 'estado_sistema'
            propietario column: 'propietario'
            comercializador column: 'comercializadora'
            email column:'email'
            latitud column:'latitud'
            longitud column:'longitud'
            direccion column: 'direccion'
            telefono column: 'telefono'
        }
    }


    static constraints = {
        nombre(size: 1..40)
        email (size: 1..100,nullable: true)
        latitud(nullable: true)
        longitud(nullable: true)
        direccion(nullable: true,size: 1..250,blank: true)
        propietario(nullable: true,size: 1..100,blank: true)
        telefono(nullable: true,size: 1..10,blank: true)

    }
    
    
    def getTicketsActivos(){
        return Ticket.findAllByClienteAndEstado(this,Estado.findByCodigo("P01"))
    }

    def getColorUltimaVisita(){
        def visita = Visita.findAllByCliente(this,[sort:"fecha",order:"desc"])
        if(visita.size()==0)
            return 0
        else{
            if(new Date()-visita.first().fecha>360){
                return 0
            }else{
                return 1
            }
        }
    }

}
