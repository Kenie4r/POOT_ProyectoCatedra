<%--
  Created by IntelliJ IDEA.
  User: Lourdes
  Date: 3/30/2022
  Time: 9:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    int idProgramador = 1;
    int idBitacora = Integer.parseInt(request.getParameter("idBitacora"));
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nueva bitácora</title>
    <link rel="stylesheet" href="../css/icomoon/style.css">
    <link rel="stylesheet" href="../css/bitacora.css">
</head>
<body>
    <section>
        <article>
            <div>
                <h1>Bitacora Master</h1>
            </div>
            <div>
                <a href="bitacora.jsp?idBitacora=<%= idBitacora %>">Cancelar</a>
            </div>
        </article>
    </section>
</body>
</html>