
<%@ page import="soporte.Visita" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'visita.label', default: 'Visita')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-visita" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-visita" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="observaciones" title="${message(code: 'visita.observaciones.label', default: 'Observaciones')}" />
					
						<th><g:message code="visita.cliente.label" default="Cliente" /></th>
					
						<g:sortableColumn property="fecha" title="${message(code: 'visita.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="visita.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${visitaInstanceList}" status="i" var="visitaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${visitaInstance.id}">${fieldValue(bean: visitaInstance, field: "observaciones")}</g:link></td>
					
						<td>${fieldValue(bean: visitaInstance, field: "cliente")}</td>
					
						<td><g:formatDate date="${visitaInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: visitaInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${visitaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
