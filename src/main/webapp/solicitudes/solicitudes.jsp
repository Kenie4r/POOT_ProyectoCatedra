<%@ page import="views.CreateMenu" %>
<%@ page import="model.SolicitudesController" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.SolicitudData" %>
<%@ page import="model.DeptController" %>
<%@ page import="model.DepartamentoData" %><%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 8/4/2022
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Solicitudes</title>
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
    <link rel="stylesheet" type="text/css" href="../styles/icomoon/style.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
</head>
<body>
<%=CreateMenu.Menu(1,1)
%>
<div class="div-2">
    <div class="body-margin">

        <div class="btns">
            <a class="btn-new" href="newSolicitud.jsp"><span class="icon-plus"></span> Crear un nueva solicitud</a>
        </div>
        <div class="tables">
            <h2>Solicitudes</h2>
            <table>
                <thead>
                <tr>
                    <th>Descripcion</th>
                    <th>Departamento</th>
                    <th>PDF</th>
                </tr>
                </thead>
                <tbody>
                <%
                    SolicitudesController soliDBHandler = new SolicitudesController();
                    ArrayList<SolicitudData> solicitudes = soliDBHandler.getAllSolicitudes();
                    DeptController deptController = new DeptController();
                    for(SolicitudData solicitud: solicitudes){
                        DepartamentoData dep = deptController.getDepartmentbyID(solicitud.getIdDepartamento());
                        out.print("<tr><td>"+solicitud.getDescripcion()+"<td><td>"+
                                dep.getTitulo()+"</td><td>LINK</td></tr>");
                    }

                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
