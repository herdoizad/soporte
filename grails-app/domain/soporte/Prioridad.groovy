package soporte

class Prioridad {

    String descripcion
    String codigo
    Integer alerta //minutos
    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'spt_prioridad'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        columns {
            id column:'id'
            descripcion column: 'descripcion'
            codigo column: 'codigo'
            alerta column: 'alerta'
        }
    }


    static constraints = {
        descripcion(size: 1..100)
        codigo(size: 1..5)
        alerta(nullable: true)
    }
    String toString(){
        return this.descripcion
    }
}
