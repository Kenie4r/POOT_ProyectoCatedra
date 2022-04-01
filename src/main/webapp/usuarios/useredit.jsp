<%@ page import="model.*" %><%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 31/3/2022
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id  = request.getParameter("id");
    UsersController Userdb = new UsersController();
    UserData user = Userdb.getUserByID(id);
    DeptController depDB = new DeptController();
    RolController rolDB = new RolController();
    DepartamentoData dept = depDB.getDepartmentbyID(user.getIdDepartamento());
    RolData rol = rolDB.getRolbyID(user.getIdRol());
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuario <%=user.getUser()%></title>
    <link rel="stylesheet" href="/styles/seeUser.css">
    <link rel="stylesheet"href="/styles/icomoon/style.css">
</head>
<body>
<div class="div-form">
    <div class="kind-form">
        <div class="options">
            <div>
                <a href="index.jsp"><span class="icon-arrow-left-circle"></span> Volver al inicio</a>
            </div>
            <ul>
                <li class="btn-edit"><span class="icon-edit-3"></span> Editar</li>
                <li class="btn-del"><span class="icon-delete"></span>Eliminar</li>
            </ul>
        </div>
        <div class="info">
            <div class="names">
                <div class="input">
                    <label>Nombres</label>
                    <p><%=user.getNombres()%></p>
                </div>
                <div class="input">
                    <label>Apellidos</label>
                    <p><%=user.getApellidos()%></p>
                </div>
            </div>
            <div class="input">
                <label>Nombre de usuario</label>
                <p><%=user.getUser()%></p>
            </div>
            <div class="input">
                <label>Departamento</label>
                <p><%=dept.getTitulo()%></p>

            </div>
            <div class="input">
                <label>Rol asignado</label>
                <p><%=rol.getTitulo()%></p>
            </div>
        </div>
    </div>

    <div class="hidden" id="delete-form">
        <form action="/DeleteUserServlet" method="post">
            <input type="hidden" value="<%=user.getIdUser()%>" name="txtUserID">
            <h2>¿Quieres eliminar el usuario <%=user.getUser()%>?</h2>
            <div class="buttons">
                <div class="btn-cancel" id="btnCancel">
                    <p>Cancelar</p>
                </div>
                <div>
                    <input type="submit" value="Eliminar" id="btnDelete" name="btnEliminar">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
