<%--
  Created by IntelliJ IDEA.
  User: luz
  Date: 19/12/14
  Time: 04:55 PM
--%>

<%@ page import="soporte.seguridad.Perfil" contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Estructura del Menú y Procesos</title>

        <style type="text/css">
        .orden, .icono {
            cursor : pointer;
        }
        </style>

    </head>

    <body>

        <div class="alert alert-primary padding-sm">
            <div class="row margin-sm">
                <div class="col-md-8">
                    <p class="form-control-static">
                        Seleccione el módulo y el perfil para fijar permisos
                    </p>
                </div>

                <div class="col-md-2">
                    <p class="form-control-static">
                        Seleccione el perfil
                    </p>
                </div>

                <div class="col-md-2">
                    <g:select name="perfil" class="form-control input-sm" from="${Perfil.list([sort: 'descripcion'])}"
                              optionKey="codigo" optionValue="descripcion"/>
                </div>
            </div>
        </div>

        <ul class="nav nav-pills corner-all" style="border: solid 1px #cccccc; margin-bottom: 10px;">
            <g:each in="${modulos}" var="modulo">
                <li role="presentation">
                    <a href="#" class="mdlo" id="${modulo.id}">
                        <g:if test="${modulo.icono}">
                            <i class="${modulo.icono}"></i>
                        </g:if>
                        ${modulo.nombre}
                    </a>
                </li>
            </g:each>
        </ul>

        <div class="well" id="acciones">

        </div>

        <div class="btn-toolbar">
            <div class="btn-group">
                <a href="#" id="btnCargarAcc" class="btn btn-sm btn-warning">
                    <i class="fa fa-paper-plane-o"></i> Cargar acciones
                </a>
            </div>

            <div class="btn-group">
                <a href="${g.createLink(controller: 'sistema',action: 'list')}" target="_blank" id="btnCrearSistema" class="btn btn-sm btn-success">
                    <i class="icon-grails-alt"></i> Administrar Sistemas
                </a>
                <a href="#" id="btnCrearModulo" class="btn btn-sm btn-success">
                    <i class="fa fa-file-o"></i> Crear módulo
                </a>
                <a href="#" id="btnEditarModulo" class="btn btn-sm btn-success">
                    <i class="fa fa-pencil"></i> Editar módulo
                </a>
                <a href="#" id="btnBorrarModulo" class="btn btn-sm btn-success">
                    <i class="fa fa-trash-o"></i> Eliminar módulo
                </a>
            </div>

        </div>

        <script type="text/javascript">

            function reload() {
                var id = $(".active").find(".mdlo").attr("id");
                var perfil = $("#perfil").val();
                $("#acciones").html(spinner);
                $.ajax({
                    type    : "POST",
                    url     : "${createLink(controller:'acciones', action:'acciones_ajax')}",
                    data    : {
                        id   : id,
                        perf : perfil
                    },
                    success : function (msg) {
                        $("#acciones").html(msg);
                    }
                });
            }

            /* **************************************** MODULO ******************************************************** */
            function submitFormModulo() {
                var $form = $("#frmModulo");
                var $btn = $("#dlgCreateEdit").find("#btnSave");
                if ($form.valid()) {
                    $btn.replaceWith(spinner);
                    openLoader("Guardando Módulo");
                    $.ajax({
                        type    : "POST",
                        url     : $form.attr("action"),
                        data    : $form.serialize(),
                        success : function (msg) {
                            var parts = msg.split("*");
                            log(parts[1], parts[0] == "SUCCESS" ? "success" : "error"); // log(msg, type, title, hide)
                            setTimeout(function () {
                                if (parts[0] == "SUCCESS") {
                                    location.reload(true);
                                } else {
                                    spinner.replaceWith($btn);
                                    return false;
                                }
                            }, 1000);
                        }
                    });
                } else {
                    return false;
                } //else
            }
            function deleteModulo(itemId) {
                bootbox.dialog({
                    title   : "Alerta",
                    message : "<i class='fa fa-trash-o fa-3x pull-left text-danger text-shadow'></i><p>" +
                              "¿Está seguro que desea eliminar el Módulo seleccionado (<strong>" + $.trim($(".active").find(".mdlo").text()) + "</strong>)? " +
                              "Esta acción no se puede deshacer.</p>",
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
                                openLoader("Eliminando Módulo");
                                $.ajax({
                                    type    : "POST",
                                    url     : '${createLink(controller: 'modulo', action:'delete_ajax')}',
                                    data    : {
                                        id : itemId
                                    },
                                    success : function (msg) {
                                        var parts = msg.split("*");
                                        log(parts[1], parts[0] == "SUCCESS" ? "success" : "error"); // log(msg, type, title, hide)
                                        if (parts[0] == "SUCCESS") {
                                            setTimeout(function () {
                                                location.reload(true);
                                            }, 1000);
                                        } else {
                                            closeLoader();
                                        }
                                    }
                                });
                            }
                        }
                    }
                });
            }
            function createEditModulo(id) {
                var title = id ? "Editar" : "Crear";
                var data = id ? {id : id} : {};
                openLoader();
                $.ajax({
                    type    : "POST",
                    url     : "${createLink(controller: 'modulo', action:'form_ajax')}",
                    data    : data,
                    success : function (msg) {
                        closeLoader();
                        var b = bootbox.dialog({
                            id    : "dlgCreateEdit",
                            title : title + " Módulo",

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
                                        return submitFormModulo();
                                    } //callback
                                } //guardar
                            } //buttons
                        }); //dialog
                        setTimeout(function () {
                            b.find(".form-control input-sm").first().focus()
                        }, 500);
                    } //success
                }); //ajax
            } //createEdit
            /* **************************************** MODULO ******************************************************** */

            $(function () {
                $(".mdlo").click(function () {
                    $(".active").removeClass("active");
                    $(this).parent().addClass("active");
                    reload();
                    return false;
                }).first().click();

                $("#perfil").change(function () {
                    reload();
                });

                $("#btnCrearPerfil").click(function () {
                    createEditPerfil();
                    return false;
                });
                $("#btnEditarPerfil").click(function () {
                    createEditPerfil($("#perfil").val());
                    return false;
                });
                $("#btnBorrarPerfil").click(function () {
                    deletePerfil($("#perfil").val());
                    return false;
                });

                $("#btnCrearModulo").click(function () {
                    createEditModulo();
                    return false;
                });
                $("#btnEditarModulo").click(function () {
                    createEditModulo($(".active").find(".mdlo").attr("id"));
                    return false;
                });
                $("#btnBorrarModulo").click(function () {
                    deleteModulo($(".active").find(".mdlo").attr("id"));
                    return false;
                });

                $("#btnCargarAcc").click(function () {
                    bootbox.confirm("¿Está seguro de querer cargar las acciones desde Grails?", function (result) {
                        if (result) {
                            openLoader();
                            $.ajax({
                                type    : "POST",
                                url     : "${createLink(controller:'acciones', action:'cargarAcciones_ajax')}",
                                success : function (msg) {
                                    closeLoader();
                                    var parts = msg.split("*");
                                    log(parts[1], parts[0] == "SUCCESS" ? "success" : "error"); // log(msg, type, title, hide)
                                    $(".mdlo").first().click();
                                }
                            });
                        }
                    });
                });
            });
        </script>

    </body>
</html>