
<%@ page import="soporte.HardwareCliente" %>

<g:if test="${!hardwareClienteInstance}">
    <elm:notFound elem="HardwareCliente" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">

        <g:if test="${hardwareClienteInstance?.observaciones}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Observaciones
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${hardwareClienteInstance}" field="observaciones"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${hardwareClienteInstance?.estado}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Estado
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${hardwareClienteInstance}" field="estado"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${hardwareClienteInstance?.instalacion}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Instalacion
                </div>
                
                <div class="col-sm-4">
                    <g:formatDate date="${hardwareClienteInstance?.instalacion}" format="dd-MM-yyyy" />
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${hardwareClienteInstance?.cantidad}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Cantidad
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${hardwareClienteInstance}" field="cantidad"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${hardwareClienteInstance?.cliente}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Cliente
                </div>
                
                <div class="col-sm-4">
                    ${hardwareClienteInstance?.cliente?.encodeAsHTML()}
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${hardwareClienteInstance?.hardware}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Hardware
                </div>
                
                <div class="col-sm-4">
                    ${hardwareClienteInstance?.hardware?.encodeAsHTML()}
                </div>
                
            </div>
        </g:if>
    
    </div>
</g:else>