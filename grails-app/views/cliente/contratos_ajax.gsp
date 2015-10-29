<table class="table table-condensed">
    <thead>
        <tr>
            <th>Número</th>
            <th>Tipo</th>
            <th>Valor</th>
            <th>Desde</th>
            <th>Hasta</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
    <g:each in="${contratos}" var="c">
        <tr>
            <td>${c.numero}</td>
            <td>${c.tipo?.descripcion}</td>
            <td><g:formatNumber number="${c.valor}" type="currency" currencySymbol="\$"/></td>
            <td>${c.inicio?.format("dd-MM-yyyy")}</td>
            <td>${c.fin?.format("dd-MM-yyyy")}</td>
            <td>
                <g:link controller="contrato" action="nuevo" params="[id:c.id,cliente: cliente.codigo]" class="btn btn-sm btn-info">
                    <i class="fa fa-pencil"></i>
                </g:link>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
<a href="${g.createLink(action: 'nuevo',controller: 'contrato',params: [cliente:cliente.codigo])}" class="btn btn-success">
    <i class="fa fa-copy"></i> Nuevo
</a>