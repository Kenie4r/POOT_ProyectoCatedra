<%@ page import="java.util.ArrayList" %>
<%@ page import="model.CasoBean" %>
<%@ page import="views.CreateMenu" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.UserData" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="casoController" scope="request" class="model.CasoController"></jsp:useBean>

<%
    HttpSession sesion = request.getSession();

    UserData datos = new UserData();

    if(sesion.getAttribute("usuario") == null){
        response.sendRedirect("../index.jsp");
    }else{
        datos = ((UserData) sesion.getAttribute("usuario"));
    }

    //VARIABLES GLOBALES -----------------------------------------------------------------
    ArrayList<CasoBean> casos = casoController.getCasos();
%>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Casos</title>
    <link rel="stylesheet" href="../styles/icomoon/style.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<%= CreateMenu.Menu(3, datos.getIdRol()) %>
<div class="div-2">
    <div class="body-margin">
        <div class="tables">
            <h2>Casos existentes</h2>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Descripcion</th>
                    <th>Estado</th>
                    <th>Jefe de desarrollo</th>
                    <th>Fecha de inicio</th>
                    <th>Fecha limite</th>
                    <th>Id Solicitud</th>
                    <th>Fecha de producción</th>
                    <%
                        if(datos.getIdRol() == 11){
                    %>
                    <th>Opciones</th>
                    <%
                        }
                    %>
                </tr>
                </thead>
                <tbody>
                <%
                    for (CasoBean fila:casos) {
                %>
                <tr>
                    <td><%= fila.getId() %></td>
                    <td><%= fila.getDescripcion() %></td>
                    <td><%= fila.getEstado() %></td>
                    <td><%= fila.getNombreJefeDesarrollo() %></td>
                    <td><%= fila.getFechaInicio() %></td>
                    <td><%= fila.getFechaFinalizacion() %></td>
                    <td><%= fila.getIdSolicitud() %></td>
                    <td><%= fila.getFechaProduccion() == null||fila.getFechaProduccion().equals("null")?"No asignado":fila.getFechaProduccion() %></td>
                    <%
                        if(datos.getIdRol() == 11){
                    %>
                    <th><a href="#">Ver</a></th>
                    <%
                        }
                    %>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
