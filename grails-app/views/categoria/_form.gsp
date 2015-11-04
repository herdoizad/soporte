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

<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="categoria.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" maxlength="1" class="form-control " value="${categoriaInstance?.tipo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'tiempo', 'error')} ">
	<label for="tiempo">
		<g:message code="categoria.tiempo.label" default="Tiempo" />
		
	</label>
	<g:textField name="tiempo" value="${categoriaInstance.tiempo}" class="digits form-control "/>
</div>

