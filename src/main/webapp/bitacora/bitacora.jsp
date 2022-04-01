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

    //COMENTARIOS
    //ACTUALIZAR ESTADO BITACORA - ESTADO
    //COMPROBAR MAXIMO DE PORCENTAJE
    //VER SI SE PUEDEN AGREGAR REGISTROS
    //ELIMINAR REGISTROS
    //FECHA REGISTROS
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bitácora</title>
    <link rel="stylesheet" href="../styles/icomoon/style.css">
    <link rel="stylesheet" href="../styles/bitacora.css">
</head>
<body>
    <section>
        <article class="contenedor-header">
            <div class="contenedor-titulo">
                <h1>BITÁCORA N°<jsp:getProperty name="bitacora" property="id"/></h1>
            </div>
            <div class="contenedor-btn">
                <a href="index.jsp" class="btn btn-red"><span class="icon-arrow-left"></span> Regresar</a>
            </div>
        </article>
        <!-- Bitacora -->
        <article style="display: flex; justify-content: center;">
            <table>
                <tr>
                    <th>Número de caso:</th>
                    <th>Programador encargado:</th>
                    <th>Progreso del proyecto:</th>
                </tr>
                <tr>
                    <td><jsp:getProperty name="bitacora" property="idCaso"/></td>
                    <td><jsp:getProperty name="bitacora" property="nombreProgramador"/></td>
                    <td>
                        <div class="barra-progreso-exterior">
                            <div style="width: <jsp:getProperty name="bitacora" property="porcentaje"/>%; background-color: #0C7F0C;">
                                <p><jsp:getProperty name="bitacora" property="porcentaje"/></p>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>Descripción del caso:</th>
                    <td colspan="2"><jsp:getProperty name="bitacora" property="descripcionCaso"/></td>
                </tr>
            </table>
        </article>
        <!-- Registros -->
        <article>
            <div class="contenedor-header">
                <div class="contenedor-titulo">
                    <h3>Registros</h3>
                </div>
                <div class="contenedor-btn">
                    <a href="newRegistro.jsp?idBitacora=<%= idBitacora %>" class="btn btn-green"><span class="icon-plus"></span> Nuevo</a>
                </div>
            </div>
            <div class="contenedor-table">
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
                        <td><%= registro.getPorcentaje() %> %</td>
                        <td><a href="#">Eliminar</a></td>
                    </tr>
                    <% } %>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </article>
    </section>
</body>
</html>
