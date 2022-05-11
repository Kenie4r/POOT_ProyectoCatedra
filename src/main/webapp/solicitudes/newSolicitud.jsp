<%@ page import="model.DeptController" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.DepartamentoData" %>
<%@ page import="views.CreateMenu" %>
<%@ page session="true" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.example.POO_ProyectoCatedra.SessionController" %>
<%@ page import="model.UserData" %>
<%@ page import="model.UsersController" %><%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 7/4/2022
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Integer> roles = new ArrayList<>();
    roles.add(7);
    roles.add(6);

    HttpSession sesion = request.getSession();

    UserData datos = new UserData();

    if(sesion.getAttribute("usuario") == null){
        response.sendRedirect("../index.jsp");
    }else{
        datos = ((UserData) sesion.getAttribute("usuario"));
        if(!roles.contains(Integer.toString(datos.getIdRol()))){
            response.sendRedirect("../usuarios/dashboard.jsp");
        }
    }
    UsersController usersController = new UsersController();
    UserData user = usersController.getUserByID(Integer.toString(datos.getIdUser()));

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
    out.print(CreateMenu.Menu(1, datos.getIdRol()));
%>
<div class="div-2">
    <div class="body-margin">
        <div class="body-div">
            <form action="/CreateSolicitudServlet" method="post" id="form-p" class="form-div" enctype="multipart/form-data">
                <h2>Crear solicitud de caso</h2>
                <input type="hidden" value="<%=datos.getIdUser()%>" name="txtUserID" required>
                <div class="inputs-files">
                    <div class="inputs">
                        <div class="input">
                            <label for="">Descripción</label>
                            <textarea name="txtDescr" id="" cols="30" rows="10" required>INGRESE UNA PEQUEÑA DESCRIPCION DE LA SOLICITUD</textarea>
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
                                        if(dept.getId() == user.getIdDepartamento()){
                                            out.println("<option value='"+dept.getId()+"'>"+dept.getTitulo()+"</option>");

                                        }
                                    }

                                %>
                            </select>
                        </div>
                    </div>
                    <div class="fileinp">
                        <label for="txtFile" class="drag-file-area">
                            <span class="icon-file"></span>
                            <p id="nameFile">Seleccione un archivo PDF</p>
                        </label>
                        <input type="file" name="filePDF" id="txtFile"  accept="application/pdf" required>
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