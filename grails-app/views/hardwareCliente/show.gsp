
<%@ page import="soporte.HardwareCliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hardwareCliente.label', default: 'HardwareCliente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-hardwareCliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hardwareCliente" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hardwareCliente">
			
				<g:if test="${hardwareClienteInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="hardwareCliente.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${hardwareClienteInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hardwareClienteInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="hardwareCliente.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${hardwareClienteInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hardwareClienteInstance?.instalacion}">
				<li class="fieldcontain">
					<span id="instalacion-label" class="property-label"><g:message code="hardwareCliente.instalacion.label" default="Instalacion" /></span>
					
						<span class="property-value" aria-labelledby="instalacion-label"><g:formatDate date="${hardwareClienteInstance?.instalacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${hardwareClienteInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="hardwareCliente.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${hardwareClienteInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hardwareClienteInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="hardwareCliente.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${hardwareClienteInstance?.cliente?.id}">${hardwareClienteInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${hardwareClienteInstance?.hardware}">
				<li class="fieldcontain">
					<span id="hardware-label" class="property-label"><g:message code="hardwareCliente.hardware.label" default="Hardware" /></span>
					
						<span class="property-value" aria-labelledby="hardware-label"><g:link controller="hardware" action="show" id="${hardwareClienteInstance?.hardware?.id}">${hardwareClienteInstance?.hardware?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:hardwareClienteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${hardwareClienteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
