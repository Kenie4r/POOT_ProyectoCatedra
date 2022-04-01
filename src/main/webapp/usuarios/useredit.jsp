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
    <title>Usuario <%=user.getUser()%></title>
</head>
<body>
    <div>
        <div class="options">
            <div>
                <a href="index.jsp">Volver al inicio</a>
            </div>
            <ul>
                <li>Editar</li>
                <li>ELiminar</li>
            </ul>
        </div>
        <div class="info">
            <div>
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
            <div>
                <label>Departamento</label>
                <p><%=dept.getTitulo()%></p>

            </div>
            <div>
                <label>Rol asignado</label>
                <p><%=rol.getTitulo()%></p>
            </div>
        </div>
    </div>
</body>
</html>
