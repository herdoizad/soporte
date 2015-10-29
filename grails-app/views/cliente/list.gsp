<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Clientes - Control system</title>
    <link href="${g.resource(dir: 'css/custom/', file: 'dashboard.css')}" rel="stylesheet" type="text/css">
    <imp:js src="${resource(dir: 'js/plugins/jquery-highlight',file: 'jquery-highlight1.js')}"></imp:js>
    <style>
    .td-semaforo{
        text-align: center;
        width: 110px;
    }
    .circle-card{
        width: 15px ;
        height: 15px;
    }
    .circle-btn{
        cursor: pointer;
    }
    .highlight { background-color: yellow; }
    .botones{
        position: absolute;
        top: 0px;
        right: 0px;
        width: 108px;
        height: 40px;
    }
    </style>
</head>
<body>
<elm:container tipo="horizontal" titulo="Clientes - Control system">
    <div class="botones">
        <a href="#" class="btn btn-info" id="nuevo"><i class="fa fa-plus"> Nuevo cliente</i></a>
    </div>
    <table class="table table-striped table-hover table-bordered table-sm" style="margin-top: 15px;font-size: 12px">
        <thead>
        <tr>
            <th>
                <div class="row" style="margin-top: 0px">
                    <div class="col-md-5">
                        <div class="input-group" >
                            <input type="text" class="form-control input-sm" id="txt-buscar" placeholder="Buscar">
                            <span class="input-group-addon svt-bg-primary " id="btn-buscar" style="cursor: pointer" >
                                <i class="fa fa-search " ></i>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-2">
                        Cliente
                    </div>
                    <div class="col-md-3 col-md-offset-2">
                        <a href="#" class="btn btn-primary btn-sm" id="reset"><i class="fa fa-refresh"></i> Resetear filtros</a>
                    </div>
                </div>
            </th>
            <th class="td-semaforo">
                Estado
                <div class="circle-card card-bg-green circle-btn licencia-green" title="Filtrar por color verde" mostrar="green-lic"></div>
                <div class="circle-card svt-bg-danger circle-btn licencia-red" title="Filtrar por color rojo" mostrar="red-lic"></div>
            </th>
            <th class="td-semaforo">
                Tickets
                <div class="circle-card card-bg-green circle-btn auditoria-green" title="Filtrar por color verde" mostrar="green-audt"></div>
                <div class="circle-card svt-bg-danger circle-btn auditoria-red" title="Filtrar por color rojo" mostrar="red-audt"></div>
            </th>
            <th class="td-semaforo">
                Visita
                <div class="circle-card card-bg-green circle-btn auditoria-green" title="Filtrar por color verde" mostrar="green-moni"></div>
                <div class="circle-card svt-bg-danger circle-btn auditoria-red" title="Filtrar por color rojo" mostrar="red-moni"></div>
            </th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${clientes}" var="c" status="">
            <tr data-id="${c.codigo}" class=" tr-info  ">
                <td class="desc">${c.nombre}</td>
                <td class="td-semaforo">
                    <div class="circle-card ${c.estado==1?'card-bg-green':'svt-bg-danger'}"></div>
                </td>
                <td class="td-semaforo">
                    <div class="circle-card ${c.getTicketsActivos().size()==0?'card-bg-green':'svt-bg-danger'}"></div>
                </td>
                <td class="td-semaforo">
                    <div class="circle-card ${c.getColorUltimaVisita()==1?'card-bg-green':'svt-bg-danger'}"></div>
                </td>

            </tr>
        </g:each>
        </tbody>
    </table>
