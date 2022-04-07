<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %>

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
</head>
<body>

<div class="div-form2">
    <div style="width: 85%; display: flex; justify-content: flex-end; padding: 2em;">
        <a class="btn-new" href="UserRegister.jsp"><span class="icon-plus"></span> Crear un nuevo usuario</a>
    </div>
    <div class="table-responsive">
        <table class="table align-middle">
            <thead class="table-dark">
            <tr>
                <th scope="col">ID caso</th>
                <th scope="col">Descripcion</th>
                <th scope="col">Estado</th>
                <th colspan="2">Opciones</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <%
                    ProbadorController probadorDB = new ProbadorController();
                    ArrayList<ProbadorData> listprobador = probadorDB.getAllUsers();
                    for (ProbadorData probador: listprobador) {
                        out.println("<tr><td>"+probador.getIdCaso()+"</td><td>"+ probador.getDescripcion()+"</td><td>"+probador.getEstado()+"</td>" +
                                "<td class='btn-aprobar'>" +
                                    "<a href='useredit.jsp?id="+probador.getIdCaso()+"'><span class='icon-edit'></span> Aprobar</a>" +
                                    "<a href='useredit.jsp?id="+probador.getIdCaso()+"'><span class='icon-edit'></span> Reprobar</a>" +
                                "</td>" +
                                "</tr>");
                    }
                %>
            </tr>
            <tr class="align-bottom">

            </tr>
            <tr>
                <td>...</td>
                <td>...</td>
                <td class="align-top">This cell is aligned to the top.</td>
                <td>...</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
