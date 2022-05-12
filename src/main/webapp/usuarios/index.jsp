<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="views.CreateMenu" %>
<%@ page import="com.example.POO_ProyectoCatedra.SessionController" %><%--
=======
<%@ page import="views.CreateMenu" %>
<%--
>>>>>>> Stashed changes
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 31/3/2022
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession sesion = request.getSession();

    UserData datos = new UserData();

    if(sesion.getAttribute("usuario") == null){
        response.sendRedirect("../index.jsp");
    }else{
        datos = ((UserData) sesion.getAttribute("usuario"));
        if(datos.getIdRol() != 6){
            response.sendRedirect("dashboard.jsp");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios</title>
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
    <link rel="stylesheet" type="text/css" href="../styles/icomoon/style.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
</head>
<body>
<%
        out.println(CreateMenu.Menu(6,datos.getIdRol()));
%>

<div class="div-2">
    <div class="body-margin">

        <div class="btns">
            <a class="btn-new" href="UserRegister.jsp"><span class="icon-plus"></span> Crear un nuevo usuario</a>
        </div>
        <div class="tables">
            <h2>Usuarios creados</h2>
            <table>
                <thead>
                <tr>
                    <th>Usuario</th>
                    <th>Departamento</th>
                    <th>Rol</th>
                    <th colspan="2">Opciones</th>
                    <th>Estado de baja</th>
                </tr>
                </thead>
                <tbody>
                    <%
                        UsersController usersDB = new UsersController();
                        ArrayList<UserData> listUser = usersDB.getAllUsers();
                        DeptController depDB = new DeptController();
                        RolController rolDB = new RolController();
                        String estadoAux = "";
                        for (UserData user:
                             listUser) {
                            DepartamentoData dept = depDB.getDepartmentbyID(user.getIdDepartamento());
                            RolData rol = rolDB.getRolbyID(user.getIdRol());
                            estadoAux = user.getEstadoBaja()==0?"Dar de baja":"Dar de alta";
                            out.println("<tr><td>"+user.getUser()+"</td><td>"+
                                    dept.getTitulo()+"</td><td>"+rol.getTitulo()+"</td>" +
                                    "<td class='btn-ver'><a href='useredit.jsp?id="+user.getIdUser()+"'><span class='icon-edit'></span> Ver y editar</a></td>" +
                                    "</tr>");
                            out.println("<td class='btn-ver'><a href='updateEstado.jsp?idUser="+user.getIdUser()+"&estado="+user.getEstadoBaja()+"'>"+estadoAux+"</a></td>");
                        }
                    %>
                </tbody>
             </table>
        </div>
    </div>
</div>
</body>
</html>