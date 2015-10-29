<%@ page import="soporte.Visita" %>



<div class="fieldcontain ${hasErrors(bean: visitaInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="visita.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" class="form-control " value="${visitaInstance?.observaciones}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitaInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="visita.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${soporte.Cliente.list()}" optionKey="id" required="" value="${visitaInstance?.cliente?.id}" class="many-to-one form-control "/>
</div>

<div class="fieldcontain ${hasErrors(bean: visitaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="visita.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<elm:datepicker name="fecha"  class="datepicker form-control  required" value="${visitaInstance?.fecha}" />
</div>

<div class="fieldcontain ${hasErrors(bean: visitaInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="visita.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${soporte.seguridad.Persona.list()}" optionKey="id" required="" value="${visitaInstance?.usuario?.id}" class="many-to-one form-control "/>
</div>

