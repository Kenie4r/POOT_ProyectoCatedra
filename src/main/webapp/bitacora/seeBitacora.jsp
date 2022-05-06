<%@ page import="model.RegistroBitacoraBean" %>
<%@ page import="views.CreateMenu" %>
<%@ page import="com.example.POO_ProyectoCatedra.SessionController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bitacora" scope="session" class="model.BitacoraBean"></jsp:useBean>
<%
    SessionController.isSessionStarted(request,response);//controlador de session
    //int rol = Integer.parseInt(request.getSession().getAttribute("rol").toString());
    int idProgramador = Integer.parseInt(request.getSession().getAttribute("id").toString());

    //VARIABLES GLOBALES -----------------------------------------------------------------
    //int idProgramador = 1; //Id programador
    int idBitacora = Integer.parseInt(request.getParameter("idBitacora")); //Id bitacora
    String operacion = request.getParameter("operacion"); //Operacion
    String rol = "Jefe de desarrollo"; //Solo jefes pueden verlo

    //BITACORA ---------------------------------------------------------------------------
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
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<%= CreateMenu.Menu(4,Integer.parseInt(request.getSession().getAttribute("rol").toString())) %>
<section>
    <article class="contenedor-header">
        <div class="contenedor-titulo">
            <h1>BITÁCORA N°<jsp:getProperty name="bitacora" property="id"/></h1>
        </div>
        <div class="contenedor-btn">
            <%
                if( operacion.equals("ver") ){
            %>
            <a href="index.jsp" class="btn btn-azul"><span class="icon-arrow-left"></span> Regresar</a>
            <%
                }else if( operacion.equals("eliminar") ){
            %>
            <a href="deleteBitacora.jsp?idBitacora=<jsp:getProperty name="bitacora" property="id"/>" class="btn btn-red">Eliminar</a>
            <a href="index.jsp" class="btn btn-azul"><span class="icon-arrow-left"></span> Regresar</a>
            <%
                }
            %>
        </div>
    </article>
    <!-- Bitacora -->
    <article style="display: flex; justify-content: center;">
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
                    <div class="barra-progreso-exterior">
                        <div style="width: <jsp:getProperty name="bitacora" property="porcentaje"/>%; background-color: #0C7F0C;">
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
    <article>
        <div class="contenedor-header">
            <div class="contenedor-titulo">
                <h3>Registros</h3>
            </div>
        </div>
        <div class="contenedor-table">
            <table>
                <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Porcentaje de avance</th>
                    <th>Fecha</th>
                </tr>
                </thead>
                <tbody>
                <% if(bitacora.countRegistros() == 0){ %>
                <tr>
                    <td colspan="6">No existen registros todavía.</td>
                </tr>
                <% }else{ %>
                <% for(RegistroBitacoraBean registro:bitacora.getRegistros()){ %>
                <tr>
                    <td><%= registro.getTitulo() %></td>
                    <td><%= registro.getDescripcion() %></td>
                    <td><%= registro.getPorcentaje() %> %</td>
                    <td><%= registro.getFecha() %></td>
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

