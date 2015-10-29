<%@ page import="soporte.Cliente" %>



<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="cliente.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="40" required="" class="form-control  required" value="${clienteInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="cliente.email.label" default="Email" />
		
	</label>
	<div class="input-group"><span class="input-group-addon"><i class="fa fa-envelope"></i></span><g:field type="email" name="email" maxlength="40" class="form-control  unique noEspacios" value="${clienteInstance?.email}"/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'latitud', 'error')} ">
	<label for="latitud">
		<g:message code="cliente.latitud.label" default="Latitud" />
		
	</label>
	<g:textField name="latitud" value="${fieldValue(bean: clienteInstance, field: 'latitud')}" class="number form-control  "/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'longitud', 'error')} ">
	<label for="longitud">
		<g:message code="cliente.longitud.label" default="Longitud" />
		
	</label>
	<g:textField name="longitud" value="${fieldValue(bean: clienteInstance, field: 'longitud')}" class="number form-control  "/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'direccion', 'error')} ">
	<label for="direccion">
		<g:message code="cliente.direccion.label" default="Direccion" />
		
	</label>
	<g:textField name="direccion" maxlength="250" class="form-control " value="${clienteInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'propietario', 'error')} ">
	<label for="propietario">
		<g:message code="cliente.propietario.label" default="Propietario" />
		
	</label>
	<g:textField name="propietario" maxlength="100" class="form-control " value="${clienteInstance?.propietario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="cliente.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" maxlength="10" class="form-control " value="${clienteInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'codigo', 'error')} required">
	<label for="codigo">
		<g:message code="cliente.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigo" required="" class="form-control  required unique noEspacios" value="${clienteInstance?.codigo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'comercializador', 'error')} required">
	<label for="comercializador">
		<g:message code="cliente.comercializador.label" default="Comercializador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="comercializador" name="comercializador.id" from="${soporte.Comercializador.list()}" optionKey="id" required="" value="${clienteInstance?.comercializador?.id}" class="many-to-one form-control "/>
</div>

<div class="fieldcontain ${hasErrors(bean: clienteInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="cliente.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estado" value="${clienteInstance.estado}" class="digits form-control  required" required=""/>
</div>

