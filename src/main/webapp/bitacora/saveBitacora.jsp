<%--
  Created by IntelliJ IDEA.
  User: Lourdes
  Date: 3/31/2022
  Time: 8:52 AM
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="registro" scope="request" class="model.RegistroBitacoraBean"></jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //Obtenemos el id del usuario (programador)
    int idProgramador = 1;
    int idBitacora = Integer.parseInt( request.getParameter("idBitacora") );
%>
<jsp:setProperty name="registro" property="titulo" param="titulo"></jsp:setProperty>
<jsp:setProperty name="registro" property="descripcion" param="descripcion"></jsp:setProperty>
<jsp:setProperty name="registro" property="porcentaje" param="porcentaje"></jsp:setProperty>
<jsp:setProperty name="registro" property="idBitacora" param="idBitacora"></jsp:setProperty>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro guardado</title>
    <link rel="stylesheet" href="../css/icomoon/style.css">
    <link rel="stylesheet" href="../styles/bitacora.css">
</head>
<body>
<jsp:getProperty name="registro" property="titulo"/>
<jsp:getProperty name="registro" property="descripcion"/>
<jsp:getProperty name="registro" property="porcentaje"/>
<jsp:getProperty name="registro" property="idBitacora"/>
<%
    registro.save();
    registro.updateProgresoBitacora("crear");
%>
<div>
    <a href="bitacora.jsp?idBitacora=<%= idBitacora %>">Regresar</a>
</div>
</body>
</html>
