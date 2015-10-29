<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Contratos</title>
    <meta name="layout" content="main"/>
</head>

<body>
<elm:container tipo="horizontal" titulo="Contrato del cliente: ${cliente.nombre}">
    <div class="row ">
        <div class="col-md-6">
            <g:form class="form-horizontal" name="frmContrato" id="${contratoInstance?.id}" enctype="multipart/form-data"
                    role="form" controller="contrato" action="save_ajax" method="POST">
                <input type="hidden" name="codigo_cliente" value="${cliente.codigo}">
                <elm:fieldRapido claseLabel="col-sm-2" label="Archivo" claseField="col-sm-10">
                    <input type="file" name="file" class="form-control input-sm">
                </elm:fieldRapido>

                <elm:fieldRapido claseLabel="col-sm-2" label="Numero" claseField="col-sm-6">
                    <g:textField name="numero" maxlength="20" class="form-control " value="${contratoInstance?.numero}"/>
                </elm:fieldRapido>

                <elm:fieldRapido claseLabel="col-sm-2" label="Desde" claseField="col-sm-4">
                    <elm:datepicker name="inicio"  class="datepicker form-control  required" value="${contratoInstance?.inicio}" />
                </elm:fieldRapido>
                <elm:fieldRapido claseLabel="col-sm-2" label="Hasta" claseField="col-sm-4">
                    <elm:datepicker name="fin"  class="datepicker form-control " value="${contratoInstance?.fin}" />
                </elm:fieldRapido>
                <elm:fieldRapido claseLabel="col-sm-2" label="Tipo" claseField="col-sm-6">
                    <g:select id="tipo" name="tipo.id" from="${soporte.TipoDeContrato.list()}" optionValue="descripcion"
                              optionKey="id" required="" value="${contratoInstance?.tipo?.id}" class="many-to-one form-control "/>
                </elm:fieldRapido>

                <elm:fieldRapido claseLabel="col-sm-2" label="Valor" claseField="col-sm-6">
                    <g:textField name="valor" style="text-align: right" value="${fieldValue(bean: contratoInstance, field: 'valor')}" class="number form-control   required" required=""/>
                </elm:fieldRapido>

            </g:form>
            <a href="#" class="btn btn-info" id="guardar">
                <i class="fa fa-sava"></i> Guardar
            </a>
        </div>
    </div>

</elm:container>

<script type="text/javascript">
    function submitFormContrato() {
        var $form = $("#frmContrato");
        var $btn = $("#dlgCreateEditContrato").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            openLoader("Guardando Contrato");
            $form.submit()
        } else {
            return false;
        } //else
    }
    var validator = $("#frmContrato").validate({
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

    });
    $(".form-control").keydown(function (ev) {
        if (ev.keyCode == 13) {
            submitFormContrato();
            return false;
        }
        return true;
    });
    $("#guardar").click(function(){
        submitFormContrato();
        return false;
    })
</script>
</body>
</html>