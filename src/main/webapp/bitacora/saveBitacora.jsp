<%@ page import="views.CreateMenu" %>
<%@ page import="com.example.POO_ProyectoCatedra.SessionController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bitacora" scope="request" class="model.BitacoraBean">
    <jsp:setProperty name="bitacora" property="*"></jsp:setProperty>
</jsp:useBean>
<%
    SessionController.isSessionStarted(request,response);//controlador de session
 //   int rol = Integer.parseInt(request.getSession().getAttribute("rol").toString());
   // int idProgramador = Integer.parseInt(request.getSession().getAttribute("id").toString());

    //VARIABLES GLOBALES -----------------------------------------------------------------
    int idProgramador = 1; //Id programador
    String rol = "Jefe de desarrollo"; //Rol
    //String rol = "Programador"; //Rol
    String operacion = request.getParameter("operacion");

    //VARIABLES LOCALES ------------------------------------------------------------------
    String titulo = "";
    Boolean estadoBitacora = false;
    if( operacion.equals("nueva") ){
        titulo = "Nueva bitácora";
    }else if( operacion.equals("modificar") ){
        titulo = "Bitácora N°" + bitacora.getId() + ": Modificar";
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guardar bitácora</title>
    <link rel="stylesheet" href="../styles/icomoon/style.css">
    <link rel="stylesheet" href="../styles/bitacora.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<%= CreateMenu.Menu(4,Integer.parseInt(request.getSession().getAttribute("rol").toString())) %>
<section>
    <article class="contenedor-header">
        <div class="contenedor-titulo">
            <h1><%= titulo %></h1>
        </div>
    </article>
    <%
        if( operacion.equals("nueva") ){
             estadoBitacora = bitacora.save();
             if(estadoBitacora){
    %>
    <div>
        <h4 class="title-success"><span class="icon-thumbs-up"></span> Bitácora creada correctamente.</h4>
    </div>
    <%
            }else{
    %>
    <div>
        <h4 class="title-unsuccess"><span class="icon-x-octagon"></span> No se pudo crear la bitácora.</h4>
    </div>
    <%
            }
    %>
    <%
        }else if(operacion.equals("modificar")){
            estadoBitacora = bitacora.update();
            if(estadoBitacora){
    %>
    <div>
        <h4 class="title-success"><span class="icon-thumbs-up"></span> Bitácora actualizada correctamente.</h4>
    </div>
    <%
            }else{
    %>
    <div>
        <h4 class="title-unsuccess"><span class="icon-x-octagon"></span> No se pudo actualizar la bitácora.</h4>
    </div>
    <%
            }
    %>
    <%
        }
    %>
    <div class="contenedor-center">
        <a href="index.jsp" class="btn btn-azul"><span class="icon-arrow-left"></span> Regresar</a>
    </div>
</section>
</body>
</html>
