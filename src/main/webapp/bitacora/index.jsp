<%@ page import="model.BitacoraController" %>
<%@ page import="model.BitacoraBean" %>
<%@ page import="java.util.*" %>
<%@ page import="views.CreateMenu" %>
<jsp:useBean id="bitacoraController" scope="session" class="model.BitacoraController"></jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //VARIABLES GLOBALES -----------------------------------------------------------------
    int idProgramador = 9; //Id programador
    int rol = 9; //Rol
    //int rol = 10; //Rol

    //LISTA DE BITACORAS -----------------------------------------------------------------
    ArrayList<BitacoraBean> bitacoras = new ArrayList<BitacoraBean>();

    //VARIABLES LOCALES ------------------------------------------------------------------
    int opciones = 0;
    if( rol == 9 ){
        bitacoras = bitacoraController.getBitacoras();
        opciones = 3;
    }else if( rol == 10 ){
        bitacoras = bitacoraController.getBitacoraByProgramador(idProgramador);
        opciones = 1;
    }

    for( BitacoraBean bitacoraFila:bitacoras ){
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
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<%= CreateMenu.Menu(4,rol) %>
    <section>
        <article class="contenedor-header">
            <div class="contenedor-titulo">
                <h1>Bitácoras</h1>
            </div>
            <% if( rol == 9 ){ %>
            <div class="contenedor-btn">
                <a href="formBitacora.jsp?operacion=nueva" class="btn btn-green"><span class="icon-plus"></span> Nueva bitácora</a>
            </div>
            <% } %>
        </article>
        <div class="contenedor-table">
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
                    <% if( rol == 9){ %>
                    <td><a href="seeBitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>&operacion=ver">Ver</a></td>
                    <td><a href="formBitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>&operacion=modificar">Modificar</a></td>
                    <td><a href="seeBitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>&operacion=eliminar">Eliminar</a></td>
                    <% }else if( rol == 10){ %>
                    <td><a href="bitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>">Ver registros</a></td>
                    <% } %>
                </tr>
                <%}%>

                </tbody>
            </table>
        </div>
    </section>
</body>
</html>
