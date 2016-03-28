package soporte

import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes

class FElectronicasVencidasJob {
    static triggers = {
        simple name: 'felectronicasJob', startDelay: 1000*5, repeatInterval: 1000*60*60*24
    }

    def mailService

    def execute() {
        // execute job
        println "efacturas job "
        def now = new Date()
        def compare = now.plus(30)

        def tipo = TipoDeContrato.find(4);

        Contrato.findAllByTipoAndFinBetweenAndEstadoEmailIsNull(tipo,now,compare).each {contrato->
            println "enviando email a: "+contrato.cliente
            def emailcc = "gabriela.silva@petroleosyservicios.com"
            def cuerpo =
                    "<table style=\"width: 650px;height: 60px;border: none;border-collapse: collapse\">\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\"  style=\"height: 60px\">\n" +
                            "            <h1 style=\"color:#006EB7;margin-top: 0px;width: 310px;text-align: center;font-weight: bold;font-size: 22px\">\n" +
                            "                CONTROL SYSTEM<br/>\n" +
                            "            </h1>\n" +
                            "        </td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\"  style=\"height: 60px\">\n" +
                            "            <h2 style=\"margin-top: 0px;width: 310px;text-align: center;font-weight: bold;font-size: 16px\">\n" +
                            "                PETRÓLEOS Y SERVICIOS<br/>\n" +
                            "            </h2>\n" +
                            "            Av. 6 de Diciembre N30-182 y Alpallana, Quito (593) (2) 381-9680\n" +
                            "        </td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\"  style=\"border-top:1px solid #E03F23;height: 20px; \">&nbsp;</td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\" style=\"font-weight: bold;padding-left: 10px;width: 600px\">\n" +
                            "            <h1 style='color:red'>AVISO DE RENOVACIÓN DE CONTRATO DE FACTURA ELECTRÓNICA</h1>\n" +
                            "        </td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\"  style=\"height: 20px; \">&nbsp;</td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\"  style=\"height: 10px; \">&nbsp;</td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\">\n" +
                            "            Estimado cliente:\n" +
                            "        </td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\"  style=\"height: 10px; \">&nbsp;</td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\">\n" +
                            "            Le recordamos  el vencimiento de su contrato correspondiente a la estación:<br/>\n" +
                            "            <b>${contrato.cliente.nombre}</b>\n" +
                            "        </td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\">\n" +
                            "            Sirvase renovar su contrato antes del ${contrato.fin.format('dd-MM-yyyy')}\n" +
                            "        </td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\"  style=\"height: 10px; \">&nbsp;</td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\">\n" +
                            "            Si al momento de recibir este aviso, usted ya ha renovado el servicio o ha firmado\n" +
                            "            el contrato de renovación automática, favor hacer caso omiso a este documento.\n" +
                            "        </td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\"  style=\"height: 10px; \">&nbsp;</td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\">\n" +
                            "            Agradecemos su cordial atención.\n" +
                            "        </td>\n" +
                            "    </tr>\n" +
                            "    <tr>\n" +
                            "        <td colspan=\"2\">\n" +
                            "            Por favor comunicarse con soporte técnico o al: 0999361321 / 1800-PYSPYS \n" +
                            "        </td>\n" +
                            "    </tr>\n" +
                            "\n" +
                            "</table>\n" +
                            "\n"
            email=contrato.cliente.email
            mailService.sendMail {
                to email
                cc emailcc
                subject "Control system - AVISO DE RENOVACIÓN DE FACTURA ELECTRÓNICA"
                html cuerpo
            }
        }

    }
}
