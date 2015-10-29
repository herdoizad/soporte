<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Cliente ${cliente.nombre}</title>
    <meta name="layout" content="main"/>
    <link href="${g.resource(dir: 'css/custom/', file: 'dashboard.css')}" rel="stylesheet" type="text/css">
    <imp:js src="${resource(dir: 'js/plugins/jquery-highlight',file: 'jquery-highlight1.js')}"></imp:js>
    <style>
    .cuadro{
        background: rgba(0, 145, 179, 0.40);
        /*background: rgba(255, 193, 115,0.4);*/
        padding: 15px;
        border-radius: 10px;
    }
    .control{
        cursor: pointer;
    }
    .botones{
        position: absolute;
        top: 0px;
        right: 0px;
        width: 108px;
        height: 40px;
    }
    h2{
        font-size: 18px;
    }
    .circle-card{
        width: 20px ;
        height: 20px;
    }
    </style>
</head>
<body>

<elm:container tipo="horizontal" titulo="${cliente.nombre}">
    <div class="botones">
        <a href="#" class="btn btn-default detalles" id="editar" iden="${cliente.codigo}">
            <i class="fa fa-pencil"></i> Editar
        </a>
    </div>
    <div class="row">
        <div class="col-md-1"><label>Estado:</label></div>
        <div class="col-md-1">
            <div class="circle-card ${cliente.estado==1?'card-bg-green':'svt-bg-danger'}"></div>
        </div>
        <div class="col-md-1"><label>Contrato:</label></div>
        <div class="col-md-1">#${contrato?.numero}</div>
        <g:if test="${contrato}">
            <div class="col-md-3">Del ${contrato?.inicio?.format("dd-MM-yyyy")} Al ${contrato?.fin?.format("dd-MM-yyyy")}</div>
        </g:if>
        <div class="col-md-1"><label>Monto:</label></div>
        <div class="col-md-1" style="text-align: right"><g:formatNumber number="${contrato?.valor}" type="currency"/></div>
        <div class="col-md-1">
            <a href="#" class="btn btn-info btn-sm" id="contratos"><i class="fa fa-pencil"></i> Contratos</a>
        </div>
    </div>
    <div class="cuadro" style="margin-top: 10px;">
        <div class="row fila  " style="margin-top: 0px">
            <div class="col-md-1 ">
                <label>Nombre:</label>
            </div>
            <div class="col-md-3">
                ${cliente.nombre}
            </div>
            <div class="col-md-1 ">
                <label>Email:</label>
            </div>
            <div class="col-md-3">
                ${cliente.email}
            </div>
            <div class="col-md-1 ">
                <label>Teléfono:</label>
            </div>
            <div class="col-md-3">
                ${cliente.telefono}
            </div>
        </div>
        <div class="row">
            <div class="col-md-1">
                <label>Código:</label>
            </div>
            <div class="col-md-3">
                ${cliente.codigo}
            </div>
            <div class="col-md-1">
                <label>Comercializador:</label>
            </div>
            <div class="col-md-3">
                ${cliente.comercializador?.nombre}
            </div>
            <div class="col-md-1">
                <label>Propietario:</label>
            </div>
            <div class="col-md-3">
                ${cliente.propietario}
            </div>
        </div>
        <div class="row">
            <div class="col-md-1">
                <label>Dirección:</label>
            </div>
            <div class="col-md-3">
                ${cliente.direccion}
            </div>
            <div class="col-md-2">
                <label>Última visita:</label>
            </div>
            <div class="col-md-2">
                ${ultimaVisita?.format("dd-MM-yyyy")}
            </div>
            <div class="col-md-2">
                <label>Último ticket:</label>
            </div>
            <div class="col-md-2">
                <g:if test="${ultimoTicket}">
                    <g:link controller="tickets" class=" btn-sm" action="verTicket" id="${ultimoTicket?.id}">
                        #${ultimoTicket?.id}  <i class="fa fa-search"></i>
                    </g:link>
                </g:if>
            </div>
        </div>
    </div>
    <div class="row " style="margin-top: 0px">
        <div class="col-md-4">
            <h2> Contactos <span style="float: right;margin-right: 15px" id="contactos" class="control"><i class="fa fa-edit"></i></span></h2>
            <table class="table table-condensed ">
                <thead>
                <tr>
                    <th style="background: none;color: black">Nombre</th>
                    <th style="background: none;color: black">Teléfono</th>
                    <th style="background: none;color: black">Email</th>
                    <th style="background: none;color: black"></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${contactos}" var="c">
                    <tr>
                        <td>
                            <a href="#" class="edit-contacto" iden="${c.id}">${c.nombre}</a>
                        </td>
                        <td>${c.telefono}</td>
                        <td>${c.email}</td>
                        <td style="text-align: center">
                            <g:if test="${c.condicion=='P'}">
                                <i class="fa fa-thumbs-up" style="color: #2787e3"></i>
                            </g:if>
                            <g:else>
                                <i class="fa fa-thumbs-down" style="color: orange"></i>
                            </g:else>

                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <div class="col-md-4">
            <h2> Software <span style="float: right;margin-right: 15px" id="soft" class="control"><i class="fa fa-edit"></i></span></h2>
            <table class="table table-condensed ">
                <thead>
                <tr>
                    <th style="background: none;color: black">Nombre</th>
                    <th style="background: none;color: black">Version</th>
                    <th style="background: none;color: black">Instalado</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${software}" var="s">
                    <tr>
                        <td>
                            <a href="#" class="edit-soft" iden="${s.id}">${s.software.nombre}</a>
                        </td>
                        <td style="text-align: center">${s.versionSoftware}</td>
                        <td style="text-align: center">${s.instalacion?.format('dd-MM-yyyy')}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <div class="col-md-4">
            <h2> Hardware <span style="float: right;margin-right: 15px" id="hard"  class="control"><i class="fa fa-edit"></i></span></h2>
            <table class="table table-condensed ">
                <thead>
                <tr>
                    <th style="background: none;color: black">Nombre</th>
                    <th style="background: none;color: black">Marca</th>
                    <th style="background: none;color: black">Modelo</th>
                    <th style="background: none;color: black">Cantidad</th>
                    <th style="background: none;color: black">Versión</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${hardware}" var="h">
                    <tr>
                        <td>
                            <a href="#" class="edit-hard" iden="${h.id}">${h.hardware.nombre}</a>
                        </td>
                        <td>${h.hardware.marca}</td>
                        <td style="text-align: center">${h.hardware.modelo}</td>
                        <td style="text-align: right">${h.cantidad}</td>
                        <td style="text-align: center">${h.versionHardware}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</elm:container>
