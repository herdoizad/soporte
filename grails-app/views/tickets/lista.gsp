<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Tickets</title>
    <meta name="layout" content="main"/>
    <style>
        .btn-xs{
            height: 15px;
            padding: 2px;
            line-height: 8px;
            font-size: 9px;
        }
        .circle-card{
            width: 15px !important;
            height: 15px !important;
        }
    </style>
    <link href="${g.resource(dir: 'css/custom/', file: 'dashboard.css')}" rel="stylesheet" type="text/css">
</head>
<body>
<elm:container tipo="horizontal" titulo="Tickets">
    <div class="row fila">
        <div class="col-md-12">
            <table class="table table-condensed table-bordered table-sm">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Cliente</th>
                    <th>Categoria</th>
                    <th>Problema</th>
                    <th>Fecha</th>
                    <th>Estado</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${abiertos}" var="a">
                    <tr>
                        <td style="text-align: center">${a.id}</td>
                        <td>${a.cliente.nombre}</td>
                        <td>${a.categoria.descripcion}</td>
                        <td>${a.descripcion}</td>
                        <td style="text-align: center">${a.fecha.format("dd-MM-yyyy HH:mm")}</td>
                        <td style="text-align: center">${a.estado.descripcion}</td>
                        <td style="width: 40px">
                            <div class="circle-card ${a.getColorSemaforo()}"></div>
                        </td>
                        <td style="text-align: center;width: 40px">
                            <g:link class="btn btn-info btn-xs" action="verTicket" id="${a.id}">
                                <i class="fa fa-search"></i> Ver</g:link>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row fila">
        <div class="col-md-12" style="border: 1px solid black"></div>
    </div>
    <div class="row fila">
        <div class="col-md-1">
            <label>Filtros:</label>
        </div>
        <div class="col-md-2">
            <g:select name="cliente" from="${soporte.Cliente.list([sort: 'nombre'])}" noSelection="['':'']"
                      optionKey="codigo" optionValue="nombre" id="cliente" class="form-control input-sm"
            />
        </div>
        <div class="col-md-2">
            <g:select name="estado" from="${soporte.Estado.list([sort: 'descripcion'])}"  noSelection="['':'']"
                      optionKey="id" optionValue="descripcion" id="estado" class="form-control input-sm"
            />
        </div>
        <div class="col-md-2">
            <g:select name="categoria" from="${soporte.Categoria.list([sort: 'descripcion'])}"  noSelection="['':'']"
                      optionKey="id" optionValue="descripcion" id="categoria" class="form-control input-sm"
            />
        </div>
        <div class="col-md-1">
            <label>Contiene:</label>
        </div>
        <div class="col-md-2">
            <input type="text" class="form-control input-sm" name="descripcion" id="descripcion" placeholder="Palabra clave" >
        </div>
        <div class="col-md-1">
            <a href="#" class="btn btn-info btn-sm" id="buscar">
                <i class="fa fa-search"></i> Buscar
            </a>
        </div>
    </div>
    <div class="row fila">
        <div class="col-md-12" id="lista">

        </div>
    </div>
    <div class="row fila">
        <div class="col-md-12" style="border: 1px solid black"></div>
    </div>
</elm:container>
<script>
    $("#buscar").click(function(){
        openLoader()
        var cliente = $("#cliente").val()
        var categoria =  $("#categoria").val()
        var estado =  $("#estado").val()
        var descripcion =  $("#descripcion").val()
        $.ajax({
            type: "POST",
            url: "${createLink(controller:'tickets', action:'lista_ajax')}",
            data:{
                cliente:cliente,
                categoria:categoria,
                estado:estado,
                descripcion:descripcion
            },
            success: function (msg) {
                closeLoader()
                $("#lista").html(msg)
            } //success
        }); //ajax
    })
</script>
</body>
</html>