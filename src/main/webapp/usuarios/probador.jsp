<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %>
<%@ page import="views.CreateMenu" %>
<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 05/04/2022
  Time: 09:00 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Probador</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <link rel="stylesheet" type="text/css" href="../styles/icomoon/style.css">
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
</head>
<body>
<%=CreateMenu.Menu(6,1)
%>
<div class="div-2">
    <div class="body-margin">

        <div class="btns">
            <a class="btn-new" href="UserRegister.jsp"><span class="icon-plus"></span> Crear un nuevo usuario</a>
        </div>
        <div class="tables">
            <h2>Lista de casos esperando aprobacion</h2>
            <table>
                <thead>
                <tr>
                    <th scope="col">ID caso</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Estado</th>
                    <th colspan="2">Opciones</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ProbadorController probadorDB = new ProbadorController();
                    ArrayList<ProbadorData> listprobador = probadorDB.getAllCasos();
                    for (ProbadorData probador: listprobador) {
                        out.println("<tr><td>"+probador.getIdCaso()+"</td><td>"+ probador.getDescripcion()+"</td><td>"+probador.getEstado()+"</td>" +
                                "<td class='btn-ver'><a href='aprobar.jsp?id="+probador.getIdCaso()+"'><span class='icon-edit'></span>Aprobar</a>" +
                                "<a href='reprobar.jsp?id="+probador.getIdCaso()+"'><span class='icon-edit'></span>Reprobar</a>" +
                                "</td>" +
                                "</tr>");
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
