<%@ page import="model.RegistroBitacoraBean" %>
<%@ page import="views.CreateMenu" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../libs/cabeceraOneBitacora.jsp"%> <!-- Existe una bitacora -->
<%@ include file="../libs/cabeceraMensajesRegistros.jsp"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bitácora</title>
    <link rel="stylesheet" href="../styles/icomoon/style.css">
    <link rel="stylesheet" href="../styles/bitacora.css">
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body class="div-2">
<%= CreateMenu.Menu(4,Integer.parseInt(request.getSession().getAttribute("rol").toString())) %>
    <section class="contenedor-section">
        <article class="contenedor-header">
            <div class="contenedor-titulo">
                <h1 class="titulo">BITÁCORA N°<jsp:getProperty name="bitacora" property="id"/></h1>
            </div>
            <div class="contenedor-btn">
                <% if( permisoBitacora == 2 || rol == 9 ){ %>
                <a href="deleteBitacora.jsp?idBitacora=<jsp:getProperty name="bitacora" property="id"/>" class="btn-2">Eliminar</a>
                <% } %>
                <a href="index.jsp" class="btn-2"><span class="icon-arrow-left"></span> Regresar</a>
            </div>
        </article>
        <!-- Bitacora -->
        <article class="tables" style="display: flex; justify-content: center;">
            <table>
                <tr>
                    <th>Número de caso:</th>
                    <th>Programador encargado:</th>
                    <th>Progreso del proyecto:</th>
                    <th>Estado del proyecto:</th>
                </tr>
                <tr>
                    <td><jsp:getProperty name="bitacora" property="idCaso"/></td>
                    <td><jsp:getProperty name="bitacora" property="nombreProgramador"/></td>
                    <td>
                        <div style="border: black 2px solid">
                            <div style="width: <jsp:getProperty name="bitacora" property="porcentaje"/>%; background-color:  #6343e4;">
                                <p><jsp:getProperty name="bitacora" property="porcentaje"/></p>
                            </div>
                        </div>
                    </td>
                    <td><jsp:getProperty name="bitacora" property="estadoCaso"/></td>
                </tr>
                <tr>
                    <th>Descripción del caso:</th>
                    <td><jsp:getProperty name="bitacora" property="descripcionCaso"/></td>
                    <th>Fecha  límite:</th>
                    <td><jsp:getProperty name="bitacora" property="fechaLimite"/></td>
                </tr>
            </table>
        </article>
        <!-- Registros -->
        <article class="contenedor-header">
            <div class="contenedor-titulo">
                <h2 class="titulo">Registros</h2>
            </div>
            <div class="contenedor-btn">
                <% if( permisosRegistros && permisoBitacora == 3 ){ %>
                <% if(estadoOR > 0){ %>
                <p class="btn-2"><%= mensaje %></p>
                <% } %>
                <a href="newRegistro.jsp?idBitacora=<%= idBitacora %>" class="btn-2"><span class="icon-plus"></span> Nuevo</a>
                <% } %>
            </div>
        </article>
        <article>
            <div class="tables">
                <table>
                    <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Porcentaje de avance</th>
                        <th>Fecha</th>
                        <% if(permisosRegistros && permisoBitacora == 3){ %>
                        <th>Acciones</th>
                        <% } %>
                    </tr>
                    </thead>
                    <tbody>
                    <% if(bitacora.countRegistros() == 0){ %>
                    <tr>
                        <td colspan="<%= permisoBitacora==3?"7":"6" %>">No existen registros todavía, informa acerca del avance.</td>
                    </tr>
                    <% }else{ %>
                    <% for(RegistroBitacoraBean registro:bitacora.getRegistros()){ %>
                    <tr>
                        <td><%= registro.getTitulo() %></td>
                        <td><%= registro.getDescripcion() %></td>
                        <td><%= registro.getPorcentaje() %> %</td>
                        <td><%= registro.getFecha() %></td>
                        <% if( permisosRegistros && permisoBitacora == 3 ){ %>
                        <td><a href="deleteRegistro.jsp?idBitacora=<%= idBitacora %>&&id=<%= registro.getId() %>&&operacion=eliminar" class="btn-2"><span class="icon-trash-2"></span> Eliminar</a></td>
                        <% } %>
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
