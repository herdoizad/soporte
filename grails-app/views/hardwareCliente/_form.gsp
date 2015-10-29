<%@ page import="soporte.HardwareCliente" %>



<div class="fieldcontain ${hasErrors(bean: hardwareClienteInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="hardwareCliente.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" maxlength="250" class="form-control " value="${hardwareClienteInstance?.observaciones}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hardwareClienteInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="hardwareCliente.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estado" maxlength="1" required="" class="form-control  required" value="${hardwareClienteInstance?.estado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hardwareClienteInstance, field: 'instalacion', 'error')} ">
	<label for="instalacion">
		<g:message code="hardwareCliente.instalacion.label" default="Instalacion" />
		
	</label>
	<elm:datepicker name="instalacion"  class="datepicker form-control " value="${hardwareClienteInstance?.instalacion}" />
</div>

<div class="fieldcontain ${hasErrors(bean: hardwareClienteInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="hardwareCliente.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cantidad" value="${fieldValue(bean: hardwareClienteInstance, field: 'cantidad')}" class="number form-control   required" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: hardwareClienteInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="hardwareCliente.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${soporte.Cliente.list()}" optionKey="id" required="" value="${hardwareClienteInstance?.cliente?.id}" class="many-to-one form-control "/>
</div>

<div class="fieldcontain ${hasErrors(bean: hardwareClienteInstance, field: 'hardware', 'error')} required">
	<label for="hardware">
		<g:message code="hardwareCliente.hardware.label" default="Hardware" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="hardware" name="hardware.id" from="${soporte.Hardware.list()}" optionKey="id" required="" value="${hardwareClienteInstance?.hardware?.id}" class="many-to-one form-control "/>
</div>

