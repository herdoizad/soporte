
<%@ page import="soporte.ItemVisita" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'itemVisita.label', default: 'ItemVisita')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-itemVisita" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-itemVisita" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'itemVisita.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="codigo" title="${message(code: 'itemVisita.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'itemVisita.tipo.label', default: 'Tipo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemVisitaInstanceList}" status="i" var="itemVisitaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemVisitaInstance.id}">${fieldValue(bean: itemVisitaInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: itemVisitaInstance, field: "codigo")}</td>
					
						<td>${fieldValue(bean: itemVisitaInstance, field: "tipo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${itemVisitaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
