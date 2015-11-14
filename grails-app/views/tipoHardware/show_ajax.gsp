
<%@ page import="soporte.TipoHardware" %>

<g:if test="${!tipoHardwareInstance}">
    <elm:notFound elem="TipoHardware" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">

        <g:if test="${tipoHardwareInstance?.descripcion}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Descripcion
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${tipoHardwareInstance}" field="descripcion"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${tipoHardwareInstance?.codigo}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Codigo
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${tipoHardwareInstance}" field="codigo"/>
                </div>
                
            </div>
        </g:if>
    
    </div>
</g:else>