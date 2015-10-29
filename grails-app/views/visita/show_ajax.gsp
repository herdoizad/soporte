
<%@ page import="soporte.Visita" %>

<g:if test="${!visitaInstance}">
    <elm:notFound elem="Visita" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">

        <g:if test="${visitaInstance?.observaciones}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Observaciones
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${visitaInstance}" field="observaciones"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${visitaInstance?.cliente}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Cliente
                </div>
                
                <div class="col-sm-4">
                    ${visitaInstance?.cliente?.encodeAsHTML()}
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${visitaInstance?.fecha}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Fecha
                </div>
                
                <div class="col-sm-4">
                    <g:formatDate date="${visitaInstance?.fecha}" format="dd-MM-yyyy" />
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${visitaInstance?.usuario}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Usuario
                </div>
                
                <div class="col-sm-4">
                    ${visitaInstance?.usuario?.encodeAsHTML()}
                </div>
                
            </div>
        </g:if>
    
    </div>
</g:else>