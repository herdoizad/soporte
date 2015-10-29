<%@ page import="soporte.Prioridad" %>



<div class="fieldcontain ${hasErrors(bean: prioridadInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="prioridad.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="100" required="" class="form-control  required" value="${prioridadInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prioridadInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="prioridad.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" maxlength="5" required="" class="form-control  required unique noEspacios" value="${prioridadInstance?.codigo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prioridadInstance, field: 'alerta', 'error')} ">
	<label for="alerta">
		<g:message code="prioridad.alerta.label" default="Alerta" />
		
	</label>
	<g:textField name="alerta" value="${prioridadInstance.alerta}" class="digits form-control "/>
</div>

