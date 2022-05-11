<%--
  Created by IntelliJ IDEA.
  User: jeffg
  Date: 11/5/2022
  Time: 07:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    if(request.getParameter("LogOut")!=null){
        request.getSession().invalidate();
        response.sendRedirect("index.jsp");
    }   else{
        response.sendRedirect("usuarios/dashboard.jsp");
    }
%>
