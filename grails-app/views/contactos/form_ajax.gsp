<%@ page import="soporte.Contactos" %>

<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!contactosInstance}">
    <elm:notFound elem="Contactos" genero="o" />
</g:if>
<g:else>
    
    <div class="modal-contenido">
    <g:form class="form-horizontal" name="frmContactos" id="${contactosInstance?.id}"
            role="form" controller="contactos" action="save_ajax" method="POST">
        <input type="hidden" name="cliente_codigo" value="${cliente}">
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Nombre" claseField="col-sm-6">
            <g:textField name="nombre" maxlength="75" required="" class="form-control  required" value="${contactosInstance?.nombre}"/>
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Telefono" claseField="col-sm-6">
            <g:textField name="telefono" maxlength="10" required="" class="form-control  required" value="${contactosInstance?.telefono}"/>
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Email" claseField="col-sm-6">
            <div class="input-group"><span class="input-group-addon"><i class="fa fa-envelope"></i></span><g:field type="email" name="email" maxlength="100" class="form-control  unique noEspacios" value="${contactosInstance?.email}"/></div>
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Estado" claseField="col-sm-6">
            <g:select name="estado" from="${['A':'Activo','I':'Inactivo']}" class="form-control input-sm"
            optionKey="key" optionValue="value"  value="${contactosInstance?.estado}"/>
        </elm:fieldRapido>
        
        <elm:fieldRapido claseLabel="col-sm-2" label="Condicion" claseField="col-sm-6">
            <g:select name="condicion" from="${['P':'Pilas','N':'No pilas']}" class="form-control input-sm"
                      optionKey="key" optionValue="value" value="${contactosInstance?.condicion}"/>
        </elm:fieldRapido>
        

        
    </g:form>
        </div>

    <script type="text/javascript">
        var validator = $("#frmContactos").validate({
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
                
                email: {
                    remote: {
                        url: "${createLink(controller:'contactos', action: 'validar_unique_email_ajax')}",
                        type: "post",
                        data: {
                            id: "${contactosInstance?.id}"
                        }
                    }
                }
                
            },
            messages : {
                
                email: {
                    remote: "Ya existe Email"
                }
                
            }
            
        });
        $(".form-control").keydown(function (ev) {
            if (ev.keyCode == 13) {
                submitFormContactos();
                return false;
            }
            return true;
        });
    </script>

</g:else>