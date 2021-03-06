<%@ page import="java.util.ArrayList" %>
<%@ page import="views.CreateMenu" %>
<%@ page import="model.*" %>
<%@ page session="true" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.example.POO_ProyectoCatedra.SessionController" %><%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 7/4/2022
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    ArrayList<Integer> roles = new ArrayList<>();
    roles.add(9);
    roles.add(6);

    HttpSession sesion = request.getSession();

    UserData datos = new UserData();

    if(sesion.getAttribute("usuario") == null){
        response.sendRedirect("../index.jsp");
    }else{
        datos = ((UserData) sesion.getAttribute("usuario"));
        if(!roles.contains(datos.getIdRol())){
            response.sendRedirect("../usuarios/dashboard.jsp");
        }
    }
    int SolicitudID = Integer.parseInt(request.getParameter("idSoli"));
    UsersController userDB = new UsersController();
    SolicitudData soli = SolicitudesController.getSolibyID(SolicitudID);
    BitacoraController bitacoraController = new BitacoraController();
    ArrayList<ArrayList<String>> programadores = bitacoraController.getProgramadoresByDep(datos.getIdDepartamento());

%>
<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset='UTF-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Aceptar solicitud</title>
    <link rel='stylesheet' href='../styles/icomoon/style.css'>
    <link rel='stylesheet' href='../styles/menustyle.css'>
    <link rel='stylesheet' href='../styles/solit.css'>
</head>
<body>
<%      out.print(CreateMenu.Menu(1, datos.getIdRol()));
%>
<div class="div-2">
    <div class="body-margin">
        <div class="body-div">
            <form action="/SolicitudManagerServlet" method="post" id="form-p" class="form-div">
                <h2>Aceptar solicitud solicitud de caso</h2>
                <input type="hidden" value="aceptar" name="opcion" >
                <input type="hidden" value="<%=SolicitudID%>" name="idSolicitud">
                <div class="inputs-files">
                    <div class="inputs">
                        <div class="input">
                            <label for="">Descripci??n de la solicitud</label>
                            <textarea name="txtDescr" id="" cols="30" rows="10" disabled><%=soli.getDescripcion()%>
                            </textarea>
                        </div>
                        <div class="input">
                            <label for="">Fecha Inicio</label>
                            <input type="text" name="txtDateTime" disabled value="<%=soli.getFechaInicio()%>">
                        </div>
                        <div class="input select">
                            <label for="dpt">Departamento</label>

                            <%
                                DeptController deptsDB = new DeptController();
                                DepartamentoData dp = deptsDB.getDepartmentbyID(soli.getIdDepartamento());
                            %>

                            <input type="text" name="departament" value="<%=dp.getTitulo()%>" id="dpt" disabled>
                        </div>

                    </div>
                    <div class="fileinp">
                        <div class="btn-pdf">
                            <a target="_blank" href="/ServletPDF?idPDF=<%=SolicitudID%>"><span class="icon-file"></span> PDF de este caso</a>
                        </div>
                        <div class="input select">
                            <label>Seleccione un programador</label>
                            <select name="programador" id="progrSL" class="select" required>
                                <option value=""> Programadores</option>
                                <%
                                    for (ArrayList<String> fila:programadores){
                                %>
                                <option value="<%= fila.get(0) %>"><%= fila.get(1) %></option>
                                <%
                                    }
                                %>
                            </select>

                        </div>
                        <div class="input">
                            <label for="fechaFinal">Ingrese el fecha de finalizacion</label>
                            <input name="fechaFinal" type="date" id="fechaFinal" required>
                            <br>
                        </div>
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