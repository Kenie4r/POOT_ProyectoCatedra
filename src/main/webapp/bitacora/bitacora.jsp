<%@ page import="model.RegistroBitacoraBean" %>
<%@ page import="views.CreateMenu" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bitacora" scope="session" class="model.BitacoraBean"></jsp:useBean>
<%@ page session="true" %>
<%
    //VARIABLES GLOBALES -----------------------------------------------------------------
    HttpSession sesion = request.getSession(); //Declaramos la sesion
    int idProgramador = 0; //Id programador
    int rol = 0; //Rol
    if( sesion.getAttribute("id") != null ){
        idProgramador = Integer.parseInt(sesion.getAttribute("id").toString()); //Seteamos el id
    }
    if( sesion.getAttribute("rol") != null ){
        rol = Integer.parseInt(sesion.getAttribute("rol").toString()); //Seteamos el rol
    }
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
    <link rel="stylesheet" href="../styles/icomoon/style.css">
    <link rel="stylesheet" href="../styles/bitacora.css">
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body class="div-2">
<%= CreateMenu.Menu(4,1) %>
    <section class="contenedor-section">
        <article class="contenedor-header">
            <div class="contenedor-titulo">
                <h1 class="titulo">BITÁCORA N°<jsp:getProperty name="bitacora" property="id"/></h1>
            </div>
            <div class="contenedor-btn">
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
                    <td colspan="3"><jsp:getProperty name="bitacora" property="descripcionCaso"/></td>
                </tr>
            </table>
        </article>
        <!-- Registros -->
        <article class="contenedor-header">
            <div class="contenedor-titulo">
                <h2 class="titulo">Registros</h2>
            </div>
            <div class="contenedor-btn">
                <% //if( bitacora.getEstadoCaso().equals("En desarollo") || bitacora.getEstadoCaso().equals("Devuelto con observaciones") ){ %>
                <a href="newRegistro.jsp?idBitacora=<%= idBitacora %>" class="btn-2"><span class="icon-plus"></span> Nuevo</a>
                <% //} %>
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
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% if(bitacora.countRegistros() == 0){ %>
                    <tr>
                        <td colspan="7">No existen registros todavía, informa acerca del avance.</td>
                    </tr>
                    <% }else{ %>
                    <% for(RegistroBitacoraBean registro:bitacora.getRegistros()){ %>
                    <tr>
                        <td><%= registro.getTitulo() %></td>
                        <td><%= registro.getDescripcion() %></td>
                        <td><%= registro.getPorcentaje() %> %</td>
                        <td><%= registro.getFecha() %></td>
                        <td><a href="deleteRegistro.jsp?idBitacora=<%= idBitacora %>&&id=<%= registro.getId() %>&&operacion=eliminar" class="btn-2"><span class="icon-trash-2"></span> Eliminar</a></td>
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
