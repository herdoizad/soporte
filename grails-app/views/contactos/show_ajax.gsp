
<%@ page import="soporte.Contactos" %>

<g:if test="${!contactosInstance}">
    <elm:notFound elem="Contactos" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">

        <g:if test="${contactosInstance?.nombre}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Nombre
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${contactosInstance}" field="nombre"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${contactosInstance?.telefono}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Telefono
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${contactosInstance}" field="telefono"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${contactosInstance?.email}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Email
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${contactosInstance}" field="email"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${contactosInstance?.estado}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Estado
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${contactosInstance}" field="estado"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${contactosInstance?.condicion}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Condicion
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${contactosInstance}" field="condicion"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${contactosInstance?.cliente}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Cliente
                </div>
                
                <div class="col-sm-4">
                    ${contactosInstance?.cliente?.encodeAsHTML()}
                </div>
                
            </div>
        </g:if>
    
    </div>
</g:else>