<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    HttpSession sesion = request.getSession();
    if(sesion.getAttribute("id") == null || sesion.getAttribute("rol") == null){
%>
<c:redirect url="../index.jsp">
</c:redirect>
<%
    }
    int rol = Integer.parseInt(request.getSession().getAttribute("rol").toString());
    int idUsuario = Integer.parseInt(request.getSession().getAttribute("id").toString());
%>