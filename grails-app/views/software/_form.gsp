<%@ page import="soporte.Software" %>



<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="software.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="150" required="" class="form-control  required" value="${softwareInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="software.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textArea name="descripcion" cols="40" rows="5" maxlength="300" class="form-control " value="${softwareInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'ultimaVersion', 'error')} ">
	<label for="ultimaVersion">
		<g:message code="software.ultimaVersion.label" default="Ultima Version" />
		
	</label>
	<g:textField name="ultimaVersion" maxlength="10" class="form-control " value="${softwareInstance?.ultimaVersion}"/>
</div>

