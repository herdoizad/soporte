<%@ page import="soporte.Estado" %>

<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!estadoInstance}">
    <elm:notFound elem="Estado" genero="o" />
</g:if>
<g:else>

    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmEstado" id="${estadoInstance?.id}"
                role="form" controller="estado" action="save_ajax" method="POST">
            <elm:fieldRapido claseLabel="col-sm-2" label="Descripcion" claseField="col-sm-6">
                <g:textField name="descripcion" maxlength="50" required="" class="form-control  required" value="${estadoInstance?.descripcion}"/>
            </elm:fieldRapido>
            <elm:fieldRapido claseLabel="col-sm-2" label="Codigo" claseField="col-sm-6">
                <g:textField name="codigo" maxlength="5" required="" class="form-control  required unique noEspacios" value="${estadoInstance?.codigo}"/>
            </elm:fieldRapido>
        </g:form>
    </div>

    <script type="text/javascript">
        var validator = $("#frmEstado").validate({
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
        $(".form-control").keydown(function (ev) {
            if (ev.keyCode == 13) {
                submitFormEstado();
                return false;
            }
            return true;
        });
    </script>

</g:else>