<script type="text/javascript">
    var id = null;
    function submitFormHardwareCliente() {
        var $form = $("#frmHardwareCliente");
        var $btn = $("#dlgCreateEditHardwareCliente").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            openLoader("Guardando HardwareCliente");
            $.ajax({
                type    : "POST",
                url     : $form.attr("action"),
                data    : $form.serialize(),
                success : function (msg) {
                    var parts = msg.split("*");
                    window.location.reload(true)
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
    function deleteHardwareCliente(itemId) {
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-trash-o fa-3x pull-left text-danger text-shadow'></i><p>" +
                    "¿Está seguro que desea eliminar el HardwareCliente seleccionado? Esta acción no se puede deshacer.</p>",
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
                        openLoader("Eliminando HardwareCliente");
                        $.ajax({
                            type    : "POST",
                            url     : '${createLink(controller:'hardwareCliente', action:'delete_ajax')}',
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
    function createEditHardwareCliente(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? { id: id } : {};
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller:'hardwareCliente', action:'form_ajax')}",
            data    : {
                id:id,
                cliente:"${cliente.codigo}"
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEditHardwareCliente",
                    title   : title + " HardwareCliente",

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
                                return submitFormHardwareCliente();
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
    function verHardwareCliente(id) {
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller:'hardwareCliente', action:'show_ajax')}",
            data    : {
                id : id
            },
            success : function (msg) {
                bootbox.dialog({
                    title   : "Ver HardwareCliente",

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
    function submitFormSoftwareCliente() {
        var $form = $("#frmSoftwareCliente");
        var $btn = $("#dlgCreateEditSoftwareCliente").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            openLoader("Guardando SoftwareCliente");
            $.ajax({
                type    : "POST",
                url     : $form.attr("action"),
                data    : $form.serialize(),
                success : function (msg) {
                    var parts = msg.split("*");
                    window.location.reload(true)
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
    function deleteSoftwareCliente(itemId) {
        bootbox.dialog({
            title   : "Alerta",
            message : "<i class='fa fa-trash-o fa-3x pull-left text-danger text-shadow'></i><p>" +
                    "¿Está seguro que desea eliminar el SoftwareCliente seleccionado? Esta acción no se puede deshacer.</p>",
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
                        openLoader("Eliminando SoftwareCliente");
                        $.ajax({
                            type    : "POST",
                            url     : '${createLink(controller:'softwareCliente', action:'delete_ajax')}',
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
    function createEditSoftwareCliente(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? { id: id } : {};
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller:'softwareCliente', action:'form_ajax')}",
            data    : {
                id:id,
                cliente:"${cliente.codigo}"
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEditSoftwareCliente",
                    title   : title + " SoftwareCliente",

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
                                return submitFormSoftwareCliente();
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
    function submitFormContactos() {
        var $form = $("#frmContactos");
        var $btn = $("#dlgCreateEditContactos").find("#btnSave");
        if ($form.valid()) {
            $btn.replaceWith(spinner);
            openLoader("Guardando Contactos");
            $.ajax({
                type    : "POST",
                url     : $form.attr("action"),
                data    : $form.serialize(),
                success : function (msg) {
                    window.location.reload(true)
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
    function createEditContactos(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? { id: id } : {};
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller:'contactos', action:'form_ajax')}",
            data    : {
                id:id,
                cliente:"${cliente.codigo}"
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlgCreateEditContactos",
                    title   : title + " Contactos",

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
                                return submitFormContactos();
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

    $("#contratos").click(function(){
        $.ajax({
            type    : "POST",
            url     : "${createLink(controller:'cliente', action:'contratos_ajax')}",
            data    : {
                cliente:"${cliente.codigo}"
            },
            success : function (msg) {
                var b = bootbox.dialog({
                    id      : "dlg_contratos",
                    title   : "Contratos ",

                    class   : "modal-lg",

                    message : msg,
                    buttons : {
                        cancelar : {
                            label     : "Cerrar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        }
                    } //buttons
                }); //dialog
                setTimeout(function () {
                    b.find(".form-control").first().focus()
                }, 500);
            } //success
        }); //ajax
    })

    $("#contactos").click(function(){
        createEditContactos()
    })
    $("#soft").click(function(){
        createEditSoftwareCliente()
    })
    $("#hard").click(function(){
        createEditHardwareCliente()
    })
    $("#editar").click(function(){
        createEditCliente($(this).attr("iden"))
    })
    $(".edit-contacto").click(function(){
        createEditContactos($(this).attr("iden"))
        return false
    })
    $(".edit-soft").click(function(){
        createEditSoftwareCliente($(this).attr("iden"))
        return false
    })
    $(".edit-hard").click(function(){
        createEditHardwareCliente($(this).attr("iden"))
        return false
    })
</script>
</body>
</html>