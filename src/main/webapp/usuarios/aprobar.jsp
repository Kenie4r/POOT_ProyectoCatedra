<%@ page import="model.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.UserData" %>
<%@ page import="views.CreateMenu" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.POO_ProyectoCatedra.SessionController" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 07/04/2022
  Time: 06:30 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    HttpSession sesion = request.getSession();

    UserData datos = new UserData();

    if(sesion.getAttribute("usuario") == null){
        response.sendRedirect("../index.jsp");
    }else{
        datos = ((UserData) sesion.getAttribute("usuario"));
    }

    String id  = request.getParameter("id");
    ProbadorController probadorDB = new ProbadorController();
    ProbadorData probador = probadorDB.getCasoByID(id);
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Caso <%=probador.getIdCaso()%></title>
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
    <link href="../styles/register.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet"href="../styles/icomoon/style.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<%
    out.println( CreateMenu.Menu(0,datos.getIdRol()));
%>

<div class="div-2">
    <div class="body-margin">
        <div class="tables">
            <h2>¿Desea aprobar el siguiente caso?</h2>
            <table>
                <thead>
                <tr>
                    <th scope="col">ID caso</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Estado</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><%=probador.getIdCaso()%></td>
                    <td><%=probador.getDescripcion()%></td>
                    <td><%=probador.getEstado()%></td>
                </tr>
                </tbody>
            </table>
        </div>
        <form  class="nots" action="/AprobarCaso" id="form-p">
            <div class="inputs info">
                <div class="input-grid">
                    <div class="input">
                        <label for="fecha" class="label">Seleccione una fecha de puesta en producción</label>
                        <input type="date" class='text-inp' id="fecha" name="fecha" placeholder="Ingresa la fecha" required>
                        <input type="hidden" name="idCaso" id="txtID" value="<%=id%>">
                    </div>
                </div>
                <div class="input-3"><input type="submit" value="Aprobar" id="btn-form"></div>
            </div>
        </form>
    </div>
    </div>
<div id="nots">

</div>
<script src="../js/aprobar.js"></script>
</body>
</html>