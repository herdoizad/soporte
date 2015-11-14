
<%@ page import="soporte.TipoDeContrato" %>

<g:if test="${!tipoDeContratoInstance}">
    <elm:notFound elem="TipoDeContrato" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">

        <g:if test="${tipoDeContratoInstance?.descripcion}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Descripcion
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${tipoDeContratoInstance}" field="descripcion"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${tipoDeContratoInstance?.condiciones}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Condiciones
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${tipoDeContratoInstance}" field="condiciones"/>
                </div>
                
            </div>
        </g:if>
    
    </div>
</g:else>