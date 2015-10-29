
<%@ page import="soporte.Prioridad" %>

<g:if test="${!prioridadInstance}">
    <elm:notFound elem="Prioridad" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">

        <g:if test="${prioridadInstance?.descripcion}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Descripcion
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${prioridadInstance}" field="descripcion"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${prioridadInstance?.codigo}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Codigo
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${prioridadInstance}" field="codigo"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${prioridadInstance?.alerta}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Alerta
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${prioridadInstance}" field="alerta"/>
                </div>
                
            </div>
        </g:if>
    
    </div>
</g:else>