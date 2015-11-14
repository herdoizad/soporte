
<%@ page import="soporte.ItemVisita" %>

<g:if test="${!itemVisitaInstance}">
    <elm:notFound elem="ItemVisita" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">

        <g:if test="${itemVisitaInstance?.descripcion}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Descripcion
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${itemVisitaInstance}" field="descripcion"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${itemVisitaInstance?.codigo}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Codigo
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${itemVisitaInstance}" field="codigo"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${itemVisitaInstance?.tipo}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Tipo
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${itemVisitaInstance}" field="tipo"/>
                </div>
                
            </div>
        </g:if>
    
    </div>
</g:else>