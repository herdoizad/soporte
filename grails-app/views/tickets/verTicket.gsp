<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ticket #${ticket.id}</title>
    <meta name="layout" content="main"/>
    <imp:js src="${resource(dir: 'js/plugins/bootstrap-combobox/js', file: 'bootstrap-combobox.js')}"/>
    <imp:css src="${resource(dir: 'js/plugins/bootstrap-combobox/css', file: 'bootstrap-combobox.css')}"/>
    <style>
    .P01{
        color: black;
    }
    .P02{
        color: #f4bf89;
    }
    .P03{
        color: #f63318;
    }
    </style>
</head>
<body>
<elm:container tipo="horizontal" titulo="Ticket #${ticket.id} - Estado: ${ticket.estado.descripcion.toUpperCase()} - ${ticket.cliente.nombre}">
    <div class="row fila">
        <div class="col-md-6">

            <label>Prioridad:</label> <span class="${ticket.prioridad.codigo}">${ticket.prioridad.descripcion}</span> -
            <label>Categoria:</label> ${ticket.categoria.descripcion} -
            <label>Fecha:</label> ${ticket.fecha.format("dd-MM-yyyy HH:mm")}
        </div>
        <div class="col-md-5">
            Este ticket deberá ser resuelto antes de:
            <label>${fechaLimite.format("dd-MM-yyyy HH:mm")}</label> <i class="fa fa-warning" style="color: orange"></i>
        </div>
        <g:if test="${accciones.size()>0}">
            <g:form action="cambiarEstado_ajax" class="frm-estado">
                <input type="hidden" id="condicion" name="estado">
                <input type="hidden"  name="id" value="${ticket.id}">
            </g:form>
            <g:if test="${ticket.estado.codigo=='P01'}">
                <div class="col-md-1">
                    <a href="#" id="cerrar" class="btn btn-success btn-sm">
                        <i class="fa fa-check"></i> Cerrar
                    </a>
                </div>
            </g:if>
            <g:if test="${ticket.estado.codigo=='P02'}">
                <div class="col-md-1">
                    <a href="#" id="abrir" class="btn btn-danger btn-sm">
                        <i class="fa fa-unlock"></i> Abrir
                    </a>
                </div>
            </g:if>
        </g:if>
    </div>

    <div class="row fila">
        <div class="col-md-1">
            <label>Estado:</label>
        </div>
        <div class="col-md-2">
            ${ticket.estado.descripcion} <i class="fa fa-warning" style="color: orange"></i>
        </div>
        <g:if test="${ticket.estado.codigo=='P02'}">
            <div class="col-md-1">
                <label>Cerrado el:</label>
            </div>
            <div class="col-md-2">
                ${ticket.cierre?.format("dd-MM-yyyy HH:mm")}
            </div>
        </g:if>
    </div>

    <div class="row fila">
        <div class="col-md-1">
            <label>Problema:</label>
        </div>
        <div class="col-md-10">
            ${ticket.descripcion}
        </div>
    </div>
    <div class="row fila">
        <div class="col-md-12" style="border: 1px solid black"></div>
    </div>

    <g:each in="${accciones}" var="a">
        <div class="row fila">
            <div class="col-md-11">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Por ${a.usuario.login}, el ${a.fecha.format("dd-MM-yyyy HH:mm:ss")}
                    </div>
                    <div class="panel-body">
                        <div class="row fila">
                            <div class="col-md-1">
                                <label>Acción tomada:</label>
                            </div>
                            <div class="col-md-10">
                                <pre>${a.resumen}</pre>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </g:each>
    <g:if test="${ticket.estado.codigo=='P01'}">
        <div class="row fila">
            <div class="col-md-11">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Nueva acción
                    </div>
                    <div class="panel-body">
                        <g:form action="saveAccion_ajax" class="frm-accion">
                            <input type="hidden" name="ticket" value="${ticket.id}">
                            <input type="hidden" id="bandera" name="bandera" value="0">
                            <div class="row fila">
                                <div class="col-md-1">
                                    <label>Acción tomada:</label>
                                </div>
                                <div class="col-md-10">
                                    <textarea class="form-control input-sm required" id="resumen" name="resumen" style="height: 100px;resize: vertical;"></textarea>
                                </div>
                            </div>
                            <div class="row fila">
                                <div class="col-md-1 col-md-offset-1">
                                    <a href="#" id="guardar" class="btn btn-info">
                                        <i class="fa fa-save"></i> Guardar
                                    </a>
                                </div>
                                <div class="col-md-2 ">
                                    <a href="#" id="guardarYcerrar" class="btn btn-success">
                                        <i class="fa fa-save"></i> Guardar y terminar
                                    </a>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </g:if>

</elm:container>
<script type="text/javascript">
    $("#guardar").click(function(){
        if($("#resumen").val()!=""){
            $("#bandera").val(0)
            $(".frm-accion").submit()
        }
    })
    $("#guardarYcerrar").click(function(){
        if($("#resumen").val()!=""){
            $("#bandera").val(1)
            $(".frm-accion").submit()
        }
    })
    $("#abrir").click(function(){
        $("#condicion").val("-1")
        $(".frm-estado").submit()
    })
    $("#cerrar").click(function(){
        $("#condicion").val("1")
        $(".frm-estado").submit()
    })
</script>
</body>
</html>