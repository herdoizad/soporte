<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Nueva visita</title>
    <style>
    h2{
        font-size: 18px;
    }
    </style>
</head>
<body>
<elm:message tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:message>
<elm:container tipo="horizontal" titulo="Registrar Visita">
    <g:form action="save_ajax" class="frm">
        <input type="hidden"  name="data" id="data">
        <div class="row">
            <div class="col-md-1">
                <label>Cliente</label>
            </div>
            <div class="col-md-3">
        <g:select name="codigo_cliente" from="${soporte.Cliente.list()}"
                  optionKey="codigo" optionValue="nombre" class="form-control input-sm"
        />
        </div>
        <div class="col-md-1">
            <label>Fecha</label>
        </div>
        <div class="col-md-2">
            <elm:datepicker name="fecha" value="${new java.util.Date()}" class="form-control input-sm"></elm:datepicker>
        </div>
        <div class="col-md-1">
            <label>Usuario:</label>
        </div>
        <div class="col-md-2">
            ${session.usuario.login}
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
                        <td style="width: 250px">${h.descripcion}</td>
                        <td style="width: 100px;text-align: center">
                            <input type="checkbox" class="chk" name="tipo_chk" value="1" checked>

                        </td>
                        <td>
                            <input type="text" class=" obs form-control input-sm" maxlength="255">
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
                        <td style="width: 250px">${s.descripcion}</td>
                        <td style="width: 100px;text-align: center" >
                            <input type="checkbox" class="chk"   name="tipo_chk" value="1" checked>
                        </td>
                        <td>
                            <input type="text" class="obs form-control input-sm" maxlength="255">
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <a href="#" class="btn btn-info" id="guardar">
                <i class="fa fa-save"></i> Guardar
            </a>
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
        onSwitchChange:cambiaTextfield
    });
    $(".chk").bootstrapSwitch("state",false)
    $("#guardar").click(function(){
        bootbox.confirm("Está seguro?",function(result){
            if(result){
                var data =""
                $(".tr-info").each(function(){
                    var item = $(this).attr("item")
                    var check = 0
                    if($(this).find(".chk").bootstrapSwitch("state")){
                        check=1
                    }
                    var obs = $(this).find(".obs").val()
                    if(check==1){
                        data+=item+";"+check+";"+obs+"|"
                    }
                });
                $("#data").val(data)
                $(".frm").submit()
            }
        })

        return false
    })
</script>
</body>
</html>