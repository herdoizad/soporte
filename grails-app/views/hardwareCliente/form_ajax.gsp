<%@ page import="soporte.HardwareCliente" %>

<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!hardwareClienteInstance}">
    <elm:notFound elem="HardwareCliente" genero="o" />
</g:if>
<g:else>

    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmHardwareCliente" id="${hardwareClienteInstance?.id}"
                role="form" controller="hardwareCliente" action="save_ajax" method="POST">

            <input type="hidden" value="${cliente}" name="codigo_cliente">
            <elm:fieldRapido claseLabel="col-sm-2" label="Hardware" claseField="col-sm-6">
                <g:select id="hardware" name="hardware.id" from="${soporte.Hardware.list()}"
                          optionValue="nombre"
                          optionKey="id" required="" value="${hardwareClienteInstance?.hardware?.id}" class="many-to-one form-control "/>
            </elm:fieldRapido>
            <elm:fieldRapido claseLabel="col-sm-2" label="Cantidad" claseField="col-sm-2">
                <g:textField name="cantidad" value="${fieldValue(bean: hardwareClienteInstance, field: 'cantidad')}" class="number form-control   required" required=""/>
            </elm:fieldRapido>
            <elm:fieldRapido claseLabel="col-sm-2" label="Instalacion" claseField="col-sm-4">
                <elm:datepicker name="instalacion"  class="datepicker form-control " value="${hardwareClienteInstance?.instalacion}" />
            </elm:fieldRapido>
            <elm:fieldRapido claseLabel="col-sm-2" label="Estado" claseField="col-sm-6">
                <g:select name="estado" from="${['A':'Activo','I':'Inactivo']}" class="form-control input-sm"
                          optionKey="key" optionValue="value"  value="${hardwareClienteInstance?.estado}"/>
            </elm:fieldRapido>
            <elm:fieldRapido claseLabel="col-sm-2" label="Observaciones" claseField="col-sm-10">
                <g:textField name="observaciones" maxlength="250" class="form-control " value="${hardwareClienteInstance?.observaciones}"/>
            </elm:fieldRapido>
            <elm:fieldRapido claseLabel="col-sm-2" label="Versión" claseField="col-sm-6">
                <g:textField name="versionHardware" maxlength="10" class="form-control " value="${hardwareClienteInstance?.versionHardware}"/>
            </elm:fieldRapido>



        </g:form>
    </div>

    <script type="text/javascript">
        var validator = $("#frmHardwareCliente").validate({
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
                submitFormHardwareCliente();
                return false;
            }
            return true;
        });
    </script>

</g:else>