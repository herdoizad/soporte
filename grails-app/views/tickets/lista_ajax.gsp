<table class="table table-condensed table-bordered table-sm">
    <thead>
    <tr>
        <th>#</th>
        <th>Cliente</th>
        <th>Categoria</th>
        <th>Fecha</th>
        <th>Problema</th>
        <th>Estado</th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${tickets}" var="a">
        <tr>
            <td style="text-align: center">${a.id}</td>
            <td>${a.cliente.nombre}</td>
            <td>${a.categoria.descripcion}</td>
            <td style="width: 110px;text-align: center">${a.fecha.format("dd-MM-yyyy HH:mm")}</td>
            <td>${a.descripcion}</td>
            <td style="text-align: center">${a.estado.descripcion}</td>
            <td style="text-align: center;width: 40px">
                <g:link class="btn btn-info btn-xs" action="verTicket" id="${a.id}">
                    <i class="fa fa-search"></i> Ver</g:link>
            </td>
            <td style="text-align: center;width: 40px">
                <g:link class="btn btn-info btn-xs" action="nuevo" id="${a.id}" title="Editar">
                    <i class="fa fa-pencil"></i> </g:link>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
