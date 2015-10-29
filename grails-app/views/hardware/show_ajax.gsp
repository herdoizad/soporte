
<%@ page import="soporte.Hardware" %>

<g:if test="${!hardwareInstance}">
    <elm:notFound elem="Hardware" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">

        <g:if test="${hardwareInstance?.nombre}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Nombre
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${hardwareInstance}" field="nombre"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${hardwareInstance?.modelo}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Modelo
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${hardwareInstance}" field="modelo"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${hardwareInstance?.marca}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Marca
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${hardwareInstance}" field="marca"/>
                </div>
                
            </div>
        </g:if>
    
    </div>
</g:else>