</elm:container>
<script type="text/javascript">
    var id = null;
    function submitFormCliente() {
        var $form = $("#frmCliente");
        var $btn = $("#dlgCreateEditCliente").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            openLoader("Guardando Cliente");
            $.ajax({
                type    : "POST",
                url     : $form.attr("action"),
                data    : $form.serialize(),
                success : function (msg) {
                    location.href="${g.createLink(action: 'verCliente')}/"+msg
                },
                error: function() {
                    log("Ha ocurrido un error interno", "Error");
                    closeLoader();
                }
            });
        } else {
            return false;
        } //else
    }
    function deleteCliente(itemId) {
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-trash-o fa-3x pull-left text-danger text-shadow'></i><p>" +
                    "¿Está seguro que desea eliminar el Cliente seleccionado? Esta acción no se puede deshacer.</p>",
            buttons : {
                cancelar : {
                    label     : "Cancelar",
                    className : "btn-primary",
                    callback  : function () {
                    }
                },
                eliminar : {
                    label     : "<i class='fa fa-trash-o'></i> Eliminar",
                    className : "btn-danger",
                    callback  : function () {
                        openLoader("Eliminando Cliente");
                        $.ajax({
                            type    : "POST",
                            url     : '${createLink(controller:'cliente', action:'delete_ajax')}',
                            data    : {
                                id : itemId
                            },
                            success : function (msg) {
                                var parts = msg.split("*");
                                log(parts[1], parts[0] == "SUCCESS" ? "success" : "error"); // log(msg, type, title, hide)
                                if (parts[0] == "SUCCESS") {
                                    setTimeout(function() {
                                        location.reload(true);
                                    }, 1000);
                                } else {
                                    closeLoader();
                                }
                            },
                            error: function() {
                                log("Ha ocurrido un error interno", "Error");
                                closeLoader();
                            }
                        });
                    }
                }
            }
        });
    }
    function createEditCliente(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? { id: id } : {};
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller:'cliente', action:'form_ajax')}",
            data    : data,
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEditCliente",
                    title   : title + " Cliente",

                    class   : "modal-lg",

                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        },
                        guardar  : {
                            id        : "btnSave",
                            label     : "<i class='fa fa-save'></i> Guardar",
                            className : "btn-success",
                            callback  : function () {
                                return submitFormCliente();
                            } //callback
                        } //guardar
                    } //buttons
                }); //dialog
                setTimeout(function () {
                    b.find(".form-control").first().focus()
                }, 500);
            } //success
        }); //ajax
    } //createEdit

    function verCliente(id) {
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller:'cliente', action:'show_ajax')}",
            data    : {
                id : id
            },
            success : function (msg) {
                bootbox.dialog({
                    title   : "Ver Cliente",

                    class   : "modal-lg",

                    message : msg,
                    buttons : {
                        ok : {
                            label     : "Aceptar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        }
                    }
                });
            }
        });
    }

    function search(clase){
        $(".tr-info").hide()
        $("."+clase).show()
    }
    function verEstacion(id) {
        $.ajax({
            type: "POST",
            url: "${createLink(controller:'estacion', action:'show_ajax')}",
            data: {
                id: id
            },
            success: function (msg) {
                bootbox.dialog({
                    title: "Datos de la estación",
                    message: msg,
                    class:"modal-lg",
                    buttons: {
                        ok: {
                            label: "Aceptar",
                            className: "btn-primary",
                            callback: function () {
                            }
                        }
                    }
                });
            }
        });
        return false
    }

    $(function () {
        <g:if test="${search}">
        openLoader();
        search("${search}")
        closeLoader()
        </g:if>
        $("#nuevo").click(function(){
            createEditCliente();
        })
        $(".circle-btn").click(function () {
            $(".tr-info").hide()
            $("." + $(this).attr("mostrar")).show()
        });
        $("#reset").click(function () {
            $(".tr-info").show()
            $(".desc").removeHighlight();
        })

        $("#btn-buscar").click(function(){
            var buscar = $("#txt-buscar").val().trim()
            $(".desc").removeHighlight();
            $(".tr-info").hide()
            if(buscar!=""){
                $(".desc").highlight(buscar, true);
                $(".highlight").parents("tr").show()
            }else{
                $(".tr-info").show()
            }

        });
        $("tbody>tr").contextMenu({
            items: {
                header: {
                    label: "Acciones",
                    header: true
                },
                ver: {
                    label: "Ver",
                    icon: "fa fa-search",
                    action: function ($element) {
                        var id = $element.data("id");
                        location.href="${g.createLink(action: 'verCliente')}/"+id
                        return false;
                    }
                }
            },
            onShow: function ($element) {
                $element.addClass("success");
            },
            onHide: function ($element) {
                $(".success").removeClass("success");
            }
        });
    });
</script>
</body>
</html>