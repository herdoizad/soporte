<%@ page import="soporte.SoftwareCliente" %>



<div class="fieldcontain ${hasErrors(bean: softwareClienteInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="softwareCliente.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estado" maxlength="1" required="" class="form-control  required" value="${softwareClienteInstance?.estado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareClienteInstance, field: 'versionSoftware', 'error')} required">
	<label for="versionSoftware">
		<g:message code="softwareCliente.versionSoftware.label" default="Version Software" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="versionSoftware" maxlength="10" required="" class="form-control  required" value="${softwareClienteInstance?.versionSoftware}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareClienteInstance, field: 'instalacion', 'error')} ">
	<label for="instalacion">
		<g:message code="softwareCliente.instalacion.label" default="Instalacion" />
		
	</label>
	<elm:datepicker name="instalacion"  class="datepicker form-control " value="${softwareClienteInstance?.instalacion}" />
</div>

<div class="fieldcontain ${hasErrors(bean: softwareClienteInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="softwareCliente.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${soporte.Cliente.list()}" optionKey="id" required="" value="${softwareClienteInstance?.cliente?.id}" class="many-to-one form-control "/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareClienteInstance, field: 'software', 'error')} required">
	<label for="software">
		<g:message code="softwareCliente.software.label" default="Software" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="software" name="software.id" from="${soporte.Software.list()}" optionKey="id" required="" value="${softwareClienteInstance?.software?.id}" class="many-to-one form-control "/>
</div>

