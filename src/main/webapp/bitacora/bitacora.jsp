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
    <link rel="stylesheet" href="../styles/bitacora.css">
</head>
<style>
    *{
        padding: 0;
        margin: 0;
        font-family: "Segoe UI";
    }

    body{
        background-color: #8A5D35;
    }

    section{
        margin: 2em;
        border-left: #3D2917 solid 10px;
        padding: 2em;
        display: flex;
        flex-direction: column;
        gap: 2em;
        background-color: white;
        box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
    }

    .contenedor-titulo{
        display: grid;
        grid-template-columns: 1fr 0.75fr;
    }

    h1, h2, h3{
        color: #3D2917;
    }

    h1{
        font-size: 2em;
    }

    h3{
        font-size: 1.5em;
    }

    .contenedor-h{
        display: flex;
        align-items: center;
    }

    /*----------------------------------------------------------------------------------------------
------------------------------------------- BOTONES --------------------------------------------
-----------------------------------------------------------------------------------------------*/
    .btn{
        display: block;
        padding: 1em;
        border: none;
        font-size: 1em;
        border-radius: 5em;
        cursor: pointer;
        text-decoration: none;
    }

    .btn-green{
        color: #0C7F0C;
        background-color: white;
        border: #0C7F0C solid 2px;
    }

    .btn-green:hover{
        color: white;
        background-color: #0C7F0C;
        border: #0C7F0C solid 2px;
    }

    .btn-red{
        color: #BF2604;
        background-color: white;
        border: #BF2604 solid 2px;
    }

    .btn-red:hover{
        color: white;
        background-color: #BF2604;
        border: #BF2604 solid 2px;
    }

    .btn-azul{
        color: #5E44FC;
        background-color: white;
        border: #5E44FC solid 2px;
    }

    .btn-azul:hover{
        color: white;
        background-color: #5E44FC;
        border: #5E44FC solid 2px;
    }

    .contenedor-btn{
        display: flex;
        justify-content: end;
    }

    table, tr, th, td{
        border: black solid 2px;
        border-collapse: collapse;
    }

    th, td{
        padding: 2em;
        text-align: center;
    }

    .contenedor-table{
        padding: 1em;
        display: flex;
        justify-content: center;
    }
</style>
<body>
    <section>
        <article class="contenedor-titulo">
            <div class="contenedor-h">
                <h1>BITÁCORA</h1>
            </div>
            <div class="contenedor-btn">
                <a href="index.jsp" class="btn btn-red"><span class="icon-arrow-left"></span> Regresar</a>
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
                <div style="height: 100%; width: <jsp:getProperty name="bitacora" property="porcentaje"/>%; background-color: #0C7F0C"><p><jsp:getProperty name="bitacora" property="porcentaje"/></p></div>
            </div>
        </article>
        <!-- Registros -->
        <article>
            <div class="contenedor-titulo">
                <div class="contenedor-h">
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
