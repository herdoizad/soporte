
<%@ page import="soporte.Prioridad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prioridad.label', default: 'Prioridad')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-prioridad" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-prioridad" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'prioridad.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="codigo" title="${message(code: 'prioridad.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="alerta" title="${message(code: 'prioridad.alerta.label', default: 'Alerta')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prioridadInstanceList}" status="i" var="prioridadInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prioridadInstance.id}">${fieldValue(bean: prioridadInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: prioridadInstance, field: "codigo")}</td>
					
						<td>${fieldValue(bean: prioridadInstance, field: "alerta")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${prioridadInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
