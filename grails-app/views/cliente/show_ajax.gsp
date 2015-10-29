
<%@ page import="soporte.Cliente" %>

<g:if test="${!clienteInstance}">
    <elm:notFound elem="Cliente" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">

        <g:if test="${clienteInstance?.nombre}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Nombre
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${clienteInstance}" field="nombre"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${clienteInstance?.email}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Email
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${clienteInstance}" field="email"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${clienteInstance?.latitud}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Latitud
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${clienteInstance}" field="latitud"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${clienteInstance?.longitud}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Longitud
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${clienteInstance}" field="longitud"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${clienteInstance?.direccion}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Direccion
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${clienteInstance}" field="direccion"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${clienteInstance?.propietario}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Propietario
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${clienteInstance}" field="propietario"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${clienteInstance?.telefono}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Telefono
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${clienteInstance}" field="telefono"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${clienteInstance?.codigo}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Codigo
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${clienteInstance}" field="codigo"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${clienteInstance?.comercializador}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Comercializador
                </div>
                
                <div class="col-sm-4">
                    ${clienteInstance?.comercializador?.encodeAsHTML()}
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${clienteInstance?.estado}">
            <div class="row">
                <div class="col-sm-3 show-label">
                    Estado
                </div>
                
                <div class="col-sm-4">
                    <g:fieldValue bean="${clienteInstance}" field="estado"/>
                </div>
                
            </div>
        </g:if>
    
    </div>
</g:else>