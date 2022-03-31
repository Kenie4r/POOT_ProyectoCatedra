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
    //Obtenemos el id del programador
    int idProgramador = 1;
    //Obtenemos el id de la bitacora
    int idBitacora = Integer.parseInt(request.getParameter("idBitacora"));

    //BITACORA
    bitacora.llenarBitacora(idBitacora); //Lenamos la bitacora con los datos de la base de datos
    bitacora.llenarRegistros(); //Llenamos la bitacora con sus registros
    bitacora.llenarCaso(); //Llenamos el caso de la bitacora
    bitacora.llenarProgramador(); //Llenamos el programador de la bitacora
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
                <h1>BITÁCORA</h1>
            </div>
            <div>
                <a href="index.jsp"><span class="icon-arrow-left"></span> Regresar</a>
            </div>
        </article>
        <!-- Bitacora -->
        <article>
            <div>
                <p>ID: <jsp:getProperty name="bitacora" property="id"/></p>
            </div>
            <div>
                <p>Número de caso: <jsp:getProperty name="bitacora" property="idCaso"/></p>
            </div>
            <div>
                <p>Descripción del caso: <jsp:getProperty name="bitacora" property="descripcionCaso"/></p>
            </div>
            <div>
                <p>Programador encargado: <jsp:getProperty name="bitacora" property="nombreProgramador"/></p>
            </div>
            <div>
                <p>Progreso del proyecto: <jsp:getProperty name="bitacora" property="porcentaje"/></p>
            </div>
        </article>
        <!-- Registros -->
        <article>
            <div>
                <div>
                    <h2>Registros</h2>
                </div>
                <div>
                    <a href="newRegistro.jsp?idBitacora=<%= idBitacora %>"><span class="icon-plus"></span> Nuevo</a>
                </div>
            </div>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Porcentaje de avance</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <% if(bitacora.countRegistros() == 0){ %>
                <tr>
                    <td colspan="6">No existen registros todavía, informa acerca del avance.</td>
                </tr>
                <% }else{ %>
                    <% for(RegistroBitacoraBean registro:bitacora.getRegistros()){ %>
                <tr>
                    <td><%= registro.getId() %></td>
                    <td><%= registro.getTitulo() %></td>
                    <td><%= registro.getDescripcion() %></td>
                    <td><%= registro.getPorcentaje() %></td>
                    <td><a href="#">Eliminar</a></td>
                </tr>
                    <% } %>
                <% } %>
                </tbody>
            </table>
        </article>
    </section>
</body>
</html>
