package model;


public class UsersController {
    public void NewUser(UserData user){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "INSERT INTO usuario(Nombres, Apellidos, Username,Rol, Passwd,IdDepartamento)" +
                " VALUES('"+user.getNombres()+"','"+user.getApellidos()+"','"+user.getUser()+"',1 , '" +
                user.getPass() +  "',1)";
        dbHandler.setResult(query);
        System.out.println(dbHandler.getData());
        //return "Registro exitoso";

    }
}
