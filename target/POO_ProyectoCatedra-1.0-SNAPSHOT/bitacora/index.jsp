<%@ page import="model.BitacoraController" %>
<%@ page import="model.BitacoraBean" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bitacoraController" scope="session" class="model.BitacoraController"></jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //VARIABLES GLOBALES -----------------------------------------------------------------
    int idProgramador = 9; //Id programador
    //String rol = "Jefe de desarrollo"; //Rol
    String rol = "Programador"; //Rol

    //LISTA DE BITACORAS -----------------------------------------------------------------
    ArrayList<BitacoraBean> bitacoras = new ArrayList<BitacoraBean>();

    //VARIABLES LOCALES ------------------------------------------------------------------
    int opciones = 0;
    if( rol.equals("Jefe de desarrollo") ){
        bitacoras = bitacoraController.getBitacoras();
        opciones = 3;
    }else if( rol.equals("Programador") ){
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
</head>
<body>
    <section>
        <article class="contenedor-header">
            <div class="contenedor-titulo">
                <h1>Bitácoras</h1>
            </div>
            <% if( rol.equals("Jefe de desarrollo") ){ %>
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
                    <% if( rol.equals("Jefe de desarrollo" )){ %>
                    <td><a href="seeBitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>&operacion=ver">Ver</a></td>
                    <td><a href="formBitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>&operacion=modificar">Modificar</a></td>
                    <td><a href="seeBitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>&operacion=eliminar">Eliminar</a></td>
                    <% }else if( rol.equals("Programador") ){ %>
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
