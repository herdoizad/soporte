<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Control system</title>
    %{--<link rel="stylesheet" type="text/css" href="${g.resource(dir: 'js/plugins/CircularNavigation/css',file: 'normalize.css')}"/>--}%
    %{--<link rel="stylesheet" type="text/css" href="${g.resource(dir: 'js/plugins/CircularNavigation/css',file: 'demo.css')}" />--}%
    %{--<link rel="stylesheet" type="text/css" href="${g.resource(dir: 'js/plugins/CircularNavigation/css',file: 'component1.css')}" />--}%
    %{--<script src="${g.resource(dir: 'js/plugins/CircularNavigation/js',file: 'modernizr-2.6.2.min.js')}"></script>--}%
    <style type="text/css">
    .inicio img {
        height : 190px;
    }



    .fondo{
        width: 100%;
        height: 381px;
        background-image: url("${g.resource(dir: 'images',file: 'fondo2.jpg')}");
        background-position: -180px -120px ;
        background-repeat: no-repeat;
        position: relative;
        margin-bottom: 0px;
        margin-top: 0px;
    }
    .overlay{
        width: 100%;
        height: 381px;
        background: rgba(0,0,0,0.15);
        position: absolute;
        left: 0px;
        top: 0px;
        z-index: 1;
        margin: 0px;
    }
    .barra{
        width: 100%;
        margin-top: 0px;
        height: 140px;
        /*background: #82A22F;*/
        margin-bottom: 0px;
        background: #006EB7;

    }
    .modulo{
        position: absolute;
        border-radius: 50%;
        height: 120px;
        width: 120px;
        /*background: #006EB7;*/
        background: #243038;
        /*background: #de0b00;*/
        text-align: center;

        line-height: 120px;

        /*color: #fff;*/
        font-size: 60px;
        z-index: 2;
    }

    .titulo{
        background: transparent;
        color: #ffffff;
        height: 40px;
        line-height: 40px;
        width: 120px;
        position: absolute;
        text-align: center;
        font-weight: bold;
        text-decoration: none;

    }
    .titulo:hover{
        text-decoration: none;
        color: #ffffff;
    }
    .texto-modulo{
        color: #ffffff;
    }
    .menu-link{
        color: #fff;
    }
    .menu-link:hover{
        color: #FEDF39;
    }

    </style>
    <link href="${g.resource(dir: 'css/custom/', file: 'dashboard.css')}" rel="stylesheet" type="text/css">
</head>
<body>



</body>
</html>