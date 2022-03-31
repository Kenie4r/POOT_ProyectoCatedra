<%--
  Created by IntelliJ IDEA.
  User: Lourdes
  Date: 3/30/2022
  Time: 9:34 PM
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="bitacora" scope="session" class="model.BitacoraBean"></jsp:useBean>
<jsp:useBean id="registro" scope="request" class="model.RegistroBitacoraBean"></jsp:useBean>
<%
    //Obtenemos el id del usuario (programador)
    int idProgramador = 1;
    //Obtenemos el id de la bitacora actual
    int idBitacora = Integer.parseInt(request.getParameter("idBitacora"));
    //BITACORA
    bitacora.llenarBitacora(idBitacora);
    bitacora.llenarCaso();
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
    <form method="post" role="form" name="frmNewRegistro" action="saveBitacora.jsp">
        <article>
            <div>
                <h1>Nuevo registro de desarrollo</h1>
                <h2>Caso N°: <%= bitacora.getIdCaso() %></h2>
                <p><span>Descripción: </span><%= bitacora.getDescripcionCaso() %></p>
            </div>
            <div>
                <button type="submit" name="btnSubmit">Guardar</button>
                <a href="bitacora.jsp?idBitacora=<%= idBitacora %>">Cancelar</a>
            </div>
        </article>
        <article>
            <div>
                <div>
                    <label>Título</label>
                </div>
                <input type="text" name="titulo">
            </div>
            <div>
                <div>
                    <label>Descripción</label>
                </div>
                <textarea name="descripcion"></textarea>
            </div>
            <div>
                <div>
                    <label>Porcentaje de avance</label>
                </div>
                <input type="number" name="porcentaje">
            </div>
            <div>
                <input type="hidden" name="idBitacora" value="<%= bitacora.getId() %>">
            </div>
        </article>
    </form>
</body>
</html>
