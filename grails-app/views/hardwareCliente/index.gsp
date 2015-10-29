
<%@ page import="soporte.HardwareCliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hardwareCliente.label', default: 'HardwareCliente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-hardwareCliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-hardwareCliente" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="observaciones" title="${message(code: 'hardwareCliente.observaciones.label', default: 'Observaciones')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'hardwareCliente.estado.label', default: 'Estado')}" />
					
						<g:sortableColumn property="instalacion" title="${message(code: 'hardwareCliente.instalacion.label', default: 'Instalacion')}" />
					
						<g:sortableColumn property="cantidad" title="${message(code: 'hardwareCliente.cantidad.label', default: 'Cantidad')}" />
					
						<th><g:message code="hardwareCliente.cliente.label" default="Cliente" /></th>
					
						<th><g:message code="hardwareCliente.hardware.label" default="Hardware" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${hardwareClienteInstanceList}" status="i" var="hardwareClienteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${hardwareClienteInstance.id}">${fieldValue(bean: hardwareClienteInstance, field: "observaciones")}</g:link></td>
					
						<td>${fieldValue(bean: hardwareClienteInstance, field: "estado")}</td>
					
						<td><g:formatDate date="${hardwareClienteInstance.instalacion}" /></td>
					
						<td>${fieldValue(bean: hardwareClienteInstance, field: "cantidad")}</td>
					
						<td>${fieldValue(bean: hardwareClienteInstance, field: "cliente")}</td>
					
						<td>${fieldValue(bean: hardwareClienteInstance, field: "hardware")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hardwareClienteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
