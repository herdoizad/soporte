<%@ page import="soporte.ItemVisita" %>



<div class="fieldcontain ${hasErrors(bean: itemVisitaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="itemVisita.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="50" required="" class="form-control  required" value="${itemVisitaInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemVisitaInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="itemVisita.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" maxlength="5" required="" class="form-control  required unique noEspacios" value="${itemVisitaInstance?.codigo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemVisitaInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="itemVisita.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipo" maxlength="1" required="" class="form-control  required" value="${itemVisitaInstance?.tipo}"/>
</div>

