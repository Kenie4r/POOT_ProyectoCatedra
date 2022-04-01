package model;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsersController {
    public void NewUser(UserData user){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "INSERT INTO usuario(Nombres, Apellidos, Usuario,Rol, Passwd,IdDepartamento)" +
                " VALUES('"+user.getNombres()+"','"+user.getApellidos()+"','"+user.getUser()+"',"+user.getIdRol()+", '" +
                user.getPass() +  "',"+user.getIdDepartamento()+")";
        dbHandler.setResult(query);
        System.out.println(dbHandler.getData());
        //return "Registro exitoso";

    }
    public ArrayList<UserData> getAllUsers(){
        ArrayList<UserData> list = new ArrayList<>();
        String sql = "SELECT IdUsuario, Usuario, Rol, IdDepartamento FROM usuario";
        ConnectionDB dbHandler = new ConnectionDB();
        dbHandler.selectData(sql);
        try {

            ResultSet rs = dbHandler.getData();
            while (rs.next()){
                UserData user = new UserData();
                user.setIdUser(rs.getInt(1));
                user.setUser(rs.getString(2));
                user.setIdRol(rs.getInt(3));
                user.setIdDepartamento(rs.getInt(4));
                list.add(user);
            }
        }catch (NullPointerException | SQLException e){
            UserData user = new UserData();
            user.setIdUser(0);
            user.setUser("NO HAY USUARIO");
            list.add(user);
        }

        return list;
    }
}
