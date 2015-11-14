<%@ page import="soporte.TipoHardware" %>



<div class="fieldcontain ${hasErrors(bean: tipoHardwareInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tipoHardware.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="50" required="" class="form-control  required" value="${tipoHardwareInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoHardwareInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="tipoHardware.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" maxlength="5" required="" class="form-control  required unique noEspacios" value="${tipoHardwareInstance?.codigo}"/>
</div>

