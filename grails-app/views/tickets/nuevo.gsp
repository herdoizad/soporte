<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Nuevo ticket</title>
    <meta name="layout" content="main"/>
    <imp:js src="${resource(dir: 'js/plugins/bootstrap-combobox/js', file: 'bootstrap-combobox.js')}"/>
    <imp:css src="${resource(dir: 'js/plugins/bootstrap-combobox/css', file: 'bootstrap-combobox.css')}"/>
</head>
<body>
<elm:container tipo="horizontal" titulo="Nuevo ticket">
    <g:form class="frm" action="save_ajax">
        <div class="row fila">
            <div class="col-md-1">
                <label>Cliente:</label>
            </div>
            <div class="col-md-3">
                <g:select name="cliente_codigo" from="${soporte.Cliente.list([sort: 'nombre'])}" noSelection="['':'']"
                          optionKey="codigo" optionValue="nombre" class="form-control input-sm select required"
                />
            </div>


            <div class="col-md-1">
                <label>Categoría:</label>
            </div>
            <div class="col-md-2">
                <input type="checkbox" class="chk" id="tipo" name="tipo_chk" value="1" checked>
                <input type="hidden" name="tipo" id="tipo-txt" value="1">
            </div>
            <div class="col-md-3" id="combo"></div>

        </div>
        <div class="row fila">
            <div class="col-md-1">
                <label>Problema:</label>
            </div>
            <div class="col-md-10">
                <textarea class="form-control input-sm required" name="descripcion" style="height: 200px;resize: vertical;"></textarea>
            </div>
        </div>
        <div class="row fila">
            <div class="col-md-1">
                <label>Prioridad:</label>
            </div>
            <div class="col-md-2">
                <g:select name="prioridad.id" from="${soporte.Prioridad.list([sort: 'descripcion'])}"
                          optionKey="id" optionValue="descripcion" class="form-control input-sm required "
                />
            </div>
            <div class="col-md-1">
                <label>Origen:</label>
            </div>
            <div class="col-md-2">
                <g:select name="origen.id" from="${soporte.Origen.list([sort: 'descripcion'])}"
                          optionKey="id" optionValue="descripcion" class="form-control input-sm "
                />
            </div>
            <div class="col-md-1">
                <label>Fecha:</label>
            </div>
            <div class="col-md-2">
                <elm:datepicker name="fecha" showTime="${true}" value="${new java.util.Date()}"
                                class="form-control input-sm required" />
            </div>
        </div>
        <div class="row fila">
            <div class="col-md-1 col-md-offset-1">
                <a href="#" id="guardar" class="btn btn-info">
                    <i class="fa fa-save"></i> Guardar
                </a>
            </div>
        </div>
    </g:form>
</elm:container>
<script>
    function cargaCombos(){
            var tipo = "S"
            if( !$(".chk").bootstrapSwitch("state"))
                tipo="H"
            $.ajax({
                type: "POST",
                url: "${createLink(controller:'tickets', action:'comboCategoria_ajax')}",
                data: "tipo="+tipo,
                success: function (msg) {
                    closeLoader()
                    $("#combo").html(msg)
                } //success
            }); //ajax
    }
    var validator = $(".frm").validate({
        errorClass     : "help-block",
        errorPlacement : function (error, element) {
            if (element.parent().hasClass("input-group")) {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);
            }
            element.parents(".grupo").addClass('has-error');
        },
        success        : function (label) {
            label.parents(".grupo").removeClass('has-error');
            label.remove();
        }

        , rules          : {

            codigo: {
                remote: {
                    url: "${createLink(controller:'estado', action: 'validar_unique_codigo_ajax')}",
                    type: "post",
                    data: {
                        id: "${estadoInstance?.id}"
                    }
                }
            }

        },
        messages : {

            codigo: {
                remote: "Ya existe Codigo"
            }

        }

    });
    $('.select').combobox();
    $(".chk").bootstrapSwitch({
        size:'mini',
        onText:"Software",
        offText:"Hardware",
        offColor:"primary",
        onSwitchChange:cargaCombos
    });
    $("#guardar").click(function(){
        if($(".frm").valid()){
            $(".frm").submit()
        }
    })
    cargaCombos()
</script>
</body>
</html>