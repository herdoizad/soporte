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
<div id="contenedor">
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
        <div class="col-md-12" style="height: 720px;overflow: auto">
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
    <div class="cuadro rojo">
        <div class="row">
            <div class="col-md-5 numero-cuadro" >
                ${cerrados.size()}
            </div>
            <div class="col-md-7 texto-cuadro">
                Cerrados
            </div>
        </div>
    </div>
</div>
<div class="col-md-8">
    <div class="row" style="margin-top: 0px">
        <div class="col-md-6">
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

        <div class="col-md-6">
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
                        Ticket mas antiguo sin resolver
                    </div>
                </div>
                <div class="row" style="margin-top: 15px">
                    <div class="col-md-12 texto-cuadro-cuadro" >
                        #${masAntiguo?.id} - ${masAntiguo?.cliente?.nombre} -
                        ${masAntiguo?.categoria?.descripcion} <br/>
                        ${masAntiguo?.fecha?.format("dd-MM-yyyy HH:mm")}
                    </div>
                </div>
                <g:if test="${duracionMasAntiguo}">
                    <div class="row">
                        <div class="col-md-5 numero-cuadro" >
                            ${duracionMasAntiguo.days*24*60+duracionMasAntiguo.hours*60+duracionMasAntiguo.minutes}
                        </div>
                        <div class="col-md-7 texto-cuadro">
                            Minutos
                        </div>
                    </div>
                </g:if>
            </div>
            <div class="cuadro  naranja" style="margin-top: 15px;height: 140px">
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
        <div class="col-md-6">
            <div class="cuadro plomo " style="margin-top: 15px">
                <div class="row">
                    <div class="col-md-12 titulo">
                        Tickets por tipo
                    </div>
                </div>
                <div class="row" style="margin-top: 10px">
                    <div class="col-md-12">
                        <canvas id="chartHS" style="width: 100%;height: 300px"></canvas>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1" style="background:#F7464A ">
                        &nbsp;
                    </div>
                    <div class="col-md-10"> Hardware ${(datosHS[0]*100/datosHS.sum()).toDouble().round(2)}%</div>
                </div>
                <div class="row">
                    <div class="col-md-1" style="background:#46BFBD ">
                        &nbsp;
                    </div>
                    <div class="col-md-10"> Software ${(datosHS[1]*100/datosHS.sum()).toDouble().round(2)}%</div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="cuadro plomo " style="margin-top: 15px">
                <div class="row">
                    <div class="col-md-12 titulo">
                        Estaciones con más tickets
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <canvas id="chartRadar" style="width: 100%;height: 345px"></canvas>
                    </div>
                </div>
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
<div class="row" style="margin-top: 20px">
    <div class="col-md-12">
        <div class="cuadro plomo " style="margin-top: 15px">
            <div class="row">
                <div class="col-md-12 titulo">
                    Tickets por mes
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <canvas id="chartMes" style="width: 100%;height: 300px"></canvas>
                </div>
            </div>
        </div>

    </div>
</div>
</div>
<div class="row">
    <div class="col-md-1">
        <a href="#" id="pantalla" class="btn btn-info btn-sm">
            <i class="fa fa-desktop"></i>
        </a>
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
    ctx = $("#chartHS").get(0).getContext("2d");
    data = [
        {
            value: ${datosHS[0]},
            color:"#F7464A",
            highlight: "#FF5A5E",
            label: "Hardware"
        },
        {
            value: ${datosHS[1]},
            color: "#46BFBD",
            highlight: "#5AD3D1",
            label: "Software"
        }
    ]
    myNewChart = new Chart(ctx).Pie(data);
    ctx = $("#chartRadar").get(0).getContext("2d");
    var data = {
        labels: ${raw(clientes)},
        datasets: [
            {
                label: "Tickets por cliente",
                fillColor: "rgba(35, 198, 200,0.2)",
                strokeColor: "black",
                pointColor: "black",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [${datosClientes.join(",")}]
            }
        ]
    };
    myNewChart = new Chart(ctx).Radar(data);
    ctx = $("#chartMes").get(0).getContext("2d");
    var data = {
        labels: ${raw(meses)},
        datasets: [
            {
                label: "My First dataset",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "#1C84C6",
                pointColor: "#1C84C6",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [${datosMeses.join(",")}]
            }
        ]
    };
    myNewChart = new Chart(ctx).Line(data);
    $("#pantalla").click(function(){
        document.getElementById("contenedor").webkitRequestFullscreen();
        $("#contenedor").css({"overflow":"auto",width:"100%"})
    })
</script>
</body>
</html>