
<%@ page import="soporte.Origen" %>

<g:if test="${!origenInstance}">
    <elm:notFound elem="Origen" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">

        <g:if test="${origenInstance?.descripcion}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Descripcion
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${origenInstance}" field="descripcion"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${origenInstance?.codigo}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Codigo
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${origenInstance}" field="codigo"/>
                </div>
                
            </div>
        </g:if>
    
    </div>
</g:else>