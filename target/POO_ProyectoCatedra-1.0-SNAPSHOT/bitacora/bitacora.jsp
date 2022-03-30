<%--
  Created by IntelliJ IDEA.
  User: Lourdes
  Date: 3/30/2022
  Time: 5:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int idBitacora = Integer.parseInt(request.getParameter("idBitacora"));
%>
<html>
<head>
    <title>Bitácora</title>
</head>
<body>
    <%= idBitacora %>
</body>
</html>
