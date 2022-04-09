<%@ page import="java.io.Writer" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page session="true" %>
<%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 8/4/2022
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Hola</title>
</head>
<body>
    <%

        HttpSession sesion = request.getSession();
        String usuario;
        String rol;

        if(sesion.getAttribute("usuario") != null && sesion.getAttribute("rol") != null){
            usuario = sesion.getAttribute("usuario").toString();
            rol = sesion.getAttribute("rol").toString();
            out.print("<a href='sesionFinish.jsp?cerrar=true'><h5>Cerrar Sesion "+usuario+"</h5></a>");
            out.print("<h1>Bienvenido@,"+sesion.getAttribute("usuario").toString()+"</h1>");
        }else{
            response.sendRedirect("Login.jsp");
        }
    %>
</body>
</html>
