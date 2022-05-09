<%@ page import="model.BitacoraBean" %>
<%@ page import="java.util.*" %>
<%@ page import="views.CreateMenu" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../libs/cabeceraJSP.jsp"%>
<jsp:useBean id="bitacoraController" scope="request" class="model.BitacoraController"></jsp:useBean>
<%@ include file="../libs/cabeceraMensajesBitacoras.jsp" %>
<%
    //LISTA DE BITACORAS -----------------------------------------------------------------
    ArrayList<BitacoraBean> bitacoras = new ArrayList<BitacoraBean>();

    //VARIABLES LOCALES ------------------------------------------------------------------
    int opciones = 0, permisos = 1;

    switch (rol){
        case 6:
        case 7:
        case 8:
            bitacoras = bitacoraController.getBitacoras();
            opciones = 1; permisos = 1;
            break;
        case 9:
            bitacoras = bitacoraController.getBitacoras();
            opciones = 3; permisos = 3;
            break;
        case 10:
            bitacoras = bitacoraController.getBitacoraByProgramador(idUsuario);
            opciones = 1; permisos = 2;
            break;
    }

    for( BitacoraBean bitacoraFila:bitacoras ){ //Lenar los datos externos de cada bitacora
        bitacoraFila.llenarCaso();
        bitacoraFila.llenarProgramador();
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bitácoras</title>
    <link rel="stylesheet" href="../styles/icomoon/style.css">
    <link rel="stylesheet" href="../styles/bitacora.css">
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body class="div-2">
    <%= CreateMenu.Menu(4,Integer.parseInt(request.getSession().getAttribute("rol").toString())) %>
    <section class="body-margin">
        <% if( permisos == 3 ){  //Solo un usuario con permiso 3 puede crear bitacoras %>
        <article class="btns" style="display: flex; flex-direction: row; gap: 2em;">
            <a href="formBitacora.jsp?operacion=nueva" class="btn-2"><span class="icon-plus"></span> Nueva bitácora</a>
            <% if(estado > 0){ //Que sucedio con la operacion %>
            <p class="btn-2"><%= mensaje %></p>
            <% } %>
        </article>
        <% } %>
        <div class="tables">
            <h2>Bitácoras</h2>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Caso</th>
                    <th>Programador</th>
                    <th>Progreso</th>
                    <th colspan="<%= opciones %>">Opciones</th>
                </tr>
                </thead>
                <tbody>
                <% for (BitacoraBean bitacoraFila:bitacoras ) {%>
                <tr>
                    <td><%= bitacoraFila.getId() %></td>
                    <td><%= bitacoraFila.getDescripcionCaso() %></td>
                    <td><%= bitacoraFila.getNombreProgramador() %></td>
                    <td><%= bitacoraFila.getPorcentaje() %> %</td>
                    <% if( permisos == 3){ %>
                    <td class='btn'><a href="bitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>&operacion=ver"> <span class='icon-eye'></span>Ver</a></td>
                    <td class='btn'><a href="formBitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>&operacion=modificar"><span class='icon-edit'></span> Modificar</a></td>
                    <td class='btn'><a href="bitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>&operacion=eliminar"><span class='icon-trash-2'></span> Eliminar</a></td>
                    <% }else if( permisos == 2){ %>
                    <td class='btn'><a href="bitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>"><span class='icon-eye'></span> Ver registros</a></td>
                    <% }else if(permisos == 1){ %>
                    <td class='btn'><a href="bitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>&operacion=ver"> <span class='icon-eye'></span>Ver</a></td>
                    <% } %>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </section>
</body>
</html>
