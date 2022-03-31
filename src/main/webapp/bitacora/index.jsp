



<%@ page import="model.BitacoraController" %>
<%@ page import="model.BitacoraBean" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bitacoraController" scope="session" class="model.BitacoraController"></jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int idProgramador = 1;
    String nameProgramador = bitacoraController.getProgramadorByBitacora(idProgramador);
    ArrayList<BitacoraBean> bitacoras = new ArrayList<BitacoraBean>();
    bitacoras = bitacoraController.getBitacoraByProgramador(idProgramador);
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bitácoras</title>
    <link rel="stylesheet" href="../css/icomoon/style.css">
    <link rel="stylesheet" href="../css/bitacora.css">
</head>
<body>
    <section>
        <div>
            <h1>Bitácoras</h1>
        </div>
        <div>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Caso</th>
                    <th>Programador</th>
                    <th>Progreso</th>
                    <th colspan="3">Opciones</th>
                </tr>
                </thead>
                <tbody>
                <% for (BitacoraBean bitacoraFila: bitacoras ) {%>
                <tr>
                    <td><%= bitacoraFila.getId() %></td>
                    <td><%= bitacoraFila.getDescripcionCaso() %></td>
                    <td><%= nameProgramador %></td>
                    <td><%= bitacoraFila.getPorcentaje() %> %</td>
                    <td>Modificar</td>
                    <td><a href="bitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>">Administrar</a></td>
                    <td>Eliminar</td>
                </tr>
                <%}%>

                </tbody>
            </table>
        </div>
    </section>
</body>
</html>
