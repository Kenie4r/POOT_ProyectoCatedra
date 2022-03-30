



<%@ page import="model.BitacoraController" %>
<%@ page import="model.Bitacora" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bitacoraController" scope="session" class="model.BitacoraController"></jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int idProgramador = 1;
    String nameProgramador = bitacoraController.getProgramadorByBitacora(idProgramador);
    ArrayList<Bitacora> bitacoras = new ArrayList<Bitacora>();
    bitacoras = bitacoraController.getBitacoraByProgramador(idProgramador);
%>
<html>
<head>
    <title>Bitácoras</title>
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
                <% for (Bitacora bitacoraFila: bitacoras ) {%>
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
