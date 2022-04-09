<%@ page import="model.UsersController" %>
<%@ page import="model.UserData" %>
<%@ page session="true" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 8/4/2022
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    UsersController userDBHandler = new UsersController();
    UserData validar = new UserData();
    HttpSession sesion = request.getSession();

    if(request.getParameter("btn_form")!=null) {
        String nombre = request.getParameter("username");
        String contrasena = request.getParameter("pass");
        validar = userDBHandler.getUserByUser(nombre, contrasena);

        if (validar.getUser() != null && validar.getIdRol() != 0) {
            sesion.setAttribute("usuario", validar.getUser());
            sesion.setAttribute("rol", validar.getIdRol());
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("Login.jsp");
        }
    }

%>

