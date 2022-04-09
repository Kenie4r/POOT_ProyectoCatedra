<%@ page import="views.CreateMenu" %>
<%@ page import="model.UsersController" %>
<%@ page import="model.UserData" %>
<%@ page session="true" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 8/4/2022
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    HttpSession sesion = request.getSession();

    UsersController userDBHandler = new UsersController();
    UserData validar = new UserData();

    if(sesion.getAttribute("usuario") != null && sesion.getAttribute("rol") != null){
        response.sendRedirect("dashboard.jsp");
    }

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar Sesión</title>
        <link href="../styles/icomoon/style.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
        <link rel="stylesheet" type="text/css" href="../styles/register.css">

    </head>
    <body>
        <%= CreateMenu.Menu(6,1) %>
        <div class="div-2">
            <div class="body-margin">
                <div class="body-div">
                    <form action="Login.jsp" id="form-p">
                        <h2>Iniciar sesión</h2>
                        <div class="inputs info">
                            <div class="input-grid">
                                <div class="input">
                                    <label for="txtUsername" class="label">Nombre de Usuario</label>
                                    <input type="text" name="username" id="txtUsername" class='text-inp'required>
                                </div>
                                <div class="input">
                                    <label for="txtPass" class="label">Contraseña</label>
                                    <input type="password" name='pass' id='txtPass' class='text-inp' required>
                                </div>
                            </div>
                            <%

                                if(request.getParameter("btn_form")!=null) {
                                    String nombre = request.getParameter("username");
                                    String contrasena = request.getParameter("pass");
                                    validar = userDBHandler.getUserByUser(nombre, contrasena);

                                    if (validar.getUser() != null && validar.getIdRol() != 0) {
                                        sesion.setAttribute("usuario", validar.getUser());
                                        sesion.setAttribute("rol", validar.getIdRol());
                                        response.sendRedirect("dashboard.jsp");
                                    } else {
                                        out.print("<p>Verifique sus credenciales</p>");
                                    }
                                }

                            %>

                            <div class="input-3"><input type="submit" name="btn_form" value="Iniciar Sesión" id="btn-form"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
