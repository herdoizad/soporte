package soporte.seguridad

class PruebasController {

    def links(){

        def usuario = Persona.findByLogin("OROZCOP")
        def perfil = Perfil.findByCodigo("1")
        def token =""
        token+= new Date().format("ddMMyyyy").encodeAsMD5()
        token=usuario.login+"|"+perfil.codigo.encodeAsMD5()+"|"+token+"|"+usuario.password
        def linkUsu = "" +g.createLink(action: 'remoteLogin',controller: 'login')+"?token="+token
        def linkEstacion
        usuario = Persona.findByLogin("MOLINAJ")

//        mailService.sendMail {
//            to "valentinsvt@hotmail.com"
//            subject "Hello Fred"
//            body 'How are you?'
//        }
        [linkUsu:linkUsu]

    }
}
