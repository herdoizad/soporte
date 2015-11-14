<%@ page import="soporte.Hardware" %>

<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!hardwareInstance}">
    <elm:notFound elem="Hardware" genero="o" />
</g:if>
<g:else>
    
    <div class="modal-contenido">
    <g:form class="form-horizontal" name="frmHardware" id="${hardwareInstance?.id}"
            role="form" controller="hardware" action="save_ajax" method="POST">

        
        <elm:fieldRapido claseLabel="col-sm-2" label="Nombre" claseField="col-sm-6">
            <g:textField name="nombre" maxlength="150" required="" class="form-control  required" value="${hardwareInstance?.nombre}"/>
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Modelo" claseField="col-sm-6">
            <g:textField name="modelo" maxlength="20" class="form-control " value="${hardwareInstance?.modelo}"/>
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Marca" claseField="col-sm-6">
            <g:textField name="marca" maxlength="50" class="form-control " value="${hardwareInstance?.marca}"/>
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Tipo" claseField="col-sm-6">
            <g:select id="tipo" name="tipo.id" from="${soporte.TipoHardware.list()}" optionKey="id"  optionValue="descripcion" value="${hardwareInstance?.tipo?.id}" class="many-to-one form-control " noSelection="['null': '']"/>
        </elm:fieldRapido>
        
    </g:form>
        </div>

    <script type="text/javascript">
        var validator = $("#frmHardware").validate({
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
                submitFormHardware();
                return false;
            }
            return true;
        });
    </script>

</g:else>