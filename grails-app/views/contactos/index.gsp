
<%@ page import="soporte.Contactos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contactos.label', default: 'Contactos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contactos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contactos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'contactos.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="telefono" title="${message(code: 'contactos.telefono.label', default: 'Telefono')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'contactos.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'contactos.estado.label', default: 'Estado')}" />
					
						<g:sortableColumn property="condicion" title="${message(code: 'contactos.condicion.label', default: 'Condicion')}" />
					
						<th><g:message code="contactos.cliente.label" default="Cliente" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contactosInstanceList}" status="i" var="contactosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contactosInstance.id}">${fieldValue(bean: contactosInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: contactosInstance, field: "telefono")}</td>
					
						<td>${fieldValue(bean: contactosInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: contactosInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: contactosInstance, field: "condicion")}</td>
					
						<td>${fieldValue(bean: contactosInstance, field: "cliente")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contactosInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
