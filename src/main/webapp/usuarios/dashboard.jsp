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
    <meta charset="utf-8">
    <meta lang="es">
    <title>Dashboard</title>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="../styles/dashboard.css">
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
                <input type="hidden" value="<%=user.getIdUser()%>" id="user">
            </div>

        </div>
        <div class="moreInfo">
            <div class="grid-4">
                <div class="herramientas">
                    <h2 class="her">Herramientas</h2>
                    <div class=" options">
                        <div class="option">
                            <a href="#" id="pass_ch">
                                <span class="icon-settings"> </span>
                                <h3>
                                    Cambiar clave
                                </h3>
                            </a>

                        </div>
                        <div class="option">
                            <a href="/ServletLoginController">
                                <span class="icon-log-out"> </span>
                                <h3>
                                    Cerrar session
                                </h3>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="menu-dash">
                    <h2 class="her">Menu de opciones</h2>
                    <!--HACER OPCIONES DE L MENU-->
                    <div class="options-m">
                        <%
                            if(request.getSession().getAttribute("rol")!=null){
                                String menu = CreateMenu.Menudash(Integer.parseInt(request.getSession().getAttribute("rol").toString()));
                                out.println(menu);
                            }
                        %>
                    </div>
            </div>
    </div>
</div>
        <script src="../js/ch_pass.js"></script>
</body>
</html>
