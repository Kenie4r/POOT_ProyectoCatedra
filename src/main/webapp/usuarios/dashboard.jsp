<%@ page import="java.io.Writer" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="views.CreateMenu" %>
<%@ page import="com.example.POO_ProyectoCatedra.SessionController" %>
<%@ page import="model.UserData" %>
<%@ page import="model.UsersController" %>
<%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 8/4/2022
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%
    UserData user = new UserData();
    if(SessionController.isSessionStarted(request.getSession(),response)){
        response.sendRedirect("../index.jsp");
    }else{
        //OBTENER LOS DATOS DEL USUARIO CREADO
        UsersController userDB = new UsersController();
        user = userDB.getUserByID(request.getSession().getAttribute("id").toString());

%>
<html>
<head>
    <title>Dashboard</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
    <link rel="stylesheet" type="text/css" href="../styles/icomoon/style.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
</head>
<body>
<%
        out.println( CreateMenu.Menu(0,Integer.parseInt(request.getSession().getAttribute("rol").toString())));
    }
%>
<div class="div-2">
    <div class="body-margin">
        <div class="hello">
            <div class="icon">
                <span class="icon-user"></span>
            </div>
            <div class="data user">
                <h2>BIENVENIDO/A</h2>
                <h3><%=
                user.getNombres() + " " + user.getApellidos()
                %></h3>
            </div>

        </div>
    </div>
</div>
</body>
</html>
