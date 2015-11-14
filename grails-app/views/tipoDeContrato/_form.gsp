<%@ page import="soporte.TipoDeContrato" %>



<div class="fieldcontain ${hasErrors(bean: tipoDeContratoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tipoDeContrato.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="100" required="" class="form-control  required" value="${tipoDeContratoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoDeContratoInstance, field: 'condiciones', 'error')} ">
	<label for="condiciones">
		<g:message code="tipoDeContrato.condiciones.label" default="Condiciones" />
		
	</label>
	<g:textArea name="condiciones" cols="40" rows="5" maxlength="500" class="form-control " value="${tipoDeContratoInstance?.condiciones}"/>
</div>

