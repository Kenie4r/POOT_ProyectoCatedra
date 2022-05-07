<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BitacoraController" %>
<%@ page import="views.CreateMenu" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bitacora" scope="request" class="model.BitacoraBean"></jsp:useBean>
<%@ include file="../libs/cabeceraJSP.jsp"%>
<%
    //VARIABLES GLOBALES -----------------------------------------------------------------
    String operacion = request.getParameter("operacion");

    //VARIABLES LOCALES ------------------------------------------------------------------
    String titulo = "Nueva bitácora";
    String opcionCaso = "<option value=''>Selecciona un caso</option>";
    String opcionProgramador = "<option value=''>Selecciona un programador</option>";
    if( operacion.equals("modificar") ){
        int idBitacora = Integer.parseInt( request.getParameter("idBitacora") );
        bitacora.llenarBitacora( idBitacora );
        bitacora.llenarCaso();
        bitacora.llenarProgramador();
        titulo = "Bitácora N°" + idBitacora + ": Modificar";
        opcionCaso = "<option value='" + bitacora.getIdCaso() + "'>" + bitacora.getDescripcionCaso() + "</option>";
        opcionProgramador = "<option value='" + bitacora.getIdProgramador() + "'>" + bitacora.getNombreProgramador() + "</option>";
    }

    BitacoraController bitacoraController = new BitacoraController();
    ArrayList<ArrayList<String>> casos = bitacoraController.getCasos();
    ArrayList<ArrayList<String>> programadores = bitacoraController.getProgramadores();
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
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body class="div-2">
<%= CreateMenu.Menu(4,Integer.parseInt(request.getSession().getAttribute("rol").toString())) %>
<form action="saveBitacora.jsp" method="post" name="frmBitacora" class="contenedor-section body-div">
    <article class="contenedor-header">
        <div class="contenedor-titulo">
            <h1 class="titulo"><%= titulo %></h1>
        </div>
        <div class="contenedor-btn">
            <button type="submit" name="operacion" value="<%= operacion %>" class="btn-2"><span class="icon-save"></span> Guardar</button>
            <a href="index.jsp" class="btn-2"><span class="icon-x"></span> Cancelar</a>
        </div>
    </article>
        <div class="contenedor-input">
            <div>
                <label>Programador</label>
            </div>
            <!--<input type="text" name="titulo" maxlength="30" autofocus required>-->
            <select name="idProgramador" required>
                <%= opcionProgramador %>
                <%
                    for (ArrayList<String> fila:programadores){
                        if( Integer.parseInt(fila.get(0)) != bitacora.getIdProgramador() || operacion.equals("nueva") ){
                %>
                <option value="<%= fila.get(0) %>"><%= fila.get(1) %></option>
                <%
                        }
                    }
                %>
            </select>
        </div>
        <div class="contenedor-input">
            <div>
                <label>Caso</label>
            </div>
            <!--<input type="number" name="porcentaje" min="0" max="100" step="0.01" required>-->
            <select name="idCaso" required>
                <%= opcionCaso %>
                <%
                    for (ArrayList<String> fila:casos){
                        if( Integer.parseInt(fila.get(0)) != bitacora.getIdCaso()  ){
                %>
                <option value="<%= fila.get(0) %>"><%= fila.get(1) %></option>
                <%
                        }
                    }
                %>
            </select>
        </div>
    <%
        if(operacion.equals("modificar")){
    %>
    <input type="hidden" name="id" value="<%= bitacora.getId() %>">
    <%
        }
    %>
</form>
</body>
</html>
