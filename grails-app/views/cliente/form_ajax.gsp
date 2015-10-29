<%@ page import="soporte.Cliente" %>
<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!clienteInstance}">
    <elm:notFound elem="Cliente" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">
    <g:form class="form-horizontal" name="frmCliente" id="${clienteInstance?.id}"
            role="form" controller="cliente" action="save_ajax" method="POST">
        <elm:fieldRapido claseLabel="col-sm-2" label="Nombre" claseField="col-sm-7">
            <g:textField name="nombre" maxlength="40" required="" class="form-control  required" value="${clienteInstance?.nombre}"/>
        </elm:fieldRapido>
        <elm:fieldRapido claseLabel="col-sm-2" label="Codigo" claseField="col-sm-2">
            <g:textField name="codigo" required="" maxlength="8" class="form-control  required unique noEspacios" value="${clienteInstance?.codigo}"/>
        </elm:fieldRapido>
        <elm:fieldRapido claseLabel="col-sm-2" label="Email" claseField="col-sm-7">
            <div class="input-group"><span class="input-group-addon"><i class="fa fa-envelope"></i></span><g:field type="email" name="email" maxlength="40" class="form-control  unique noEspacios" value="${clienteInstance?.email}"/></div>
        </elm:fieldRapido>
        <elm:fieldRapido claseLabel="col-sm-2" label="Direccion" claseField="col-sm-7">
            <g:textField name="direccion" maxlength="250" class="form-control " value="${clienteInstance?.direccion}"/>
        </elm:fieldRapido>
        <elm:fieldRapido claseLabel="col-sm-2" label="Propietario" claseField="col-sm-7">
            <g:textField name="propietario" maxlength="100" class="form-control " value="${clienteInstance?.propietario}"/>
        </elm:fieldRapido>
        <elm:fieldRapido claseLabel="col-sm-2" label="Telefono" claseField="col-sm-2">
            <g:textField name="telefono" maxlength="10" class="form-control " value="${clienteInstance?.telefono}"/>
        </elm:fieldRapido>
        <elm:fieldRapido claseLabel="col-sm-2" label="Comercializador" claseField="col-sm-7">
            <g:select id="comercializador" name="comercializadora" from="${soporte.Comercializador.list()}" optionKey="codigo" required="" value="${clienteInstance?.comercializador?.codigo}" class="many-to-one form-control "/>
        </elm:fieldRapido>
    </g:form>
        </div>

    <script type="text/javascript">
        var validator = $("#frmCliente").validate({
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
                        url: "${createLink(controller:'cliente', action: 'validar_unique_email_ajax')}",
                        type: "post",
                        data: {
                            id: "${clienteInstance?.id}"
                        }
                    }
                },
                
                codigo: {
                    remote: {
                        url: "${createLink(controller:'cliente', action: 'validar_unique_codigo_ajax')}",
                        type: "post",
                        data: {
                            id: "${clienteInstance?.id}"
                        }
                    }
                }
                
            },
            messages : {
                
                email: {
                    remote: "Ya existe Email"
                },
                
                codigo: {
                    remote: "Ya existe Codigo"
                }
                
            }
            
        });
        $(".form-control").keydown(function (ev) {
            if (ev.keyCode == 13) {
                submitFormCliente();
                return false;
            }
            return true;
        });
    </script>

</g:else>