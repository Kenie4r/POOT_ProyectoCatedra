<%@ page session="true" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 9/4/2022
  Time: 02:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    HttpSession sesion = request.getSession();

    if(request.getParameter("cerrar")!=null){
        sesion.invalidate();
        response.sendRedirect("Login.jsp");
    }else{
        response.sendRedirect("dashboard.jsp");
    }

%>
