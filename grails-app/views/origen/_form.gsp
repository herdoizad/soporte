<%@ page import="soporte.Origen" %>



<div class="fieldcontain ${hasErrors(bean: origenInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="origen.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="100" required="" class="form-control  required" value="${origenInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: origenInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="origen.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" maxlength="5" required="" class="form-control  required unique noEspacios" value="${origenInstance?.codigo}"/>
</div>

