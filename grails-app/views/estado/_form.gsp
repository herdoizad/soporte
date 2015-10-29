<%@ page import="soporte.Estado" %>



<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="estado.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="50" required="" class="form-control  required" value="${estadoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="estado.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" maxlength="5" required="" class="form-control  required unique noEspacios" value="${estadoInstance?.codigo}"/>
</div>

