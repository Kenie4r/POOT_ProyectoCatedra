<%--
  Created by IntelliJ IDEA.
  User: Usuario
  Date: 30/3/2022
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de usuarios</title>
    <link rel="stylesheet" href="css/register.css">
</head>
<body>
<div class="div-form">
    <form action="" id="form-p">
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
                <input type="text" name='pass' id='txtPass' class='text-inp' required>
            </div>
            <div class="input">
                <label for="txtPassc" class="label">Confirmación de contraseña</label>
                <input type="text" name="passc" id="txtPassc" class='text-inp' required>
            </div>
            <div class="input-2">
                <label for="slDepartamento" class="label">Departamento</label>
                <select name="dept" id="slDepartamento" required>
                    <option value="">Seleccionar un departamento</option>
                </select>
            </div>
            <div class="input-2">
                <label for="slRed" class="label">Rol</label>
                <select name="rol" id="slRed" required>
                    <option value="">Seleccione un Rol</option>
                </select>
            </div>
            <div class="input-2"><input type="submit" value="Guardar usuario"></div>
    </form>
</div>
<script src="js/register_js.js"></script>

</body>
</html>
