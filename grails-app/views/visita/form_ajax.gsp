<%@ page import="soporte.Visita" %>

<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!visitaInstance}">
    <elm:notFound elem="Visita" genero="o" />
</g:if>
<g:else>
    
    <div class="modal-contenido">
    <g:form class="form-horizontal" name="frmVisita" id="${visitaInstance?.id}"
            role="form" controller="visita" action="save_ajax" method="POST">

        
        <elm:fieldRapido claseLabel="col-sm-2" label="Observaciones" claseField="col-sm-6">
            <g:textField name="observaciones" class="form-control " value="${visitaInstance?.observaciones}"/>
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Cliente" claseField="col-sm-6">
            <g:select id="cliente" name="cliente.id" from="${soporte.Cliente.list()}" optionKey="id" required="" value="${visitaInstance?.cliente?.id}" class="many-to-one form-control "/>
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Fecha" claseField="col-sm-4">
            <elm:datepicker name="fecha"  class="datepicker form-control  required" value="${visitaInstance?.fecha}" />
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Usuario" claseField="col-sm-6">
            <g:select id="usuario" name="usuario.id" from="${soporte.seguridad.Persona.list()}" optionKey="id" required="" value="${visitaInstance?.usuario?.id}" class="many-to-one form-control "/>
        </elm:fieldRapido>
        
    </g:form>
        </div>

    <script type="text/javascript">
        var validator = $("#frmVisita").validate({
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
                submitFormVisita();
                return false;
            }
            return true;
        });
    </script>

</g:else>