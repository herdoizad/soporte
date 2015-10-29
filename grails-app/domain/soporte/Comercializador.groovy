package soporte

class Comercializador implements Serializable{

    String codigo
    String nombre

    static auditable = [ignore: []]

    /**
     * Define el mapeo entre los campos del dominio y las columnas de la base de datos
     */
    static mapping = {

        table 'comercializadora'
        cache usage: 'read-write', include: 'non-lazy'
        version false
        id name: "codigo", generator: 'assigned', type:"string"
        columns {
            nombre column: 'nombre'
            codigo column: 'comercializadora'
        }
    }


    static constraints = {
        nombre(size: 1..60)
        codigo(size: 1..2)
    }

    String toString(){
        return this.nombre
    }
}
