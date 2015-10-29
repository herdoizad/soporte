
<%@ page import="soporte.Software" %>

<g:if test="${!softwareInstance}">
    <elm:notFound elem="Software" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">

        <g:if test="${softwareInstance?.nombre}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Nombre
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${softwareInstance}" field="nombre"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${softwareInstance?.descripcion}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Descripcion
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${softwareInstance}" field="descripcion"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${softwareInstance?.ultimaVersion}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Ultima Version
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${softwareInstance}" field="ultimaVersion"/>
                </div>
                
            </div>
        </g:if>
    
    </div>
</g:else>