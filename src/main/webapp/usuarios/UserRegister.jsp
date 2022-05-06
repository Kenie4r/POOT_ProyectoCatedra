<%@ page import="java.util.ArrayList" %>
<%@ page import="views.CreateMenu" %>
<%@ page import="model.*" %>
<%@ page session="true" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.example.POO_ProyectoCatedra.SessionController" %>
<%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 30/3/2022
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
/*
    HttpSession sesion = request.getSession();

    if(!(sesion.getAttribute("usuario") != null && sesion.getAttribute("rol") != null && sesion.getAttribute("rol").toString().equals("6") )){
        response.sendRedirect("dashboard.jsp");
    }
*/
%>
<%
    SessionController.isSessionStarted(request,response);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Usuario</title>
    <link href="../styles/register.css" type="text/css" rel="stylesheet">
    <link href="../styles/icomoon/style.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">

</head>
<body>
<%=CreateMenu.Menu(6,1)%>
<div class="div-2">
    <div class="body-margin">
        <div class="body-div">
            <form action="UserRegister.jsp" id="form-p">
                <h2>Registrar un nuevo usuario</h2>
                <div class="inputs info">
                    <div class="input-grid">
                        <div class="input">
                            <label for="txtNames" class="label">Nombres del empleado</label>
                            <input type="text" name="names" id="txtNames" class='text-inp'required>
                        </div>
                        <div class="input">
                            <label for="txtLastName" class="label">Apellidos del usuario</label>
                            <input type="text" id="txtLastName" name="lastname" class='text-inp' required>
                        </div>
                    </div>
                    <div class="input">
                        <label for="txtUsername" class="label">Nombre de Usuario</label>
                        <input type="text" name="username" id="txtUsername" class='text-inp' required>
                    </div>
                    <div class="input">
                        <label for="txtPass" class="label">Contraseña</label>
                        <input type="password" name='pass' id='txtPass' class='text-inp' required>
                    </div>
                    <div class="input">
                        <label for="txtPassc" class="label">Confirmación de contraseña <span class="icon-alert-triangle" id="conf"></span></label>
                        <input type="password" name="passc" id="txtPassc" class='text-inp' required>
                    </div>
                    <div class="selects">
                        <div class="input-2">
                            <label for="slDepartamento" class="label">Departamento</label>
                            <div class="select">
                                <select name="dept" id="slDepartamento" required>
                                    <option value="">Seleccionar un departamento</option>
                                    <%
                                        DeptController dbDep = new DeptController();
                                        ArrayList<DepartamentoData> depts = dbDep.getAllDepts();
                                        for (DepartamentoData e: depts) {
                                            out.println("<option value='"+e.getId()+"'>"+e.getTitulo()+"</option>");
                                        }

                                    %>
                                </select>
                            </div>

                        </div>
                        <div class="input-2">
                            <label for="slRed" class="label">Rol</label>
                            <div class="select">
                                <select name="rol" id="slRed" required>
                                    <option value="">Seleccione un Rol</option>
                                    <%
                                        RolController rolesDB = new RolController();
                                        ArrayList<RolData> roles = rolesDB.getAllRols();
                                        for (RolData rol: roles) {
                                            out.println("<option value='"+rol.getId()+"'>"+rol.getTitulo()+"</option>");
                                        }

                                    %>
                                </select>
                            </div>

                        </div>
                    </div>
                    <%
                        if(request.getParameter("btn_registrar")!=null) {
                            UserData user = new UserData(request.getParameter("names"), request.getParameter("lastname"), request.getParameter("pass"),
                                    request.getParameter("username"), Integer.parseInt(request.getParameter("dept")), Integer.parseInt(request.getParameter("rol")));
                            UsersController dbHandler = new UsersController();

                            if(user.getUser() != null && user.getIdRol() != 0){
                                dbHandler.NewUser(user);
                                response.sendRedirect("dashboard.jsp");
                            } else {
                                out.print("<p>El usuario no pudo registrarse</p>");
                            }
                        }

                    %>

                    <div class="input-3"><input type="submit" name="btn_registrar" value="Guardar usuario" id="btn-form"></div>
                </div>
            </form>

        </div>


    </div>

</div>
<script src="../js/register.js"></script>

</body>
</html>
