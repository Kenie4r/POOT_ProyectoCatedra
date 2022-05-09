<%@ page import="model.DeptController" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.DepartamentoData" %>
<%@ page import="views.CreateMenu" %>
<%@ page import="com.example.POO_ProyectoCatedra.SessionController" %><%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 7/4/2022
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(SessionController.isSessionStarted(request.getSession(),response)){
        response.sendRedirect("../index.jsp");
    }else{
%>
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Nueva Solicitudes</title>
    <link rel='stylesheet' href='../styles/icomoon/style.css'>
    <link rel='stylesheet' href='../styles/menustyle.css'>
    <link rel='stylesheet' href='../styles/solit.css'>
</head>
<body>
<%
    out.print(CreateMenu.Menu(1,Integer.parseInt(request.getSession().getAttribute("rol").toString())));
%>
<div class="div-2">
    <div class="body-margin">
        <div class="body-div">
            <form action="/CreateSolicitudServlet" method="post" id="form-p" class="form-div" enctype="multipart/form-data">
                <h2>Crear solicitud de caso</h2>
                <input type="hidden" value="<%=request.getSession().getAttribute("id")%>" name="txtUserID" required>
                <div class="inputs-files">
                    <div class="inputs">
                        <div class="input">
                            <label for="">Descripción</label>
                            <textarea name="txtDescr" id="" cols="30" rows="10" required>
INGRESE UNA PEQUEÑA DESCRIPCION DE LA SOLICITUD
                            </textarea>
                        </div>
                        <div class="input">
                            <label for="">Fecha Inicio</label>
                            <input type="date" name="txtDateTime" required>
                        </div>
                        <div class="input select">
                            <label for="slcDept">Departamento</label>
                            <select name="slcDept" id="slcDept" required>
                                <option value="">Seleccion un departamento</option>
                                <%
                                    DeptController deptsDB = new DeptController();
                                    ArrayList<DepartamentoData> depts = deptsDB.getAllDepts();
                                    for (DepartamentoData dept:
                                         depts) {
                                        out.println("<option value='"+dept.getId()+"'>"+dept.getTitulo()+"</option>");
                                    }

                                %>
                            </select>
                        </div>
                    </div>
                    <div class="fileinp">
                        <label for="txtFile" class="drag-file-area">
                            <span class="icon-file"></span>
                            <p id="nameFile">Arrastre un archivo PDF</p>
                        </label>
                        <input type="file" name="filePDF" id="txtFile" required>
                    </div>
                </div>
                <input type="submit" value="Crear" id="btn-form">
            </form>

        </div>
    </div>

</div>

<script src='../js/solicitud.js'></script>

</body>
</html>
<%}%>