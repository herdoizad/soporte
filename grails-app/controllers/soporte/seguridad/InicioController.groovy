package soporte.seguridad

//import org.codehaus.groovy.grails.commons.ApplicationAttributes

class InicioController extends Shield {
    static final sistema="T"
    def index() {

    }

    def modulos(){

        def sistema = Sistema.findByCodigo(params.sistema)

        if(session.sistemas.id.contains(sistema.id)){
            session.sistema=sistema
        }else{
            response.sendError(403)
            return
        }
//        println "controlador "+sistema.controlador.nombre
        redirect(controller: sistema.controlador.nombre)


    }


    def demoUI() {

    }

    def parametros() {

    }
}


