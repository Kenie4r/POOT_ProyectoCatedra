<%@ page import="model.*" %>
<%@ page import="views.CreateMenu" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.POO_ProyectoCatedra.SessionController" %><%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 31/3/2022
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    SessionController.isSessionStarted(request,response);
%>
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
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<%= CreateMenu.Menu(6,Integer.parseInt(request.getSession().getAttribute("rol").toString())) %>

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
                    <label for="txtNombres">Nombres</label>
                    <input type="text" name="txtNames" id="txtNombres" value="<%=user.getNombres()%>" disabled>
                </div>
                <div class="input">
                    <label for="txtApellidos">Apellidos</label>
                    <input type="text" name="txtApellidos" id="txtApellidos" value="<%=user.getApellidos()%>" disabled>
                </div>
                <div class="input">
                    <label for="txtUser">Nombre de usuario</label>
                    <input type="text" name="txtUser" id="txtUser" value="<%=user.getUser()%>" disabled>
                </div>
                <div class="selects">
                    <div class="input">
                        <label for="txtDepartamento">Departamento</label>
                        <select name="slcDepartamento" id="dep" class="select" disabled>
                            <%
                                out.println("<option value='"+dept.getId()+"'>"+dept.getTitulo() + "</option>");
                                ArrayList<DepartamentoData> depts = depDB.getDepartmentsExceptID(dept.getId());
                                for (DepartamentoData e:
                                        depts) {
                                    out.println("<option value='"+e.getId()+"'>"+e.getTitulo()+"</option>");
                                }

                            %>
                        </select>
                        <input type="text" name="" id="txtDepartamento" value="<%=dept.getTitulo()%>" disabled>

                    </div>
                    <div class="input">
                        <label for="txtRol">Rol asignado</label>
                        <select name="slcRol" id="rol" class="select" disabled>
                            <%
                                out.println("<option value='"+rol.getId()+"'>"+rol.getTitulo() + "</option>");
                                ArrayList<RolData> roles = rolDB.getRolsExectpID(rol.getId());
                                for (RolData roldata:
                                        roles) {
                                    out.println("<option value='"+roldata.getId()+"'>"+roldata.getTitulo()+"</option>");
                                }

                            %>
                        </select>
                        <input type="text" name="" id="txtRol" value="<%=rol.getTitulo()%>" disabled>
                    </div>


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
