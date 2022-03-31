<%@ page import="model.RegistroBitacoraBean" %><%--
  Created by IntelliJ IDEA.
  User: Lourdes
  Date: 3/30/2022
  Time: 5:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bitacora" scope="session" class="model.BitacoraBean"></jsp:useBean>
<%
    int idProgramador = 1;
    int idBitacora = Integer.parseInt(request.getParameter("idBitacora"));

    bitacora.llenarBitacora(idBitacora); //Lenamos la bitacora con los datos de la base de datos
    bitacora.llenarRegistros(); //Llenamos la bitacora con sus registros
    int count = bitacora.countRegistros();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bitácora</title>
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
                <a href="newBitacora.jsp">+ Nuevo</a>
            </div>
        </article>
        <article>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Descripción</th>
                    <th>Porcentaje</th>
                    <th>Caso</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <% if(bitacora.countRegistros() == 0){ %>
                <tr>
                    <td colspan="5">No existen registros todavía, informa acerca del avance.</td>
                </tr>
                <% }else{ %>
                    <% for(RegistroBitacoraBean registro:bitacora.getRegistros()){ %>
                <tr>
                    <td><%= registro.getId() %></td>
                    <td><%= registro.getTitulo() %></td>
                    <td><%= registro.getDescripcion() %></td>
                    <td><%= registro.getPorcentaje() %></td>
                    <td><%= registro.getId() %></td>
                    <td>Eliminar</td>
                </tr>
                    <% } %>
                <% } %>
                </tbody>
            </table>
        </article>
    </section>
</body>
</html>
