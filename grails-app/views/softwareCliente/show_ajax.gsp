
<%@ page import="soporte.SoftwareCliente" %>

<g:if test="${!softwareClienteInstance}">
    <elm:notFound elem="SoftwareCliente" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">

        <g:if test="${softwareClienteInstance?.estado}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Estado
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${softwareClienteInstance}" field="estado"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${softwareClienteInstance?.versionSoftware}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Version Software
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${softwareClienteInstance}" field="versionSoftware"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${softwareClienteInstance?.instalacion}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Instalacion
                </div>
                
                <div class="col-sm-4">
                    <g:formatDate date="${softwareClienteInstance?.instalacion}" format="dd-MM-yyyy" />
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${softwareClienteInstance?.cliente}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Cliente
                </div>
                
                <div class="col-sm-4">
                    ${softwareClienteInstance?.cliente?.encodeAsHTML()}
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${softwareClienteInstance?.software}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Software
                </div>
                
                <div class="col-sm-4">
                    ${softwareClienteInstance?.software?.encodeAsHTML()}
                </div>
                
            </div>
        </g:if>
    
    </div>
</g:else>