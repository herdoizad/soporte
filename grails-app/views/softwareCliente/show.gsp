
<%@ page import="soporte.SoftwareCliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'softwareCliente.label', default: 'SoftwareCliente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-softwareCliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-softwareCliente" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list softwareCliente">
			
				<g:if test="${softwareClienteInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="softwareCliente.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${softwareClienteInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareClienteInstance?.versionSoftware}">
				<li class="fieldcontain">
					<span id="versionSoftware-label" class="property-label"><g:message code="softwareCliente.versionSoftware.label" default="Version Software" /></span>
					
						<span class="property-value" aria-labelledby="versionSoftware-label"><g:fieldValue bean="${softwareClienteInstance}" field="versionSoftware"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareClienteInstance?.instalacion}">
				<li class="fieldcontain">
					<span id="instalacion-label" class="property-label"><g:message code="softwareCliente.instalacion.label" default="Instalacion" /></span>
					
						<span class="property-value" aria-labelledby="instalacion-label"><g:formatDate date="${softwareClienteInstance?.instalacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareClienteInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="softwareCliente.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${softwareClienteInstance?.cliente?.id}">${softwareClienteInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareClienteInstance?.software}">
				<li class="fieldcontain">
					<span id="software-label" class="property-label"><g:message code="softwareCliente.software.label" default="Software" /></span>
					
						<span class="property-value" aria-labelledby="software-label"><g:link controller="software" action="show" id="${softwareClienteInstance?.software?.id}">${softwareClienteInstance?.software?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:softwareClienteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${softwareClienteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
