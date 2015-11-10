<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Visita</title>
    <style>
    h2{
        font-size: 18px;
    }
    </style>
</head>
<body>
<elm:message tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:message>
<elm:container tipo="horizontal" titulo="Visita">
    <g:form action="save_ajax" class="frm">
        <input type="hidden"  name="data" id="data">
        <div class="row">
            <div class="col-md-1">
                <label>Cliente</label>
            </div>
            <div class="col-md-3">
                ${visita.cliente.nombre}
             </div>
        <div class="col-md-1">
            <label>Fecha</label>
        </div>
        <div class="col-md-2">
        ${visita.fecha?.format("dd-MM-yyyy")}
        </div>
        <div class="col-md-1">
            <label>Usuario:</label>
        </div>
        <div class="col-md-2">
            ${visita.usuario.nombre}
        </div>
    </g:form>
    </div>
    <div class="row">
        <div class="col-md-2">
            <h2> Hardware <span style="float: right;margin-right: 15px" id="contactos" class="control"><i class="fa flaticon-cement"></i></span></h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-condensed ">
                <thead>
                <tr>
                    <th style="background: none;color: black">Item</th>
                    <th style="background: none;color: black">Revisado</th>
                    <th style="background: none;color: black">Observaciones</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${hardware}" var="h">
                    <tr class="tr-info" item="${h.id}">
                        <td style="width: 250px">${h.itemVisita.descripcion}</td>
                        <td style="width: 100px;text-align: center">
                            <input type="checkbox" class="chk" name="tipo_chk" value="1" checked>

                        </td>
                        <td>
                            <input type="text" class=" obs form-control input-sm" disabled maxlength="255" value="${h.observaciones}">
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <h2> Software <span style="float: right;margin-right: 15px" id="software" class="control"><i class="fa icon-csharp"></i></span></h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-condensed ">
                <thead>
                <tr>
                    <th style="background: none;color: black">Item</th>
                    <th style="background: none;color: black">Revisado</th>
                    <th style="background: none;color: black">Observaciones</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${software}" var="s">
                    <tr class="tr-info" item="${s.id}">
                        <td style="width: 250px">${s.itemVisita.descripcion}</td>
                        <td style="width: 100px;text-align: center" >
                            <input type="checkbox" class="chk"   name="tipo_chk" value="1" checked>
                        </td>
                        <td>
                            <input type="text" class="obs form-control input-sm" disabled maxlength="255" value="${s.observaciones}">
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>

</elm:container>
<script>
    function cambiaTextfield(){
        var txt = $(this).parents("td").parent().find(".obs")
        if($(this).bootstrapSwitch("state")) {
            txt.prop('disabled', false);
            txt.focus()
        }else{
            txt.val("")
            txt.prop('disabled', true);
        }
    }
    $(".chk").bootstrapSwitch({
        size:'mini',
        onText:"Si",
        offText:"No",
        offColor:"danger",
        onSwitchChange:cambiaTextfield,
        disabled:true
    });

</script>
</body>
</html>