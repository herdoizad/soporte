<%@ page import="soporte.Contrato" %>



<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'fin', 'error')} ">
	<label for="fin">
		<g:message code="contrato.fin.label" default="Fin" />
		
	</label>
	<elm:datepicker name="fin"  class="datepicker form-control " value="${contratoInstance?.fin}" />
</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'path', 'error')} ">
	<label for="path">
		<g:message code="contrato.path.label" default="Path" />
		
	</label>
	<g:textField name="path" maxlength="150" class="form-control " value="${contratoInstance?.path}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'numero', 'error')} ">
	<label for="numero">
		<g:message code="contrato.numero.label" default="Numero" />
		
	</label>
	<g:textField name="numero" maxlength="20" class="form-control " value="${contratoInstance?.numero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="contrato.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${soporte.Cliente.list()}" optionKey="id" required="" value="${contratoInstance?.cliente?.id}" class="many-to-one form-control "/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'inicio', 'error')} required">
	<label for="inicio">
		<g:message code="contrato.inicio.label" default="Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<elm:datepicker name="inicio"  class="datepicker form-control  required" value="${contratoInstance?.inicio}" />
</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="contrato.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${soporte.TipoDeContrato.list()}" optionKey="id" required="" value="${contratoInstance?.tipo?.id}" class="many-to-one form-control "/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratoInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="contrato.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="valor" value="${fieldValue(bean: contratoInstance, field: 'valor')}" class="number form-control   required" required=""/>
</div>

