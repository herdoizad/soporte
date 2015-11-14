<%@ page import="soporte.Hardware" %>



<div class="fieldcontain ${hasErrors(bean: hardwareInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="hardware.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="150" required="" class="form-control  required" value="${hardwareInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hardwareInstance, field: 'modelo', 'error')} ">
	<label for="modelo">
		<g:message code="hardware.modelo.label" default="Modelo" />
		
	</label>
	<g:textField name="modelo" maxlength="20" class="form-control " value="${hardwareInstance?.modelo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hardwareInstance, field: 'marca', 'error')} ">
	<label for="marca">
		<g:message code="hardware.marca.label" default="Marca" />
		
	</label>
	<g:textField name="marca" maxlength="50" class="form-control " value="${hardwareInstance?.marca}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hardwareInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="hardware.tipo.label" default="Tipo" />
		
	</label>
	<g:select id="tipo" name="tipo.id" from="${soporte.TipoHardware.list()}" optionKey="id" value="${hardwareInstance?.tipo?.id}" class="many-to-one form-control " noSelection="['null': '']"/>
</div>

