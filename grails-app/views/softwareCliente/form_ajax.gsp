<%@ page import="soporte.SoftwareCliente" %>

<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!softwareClienteInstance}">
    <elm:notFound elem="SoftwareCliente" genero="o" />
</g:if>
<g:else>
    
    <div class="modal-contenido">
    <g:form class="form-horizontal" name="frmSoftwareCliente" id="${softwareClienteInstance?.id}"
            role="form" controller="softwareCliente" action="save_ajax" method="POST">
        <input type="hidden" name="codigo_cliente" value="${cliente}">
        <elm:fieldRapido claseLabel="col-sm-2" label="Software" claseField="col-sm-6">
            <g:select id="software" name="software.id" from="${soporte.Software.list()}" optionKey="id"
                      optionValue="nombre"
                      required="" value="${softwareClienteInstance?.software?.id}" class="many-to-one form-control "/>
        </elm:fieldRapido>
        <elm:fieldRapido claseLabel="col-sm-2" label="Version Software" claseField="col-sm-6">
            <g:textField name="versionSoftware" maxlength="10" required="" class="form-control  required" value="${softwareClienteInstance?.versionSoftware}"/>
        </elm:fieldRapido>
        <elm:fieldRapido claseLabel="col-sm-2" label="Instalacion" claseField="col-sm-4">
            <elm:datepicker name="instalacion"  class="datepicker form-control " value="${softwareClienteInstance?.instalacion}" />
        </elm:fieldRapido>
        <elm:fieldRapido claseLabel="col-sm-2" label="Estado" claseField="col-sm-6">
            <g:select name="estado" from="${['A':'Activo','I':'Inactivo']}" class="form-control input-sm"
                      optionKey="key" optionValue="value"  value="${softwareClienteInstance?.estado}"/>
        </elm:fieldRapido>

    </g:form>
        </div>

    <script type="text/javascript">
        var validator = $("#frmSoftwareCliente").validate({
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
                submitFormSoftwareCliente();
                return false;
            }
            return true;
        });
    </script>

</g:else>