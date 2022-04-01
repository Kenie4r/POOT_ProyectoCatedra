<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %><%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 31/3/2022
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios</title>
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
    <link rel="stylesheet" type="text/css" href="../styles/icomoon/style.css">
</head>
<body>
<div class="div-form2">
    <div style="width: 85%; display: flex; justify-content: flex-end; padding: 2em;">
        <a class="btn-new" href="UserRegister.jsp"><span class="icon-plus"></span> Crear un nuevo usuario</a>
    </div>
    <div class="tables">
    <table>
        <tr>
            <th>Usuario</th>
            <th>Departamento</th>
            <th>Rol</th>
            <th colspan="2">Opciones</th>
        </tr>
        <%
            UsersController usersDB = new UsersController();
            ArrayList<UserData> listUser = usersDB.getAllUsers();
            DeptController depDB = new DeptController();
            RolController rolDB = new RolController();
            for (UserData user:
                 listUser) {
                DepartamentoData dept = depDB.getDepartmentbyID(user.getIdDepartamento());
                RolData rol = rolDB.getRolbyID(user.getIdRol());
                out.println("<tr><td>"+user.getUser()+"</td><td>"+
                        dept.getTitulo()+"</td><td>"+rol.getTitulo()+"</td>" +
                        "<td class='btn-ver'><a href='useredit.jsp?id="+user.getIdUser()+"'><span class='icon-edit'></span> Ver y editar</a></td>" +
                        "</tr>");
            }



        %>
    </table>
    </div>
</div>

</body>
</html>
