<%@ page import="soporte.Contactos" %>



<div class="fieldcontain ${hasErrors(bean: contactosInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="contactos.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="75" required="" class="form-control  required" value="${contactosInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactosInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="contactos.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" maxlength="10" required="" class="form-control  required" value="${contactosInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactosInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="contactos.email.label" default="Email" />
		
	</label>
	<div class="input-group"><span class="input-group-addon"><i class="fa fa-envelope"></i></span><g:field type="email" name="email" maxlength="100" class="form-control  unique noEspacios" value="${contactosInstance?.email}"/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: contactosInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="contactos.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estado" maxlength="1" required="" class="form-control  required" value="${contactosInstance?.estado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactosInstance, field: 'condicion', 'error')} ">
	<label for="condicion">
		<g:message code="contactos.condicion.label" default="Condicion" />
		
	</label>
	<g:textField name="condicion" maxlength="1" class="form-control " value="${contactosInstance?.condicion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactosInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="contactos.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${soporte.Cliente.list()}" optionKey="id" required="" value="${contactosInstance?.cliente?.id}" class="many-to-one form-control "/>
</div>

