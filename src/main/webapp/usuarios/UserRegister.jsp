<%@ page import="model.RolController" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.RolData" %>
<%@ page import="model.DeptController" %>
<%@ page import="model.DepartamentoData" %><%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 30/3/2022
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Usuario</title>
    <link href="/styles/register.css" type="text/css" rel="stylesheet">
    <link href="/styles/icomoon/style.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="div-form">
    <form action="/CreateUser" id="form-p">
        <h2>Registrar un nuevo usuario</h2>
        <div class="inputs">
            <div class="input-grid">
                <div class="input">
                    <label for="txtNames" class="label">Nombres del empleado</label>
                    <input type="text" name="names" id="txtNames" class='text-inp'required>
                </div>
                <div class="input">
                    <label for="txtLastName" class="label">Apellidos del usuario</label>
                    <input type="text" id="txtLastName" name="lastname" class='text-inp' required>
                </div>
            </div>
            <div class="input">
                <label for="txtUsername" class="label">Nombre de Usuario</label>
                <input type="text" name="username" id="txtUsername" class='text-inp'required>
            </div>
            <div class="input">
                <label for="txtPass" class="label">Contraseña</label>
                <input type="password" name='pass' id='txtPass' class='text-inp' required>
            </div>
            <div class="input">
                <label for="txtPassc" class="label">Confirmación de contraseña <span class="icon-alert-triangle" id="conf"></span></label>
                <input type="password" name="passc" id="txtPassc" class='text-inp' required>
            </div>
            <div class="input-2">
                <label for="slDepartamento" class="label">Departamento</label>
                <select name="dept" id="slDepartamento" required>
                    <option value="">Seleccionar un departamento</option>
                    <%
                        DeptController dbDep = new DeptController();
                        ArrayList<DepartamentoData> depts = dbDep.getAllDepts();
                        for (DepartamentoData e:
                             depts) {
                            out.print("<option value='"+e.getId()+"'>"+e.getTitulo()+"</option>"); 
                        }

                    %>

                </select>
            </div>
            <div class="input-2">
                <label for="slRed" class="label">Rol</label>
                <select name="rol" id="slRed" required>
                    <option value="">Seleccione un Rol</option>
                    <%
                        RolController rolesDB = new RolController();
                        ArrayList<RolData> roles = rolesDB.getAllRols();
                        for (RolData rol:
                              roles) {
                            out.print("<option value='"+rol.getId()+"'>"+rol.getTitulo()+"</option>");
                        }

                    %>
                </select>
            </div>
            <div class="input-2"><input type="submit" value="Guardar usuario"></div>
    </form>

</div>
<script src="../js/register.js"></script>

</body>
</html>
