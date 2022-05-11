<%@ page import="views.CreateMenu" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %>
<%@ page session="true" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.example.POO_ProyectoCatedra.SessionController" %><%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 8/4/2022
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    ArrayList<Integer> roles = new ArrayList<>();
    roles.add(6);
    roles.add(9);
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

    int idRol = datos.getIdRol();
    UsersController userDB = new UsersController();
    UserData user = userDB.getUserByID(Integer.toString(datos.getIdUser()));


%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Solicitudes administrar</title>
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
    <link rel="stylesheet" type="text/css" href="../styles/icomoon/style.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

</head>
<body>
<%
     out.print(CreateMenu.Menu(2,idRol));

%>

<div class="div-2">
    <div class="body-margin">

        <div class="btns">
            <a class="btn-new" href="newSolicitud.jsp"><span class="icon-plus"></span> Crear un nueva solicitud</a>
        </div>
        <div class="tables">
            <h2>Solicitudes</h2>
            <table id="table">
                <thead>
                <tr>
                    <th>Descripcion</th>
                    <th>Departamento</th>
                    <th>Estado</th>
                    <th>PDF</th>
                    <%
                        if(idRol==9){
                            out.println("<th>Opciones</th>");
                        }
                    %>
                </tr>
                </thead>
                <tbody>
                <%
                    SolicitudesController soliDBHandler = new SolicitudesController();
                    ArrayList<SolicitudData> solicitudes;
                    if(idRol ==6){
                       solicitudes =  soliDBHandler.getAllSolicitudes();
                    }else{
                        solicitudes =  soliDBHandler.getAllSolicitudesbyDept(user.getIdDepartamento());

                    }
                    DeptController deptController = new DeptController();
                    if(solicitudes.size()==0){
                        out.println("<tr><td colspan='3'>NO HAY SOLICITUDES</td></tr>");
                    }else{
                        int c = 0;
                        for(SolicitudData solicitud: solicitudes){
                            String desc = "", opts = "";

                            if(solicitud.getDescripcion().length() >=15){
                                desc = solicitud.getDescripcion().substring(0,12) + "...";
                            }else{
                                desc = solicitud.getDescripcion();
                            }

                            if(idRol == 9 && solicitud.getEstado()==1){
                                opts ="<td class='btn-ver'><div class='btn-adm' id='btn_"+c+"'>Adiministrar <input " +
                                        "type='hidden' id='sol_"+c+"' value='"+solicitud.getIdSolicitud()+"'/><div> </td>";
                            }else{
                                opts ="<td class='btn-ver'><div class='btn-no' id='btn_"+c+"'>No hay opciones<div> </td>";
                            }

                            DepartamentoData dep = deptController.getDepartmentbyID(solicitud.getIdDepartamento());
                            EstadoData estado = soliDBHandler.getEstadoByID(solicitud.getEstado());
                            out.println("<tr><td colspan='1'>"+desc+"</td><td>"+
                                    dep.getTitulo()+"</td><td>"+estado.getName()+"</td>" +
                                    "<td class='btn-ver'><a target='_blank'  href='/ServletPDF?idPDF="+solicitud.getIdSolicitud()+"'>ver PDF</a></td>"+opts+"</tr>");
                            c++;
                        }
                    }


                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div id="nots"></div>


<script src="../js/adm_soli.js"></script>
</body>
</html>