<%@ page import="soporte.Categoria" %>



<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="categoria.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="100" required="" class="form-control  required" value="${categoriaInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="categoria.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" maxlength="5" required="" class="form-control  required unique noEspacios" value="${categoriaInstance?.codigo}"/>
</div>

