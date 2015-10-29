<%@ page import="soporte.Contrato" %>

<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!contratoInstance}">
    <elm:notFound elem="Contrato" genero="o" />
</g:if>
<g:else>
    
    <div class="modal-contenido">
    <g:form class="form-horizontal" name="frmContrato" id="${contratoInstance?.id}"
            role="form" controller="contrato" action="save_ajax" method="POST">

        
        <elm:fieldRapido claseLabel="col-sm-2" label="Fin" claseField="col-sm-4">
            <elm:datepicker name="fin"  class="datepicker form-control " value="${contratoInstance?.fin}" />
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Path" claseField="col-sm-6">
            <g:textField name="path" maxlength="150" class="form-control " value="${contratoInstance?.path}"/>
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Numero" claseField="col-sm-6">
            <g:textField name="numero" maxlength="20" class="form-control " value="${contratoInstance?.numero}"/>
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Cliente" claseField="col-sm-6">
            <g:select id="cliente" name="cliente.id" from="${soporte.Cliente.list()}" optionKey="id" required="" value="${contratoInstance?.cliente?.id}" class="many-to-one form-control "/>
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Inicio" claseField="col-sm-4">
            <elm:datepicker name="inicio"  class="datepicker form-control  required" value="${contratoInstance?.inicio}" />
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Tipo" claseField="col-sm-6">
            <g:select id="tipo" name="tipo.id" from="${soporte.TipoDeContrato.list()}" optionKey="id" required="" value="${contratoInstance?.tipo?.id}" class="many-to-one form-control "/>
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Valor" claseField="col-sm-2">
            <g:textField name="valor" value="${fieldValue(bean: contratoInstance, field: 'valor')}" class="number form-control   required" required=""/>
        </elm:fieldRapido>
        
    </g:form>
        </div>

    <script type="text/javascript">
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
    </script>

</g:else>