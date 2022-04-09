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
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
    <link rel="stylesheet"href="../styles/icomoon/style.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<%=CreateMenu.Menu(2,1)
%>
<div class="div-2">
    <div class="body-margin">

        <div class="btns">
            <a class="btn-new" href="UserRegister.jsp"><span class="icon-plus"></span> Crear un nuevo usuario</a>
        </div>
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
    </div>
</div>
<form action="/AprobarCaso" id="form-p">
    <div class="inputs info">
        <div class="input-grid">
            <div class="input">
                <label for="fecha" class="label">Seleccione una fecha de puesta en producción</label>
                <input type="date" class="form-control" id="fecha" name="fecha" placeholder="Ingresa la fecha" required>
            </div>
        <div class="input-3"><input type="submit" value="Guardar usuario" id="btn-form"></div>
</form>
<div id="nots">

</div>
<script src="../js/editUser.js"></script>
</body>
</html>
