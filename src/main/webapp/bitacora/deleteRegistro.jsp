<%@ page import="views.CreateMenu" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="registro" scope="request" class="model.RegistroBitacoraBean">
    <jsp:setProperty name="registro" property="id"></jsp:setProperty>
</jsp:useBean>
<%@ include file="../libs/cabeceraJSP.jsp"%>
<%
    int idBitacora = Integer.parseInt( request.getParameter("idBitacora") ); //Id bitacora
    Boolean estadoRegistro = false; //Estado del registro
    Boolean estadoProgreso = false; //Estado del progreso de la bitacora
    String operacion = request.getParameter("operacion"); //Operacion a hacer
    registro.llenar();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro guardado</title>
    <link rel="stylesheet" href="../styles/icomoon/style.css">
    <link rel="stylesheet" href="../styles/bitacora.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<%= CreateMenu.Menu(4,Integer.parseInt(request.getSession().getAttribute("rol").toString())) %>
<section>
    <article>
        <h1>Eliminar Registro</h1>
    </article>
    <%
        estadoRegistro = registro.delete(); //Eliminamos el registro
        if(estadoRegistro){ //Verificamos que se elimino
    %>
    <div>
        <h4 class="title-success"><span class="icon-thumbs-up"></span> Registro eliminado correctamente.</h4>
    </div>
    <%
        estadoProgreso = registro.updateProgresoBitacora(operacion); //Actualizamos el progreso
        if(estadoProgreso){ //Verificamos si se actualizo
    %>
    <div>
        <h4 class="title-success"><span class="icon-thumbs-up"></span> Progreso de la bitácora actualizado.</h4>
    </div>
    <%
    }else{ //No se actualizo el progreso
    %>
    <div>
        <h4 class="title-unsuccess"><span class="icon-x-octagon"></span> ERROR: El progreso de la bitácora no se actualizó.</h4>
    </div>
    <%
        }
    }else{ //No se creo el registro
    %>
    <div>
        <h4 class="title-unsuccess"><span class="icon-x-octagon"></span> ERROR: El registro no se pudo eliminar.</h4>
    </div>
    <%
        }
    %>
    <div class="contenedor-table">
        <table>
            <thead>
            <tr>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Porcentaje de avance</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><jsp:getProperty name="registro" property="titulo"/></td>
                <td><jsp:getProperty name="registro" property="descripcion"/></td>
                <td><jsp:getProperty name="registro" property="porcentaje"/></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="contenedor-center">
        <a href="bitacora.jsp?idBitacora=<%= idBitacora %>" class="btn btn-azul"><span class="icon-arrow-left"></span> Regresar</a>
    </div>
</section>
<div>
</div>
</body>
</html>