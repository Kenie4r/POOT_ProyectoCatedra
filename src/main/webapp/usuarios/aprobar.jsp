<%@ page import="model.*" %>
<%@ page import="views.CreateMenu" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 07/04/2022
  Time: 06:30 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
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
    <link rel="stylesheet" href="/styles/seeUser.css">
    <link rel="stylesheet"href="/styles/icomoon/style.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<%=CreateMenu.Menu(6,1)
%>
<div class="div-2">
    <div class="body-margin">
        <div class="body-div">
            <div class="options" id="options">
                <div>
                    <a href="index.jsp"><span class="icon-arrow-left-circle"></span> Volver al inicio</a>
                </div>
                <ul>
                    <li class="btn-edit" id="edit"><span class="icon-edit-3"></span> Editar</li>
                    <li class="btn-del" id="delete"><span class="icon-delete"></span> Eliminar</li>
                </ul>
            </div>
            <form class="info" id="form-user" action="/UpdateUserServlet" method="post">
                <input type="hidden" id="UserID"  name="txtUserID" value="<%=id%>">
                <div class="input">
                    <label for="txtNombres">ID caso</label>
                    <input type="text" name="txtNames" id="txtNombres" value="<%=probador.getIdCaso()%>" disabled>
                </div>
                <div class="input">
                    <label for="txtApellidos">Descripcion</label>
                    <input type="text" name="txtApellidos" id="txtApellidos" value="<%=probador.getDescripcion()%>" disabled>
                </div>
                <div class="input">
                    <label for="txtUser">Estado</label>
                    <input type="text" name="txtUser" id="txtUser" value="<%=probador.getEstado()%>" disabled>
                </div>

                <input type="submit" value="Guardar" id="btn-form">
            </form>
        </div>


    </div>

</div>
<div id="nots">

</div>
<script src="../js/editUser.js"></script>
</body>
</html>
