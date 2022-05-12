<%@ page import="model.UsersController" %>
<%@ page import="model.UserData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    int idUsuario = Integer.parseInt(request.getParameter("idUser"));
    int estado = Integer.parseInt(request.getParameter("estado"));
    UsersController controlador = new UsersController();
    UserData usuario = new UserData();
    usuario.setIdUser(idUsuario);
    if(estado == 0){ //De alta
        usuario.setEstadoBaja(Byte.parseByte( "1" ));
        controlador.updateEstadoBaja(usuario);
    }else if(estado == 1){ //De baja
        usuario.setEstadoBaja(Byte.parseByte( "0" ));
    }
%>
<c:redirect url="index.jsp">
</c:redirect>