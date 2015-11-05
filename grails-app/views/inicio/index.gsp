<%@ page import="soporte.Estado" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <style type="text/css">
    .cuadro{
        min-height: 80px;
        width: 100%;
        padding: 10px;
    }

    .cuadro .row{
        margin: 0px;
    }
    .sombra{
        border-top: 5px solid #E7EAEC ;
    }
    .titulo{
        border-bottom:1px solid #E7EAEC ;
        padding-bottom: 5px;
        font-weight: bold;
        font-size: 20px;
    }
    .titulo-fondo{
        height: 20px;
        padding: 3px;
        padding-left: 5px;
        padding-right: 5px;
        border-radius: 3px;
        font-size: 8pt;
        margin-bottom: 10px;
    }
    .darkblue{
        background: #263949;
        color: #fff;
    }
    .verde-azul{
        background: #23C6C8;
        color: #fff;
    }
    .verde{
        background: #1AB394;
        color: #fff;
    }
    .naranja{
        background: #F8AC59;
        color: #fff;


    }
    .azul{
        background: #1C84C6;
        color: #fff;


    }
    .rojo{
        background: #EF5352 !important;
        color: #fff;
    }
    .plomo{
        background: #F3F3F4 !important;
        color: #000;
    }
    .numero-cuadro{
        font-size: 50px;
        line-height: 50px;
    }
    .texto-cuadro{
        font-size: 30px;
        line-height: 50px;
    }
    </style>
    <link href="${g.resource(dir: 'css/custom/', file: 'dashboard.css')}" rel="stylesheet" type="text/css">
    <link href="${g.resource(dir: 'css/', file: 'circle.css')}" rel="stylesheet" type="text/css">
    <script src="${g.resource(dir: 'js/plugins/Chart.js-master',file: 'Chart.js')}"></script>
</head>
<body>

<div class="row">
    <div class="col-md-4">
        <div class="cuadro rojo">
            <div class="row">
                <div class="col-md-12 titulo">
                    Tickets
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 numero-cuadro" >
                    ${abiertos.size()}
                </div>
                <div class="col-md-7 texto-cuadro">
                    Abiertos
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-condensed">
                    <tbody>
                    <g:each in="${abiertos}" var="a">
                        <tr>
                            <td style="text-align: center">${a.id}</td>
                            <td>
                                <label>${a.cliente.nombre}</label>
                                <br/>
                                ${a.categoria.descripcion}
                            </td>
                            <td>
                                ${a.fecha.format("dd-MM-yyyy HH:mm")}
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="cuadro  verde-azul">
            <div class="row">
                <div class="col-md-12 titulo">
                    Resumen
                </div>
            </div>
            <div class="row" style="margin-top: 10px;text-align: center">
                <div class="col-md-7 " >
                    <div class="c100 p${pDia} ${pDia<75?'rojo':''}">
                        <span>${pDia}%</span>
                        <div class="slice">
                            <div class="bar"></div>
                            <div class="fill"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 texto-cuadro" style="line-height: 110px">
                    Hoy
                </div>
            </div>
            <div class="row" style="margin-top: 10px;text-align: center">
                <div class="col-md-7 " >
                    <div class="c100 p${pSemana} ${pSemana<75?'rojo':''}">
                        <span>${pSemana}%</span>
                        <div class="slice">
                            <div class="bar"></div>
                            <div class="fill"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 texto-cuadro" style="line-height: 110px">
                    Semana
                </div>
            </div>
            <div class="row" style="margin-top: 10px;text-align: center">
                <div class="col-md-7 " >
                    <div class="c100 p${pTotal} ${pTotal<75?'rojo':''}">
                        <span>${pTotal}%</span>
                        <div class="slice">
                            <div class="bar "></div>
                            <div class="fill "></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 texto-cuadro" style="line-height: 110px">
                    Total
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="cuadro  azul">
            <div class="row">
                <div class="col-md-12 titulo">
                    Clientes
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 numero-cuadro" >
                    ${soporte.Cliente.countByEstado("1")}
                </div>
                <div class="col-md-7 texto-cuadro">
                    Activos
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 numero-cuadro" >
                    ${soporte.Cliente.countByEstado("0")}
                </div>
                <div class="col-md-7 texto-cuadro">
                    Inactivos
                </div>
            </div>
        </div>
        <div class="cuadro  verde" style="margin-top: 15px">
            <div class="row">
                <div class="col-md-12 titulo">
                    Tickets
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 numero-cuadro" >
                    ${abiertos.size()}
                </div>
                <div class="col-md-7 texto-cuadro">
                    Abiertos
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 numero-cuadro" >
                    ${cerrados.size()}
                </div>
                <div class="col-md-7 texto-cuadro">
                    Cerrados
                </div>
            </div>
        </div>
        <div class="cuadro  naranja" style="margin-top: 15px">
            <div class="row">
                <div class="col-md-12 titulo">
                    Tiempo promedio de respuesta
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 numero-cuadro" >
                    ${(int)(promedio/60)}
                </div>
                <div class="col-md-7 texto-cuadro">
                    Minutos
                </div>
            </div>

        </div>
    </div>


</div>
<div class="row" style="margin-top: 20px">
    <div class="col-md-12">
        <div class="cuadro plomo " style="margin-top: 15px">
            <div class="row">
                <div class="col-md-12 titulo">
                    Tickets por categoria
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <canvas id="myChart" style="width: 100%;height: 300px"></canvas>
                </div>
            </div>
        </div>

    </div>
</div>
<script type="text/javascript">
    var ctx = $("#myChart").get(0).getContext("2d");
    var data = {
        labels: ${raw(categorias)},
        datasets: [
            {
                label: "Tickets por categoria",
                fillColor: "#F8AC59",
                strokeColor: "rgba(220,220,220,0.8)",
                highlightFill: "#263949",
                highlightStroke: "rgba(220,220,220,1)",
                data: [${datosCategorias.join(",")}]
            }
        ]
    };
    var myNewChart = new Chart(ctx).Bar(data);
</script>
</body>
</html>