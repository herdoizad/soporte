
<%@ page import="soporte.Hardware" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hardware.label', default: 'Hardware')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-hardware" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-hardware" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'hardware.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="modelo" title="${message(code: 'hardware.modelo.label', default: 'Modelo')}" />
					
						<g:sortableColumn property="marca" title="${message(code: 'hardware.marca.label', default: 'Marca')}" />
					
						<th><g:message code="hardware.tipo.label" default="Tipo" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${hardwareInstanceList}" status="i" var="hardwareInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${hardwareInstance.id}">${fieldValue(bean: hardwareInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: hardwareInstance, field: "modelo")}</td>
					
						<td>${fieldValue(bean: hardwareInstance, field: "marca")}</td>
					
						<td>${fieldValue(bean: hardwareInstance, field: "tipo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hardwareInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
