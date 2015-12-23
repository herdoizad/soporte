<%@ page contentType="text/html"%>
<html>
<head>
    <title>AVISO DE RENOVACIÓN DE SERVICIO</title>

</head>
<body>
<table style="width: 650px;height: 60px;border: none;border-collapse: collapse">
    <tr>
        <td>
            <img src="cid:logo" style="height: 60px;float: left">
        </td>
        <td style="height: 60px">
            <h1 style="color:#006EB7;margin-top: 0px;width: 310px;text-align: center;font-weight: bold;font-size: 22px">
                PETROLEOS Y SERVICIOS<br/>
            </h1>
            Av. 6 de Diciembre N30-182 y Alpallana, Quito (593) (2) 381-9680
        </td>
    </tr>
    <tr>
        <td colspan="2"  style="border-top:1px solid #E03F23;height: 20px; ">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" style="background: #82A640;color: #ffffff;font-weight: bold;padding-left: 10px;width: 600px">
            AVISO DE RENOVACIÓN DE SERVICIO
        </td>
    </tr>
    <tr>
        <td colspan="2"  style="height: 20px; ">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2"  style="height: 10px; ">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            Estimado cliente:
        </td>
    </tr>
    <tr>
        <td colspan="2"  style="height: 10px; ">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            Le recordamos  el vencimiento de su contrato correspondiente a la estación:<br/>
            <b>${cliente.nombre}</b>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            Sirvace renovar su contrato antes del ${contrato.fin.format("dd-MM-yyyy")}
        </td>
    </tr>
    <tr>
        <td colspan="2"  style="height: 10px; ">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            Si al momento de recibir este aviso, usted ya ha renovado el servicio
            hacer caso omiso a este documento.
        </td>
    </tr>
    <tr>
        <td colspan="2"  style="height: 10px; ">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            Agradecemos su cordial atención.
        </td>
    </tr>

</table>


</body>
</html>