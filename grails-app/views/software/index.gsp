
<%@ page import="soporte.Software" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'software.label', default: 'Software')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-software" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-software" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'software.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'software.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="ultimaVersion" title="${message(code: 'software.ultimaVersion.label', default: 'Ultima Version')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${softwareInstanceList}" status="i" var="softwareInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${softwareInstance.id}">${fieldValue(bean: softwareInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: softwareInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: softwareInstance, field: "ultimaVersion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${softwareInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
