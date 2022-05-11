<%@ page import="views.CreateMenu" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="model.UserData" %>
<jsp:useBean id="registro" scope="request" class="model.RegistroBitacoraBean"></jsp:useBean>
<%@ include file="../libs/cabeceraJSP.jsp"%>
<%
    int idBitacora = Integer.parseInt(request.getParameter("idBitacora")); //Id de la bitacora
    registro.setIdBitacora( idBitacora ); //Asignar bitacora
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession sesiondatos = request.getSession();
    int idrol = 0;

    UserData datos = new UserData();

    if(sesiondatos.getAttribute("usuario") == null){
        response.sendRedirect("../index.jsp");
    }else{
        datos = ((UserData) sesiondatos.getAttribute("usuario"));
        idrol = datos.getIdRol();
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nueva bitácora</title>
    <link rel="stylesheet" href="../styles/icomoon/style.css">
    <link rel="stylesheet" href="../styles/bitacora.css">
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
    <link href="../styles/register.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body class="div-2">
<%= CreateMenu.Menu(4,idrol) %>
    <form method="post" role="form" name="frmNewRegistro" action="saveRegistro.jsp" class="contenedor-section">
        <article class="contenedor-header">
            <div class="contenedor-titulo">
                <h1 class="titulo">Bitácora N°<%= idBitacora %>: Nuevo registro de desarrollo</h1>
            </div>
            <div class="contenedor-btn">
                <button type="submit" name="operacion" value="crear" class="btn-2"><span class="icon-save"></span> Guardar</button>
                <a href="bitacora.jsp?idBitacora=<%= idBitacora %>" class="btn-2"><span class="icon-x"></span> Cancelar</a>
            </div>
        </article>
        <div class="contenedor-input">
            <div>
                <label class="label">Título</label>
            </div>
            <input type="text" name="titulo" maxlength="30" class='text-inp' autofocus required>
        </div>
        <div class="contenedor-input">
            <div>
                <label class="label">Porcentaje de avance</label>
            </div>
            <input type="number" name="porcentaje" class='text-inp' min="0" max="<%= registro.getMaxPorcentaje() %>" step="0.01" required>
        </div>
        <div class="contenedor-input">
            <div>
                <label class="label">Descripción</label>
            </div>
            <textarea name="descripcion" rows="10" class='text-inp' required></textarea>
        </div>
        <div>
            <input type="hidden" name="idBitacora" value="<%= idBitacora %>">
        </div>
    </form>
</body>
</html>
