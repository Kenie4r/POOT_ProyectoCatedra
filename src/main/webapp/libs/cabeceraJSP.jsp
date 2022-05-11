<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.UserData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    HttpSession sesiondatos = request.getSession();

    UserData datos = new UserData();

    HttpSession sesion = request.getSession();
    if(sesion.getAttribute("usuario") == null){
%>
<c:redirect url="../index.jsp">
</c:redirect>
<%
    }
    datos = ((UserData) sesiondatos.getAttribute("usuario"));

    int rol = datos.getIdRol();
    int idUsuario = datos.getIdUser();
%>