<%--
  Created by IntelliJ IDEA.
  User: Lourdes
  Date: 3/30/2022
  Time: 9:34 PM
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="registro" scope="request" class="model.RegistroBitacoraBean"></jsp:useBean>
<%
    //Obtenemos el id del usuario (programador)
    int idProgramador = 1;
    //Obtenemos el id de la bitacora actual
    int idBitacora = Integer.parseInt(request.getParameter("idBitacora"));
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nueva bitácora</title>
    <link rel="stylesheet" href="../styles/icomoon/style.css">
    <link rel="stylesheet" href="../styles/bitacora.css">
</head>
<body>
    <form method="post" role="form" name="frmNewRegistro" action="saveBitacora.jsp" class="contenedor-abuelo">
        <article class="contenedor-header">
            <div class="contenedor-titulo">
                <h1>Bitácora N°<%= idBitacora %>: Nuevo registro de desarrollo</h1>
            </div>
            <div class="contenedor-btn">
                <button type="submit" name="btnSubmit" value="crear" class="btn btn-green"><span class="icon-save"></span> Guardar</button>
                <a href="bitacora.jsp?idBitacora=<%= idBitacora %>" class="btn btn-red"><span class="icon-x"></span> Cancelar</a>
            </div>
        </article>
        <article class="row-2">
            <div class="contenedor-input">
                <div>
                    <label>Título</label>
                </div>
                <input type="text" name="titulo" autofocus required>
            </div>
            <div class="contenedor-input">
                <div>
                    <label>Porcentaje de avance</label>
                </div>
                <input type="number" name="porcentaje" min="0" max="100" step="0.01" required>
            </div>
        </article>
        <article class="full-row">
            <div class="contenedor-input">
                <div>
                    <label>Descripción</label>
                </div>
                <textarea name="descripcion" rows="10" required></textarea>
            </div>
            <div>
                <input type="hidden" name="idBitacora" value="<%= idBitacora %>">
            </div>
        </article>
    </form>
</body>
</html>
