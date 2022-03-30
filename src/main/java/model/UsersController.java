package model;


public class UsersController {
    public String NewUser(){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "INSERT INTO usuario(Nombres, Apellidos, Rol, Passwd,IdDepartamento)" +
                " VALUES()";
        dbHandler.setResult(query);
        System.out.println(dbHandler.getData());
        return "Registro exitoso";

    }
}
