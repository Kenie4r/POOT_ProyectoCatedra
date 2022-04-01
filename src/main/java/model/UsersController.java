package model;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsersController {
    public UserData getUserByID(String id) {
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT * FROM usuario WHERE IdUsuario = "+id;
        dbHandler.selectData(query);
        UserData user = new UserData();

        try {
            ResultSet rs = dbHandler.getData();
            while (rs.next()){
                user.setIdUser(rs.getInt(1));
                user.setNombres(rs.getString(2));
                user.setApellidos(rs.getString(3));
                user.setIdRol(rs.getInt(4));
                user.setUser(rs.getString(5));
                user.setIdDepartamento(rs.getInt(7));
                user.setPass("");
            }
        }catch (NullPointerException | SQLException e){
            System.out.println(e.getMessage());
            user.setIdUser(0);
            user.setUser("NO HAY USUARIO");

        }
        dbHandler.CloseConnection();
        return user;
    }
    public void NewUser(UserData user){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "INSERT INTO usuario(Nombres, Apellidos, Usuario,Rol, Passwd,IdDepartamento)" +
                " VALUES('"+user.getNombres()+"','"+user.getApellidos()+"','"+user.getUser()+"',"+user.getIdRol()+", '" +
                user.getPass() +  "',"+user.getIdDepartamento()+")";
        dbHandler.setResult(query);
        System.out.println(dbHandler.getData());
        dbHandler.CloseConnection();

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
        }catch ( SQLException e){
            UserData user = new UserData();
            user.setIdUser(0);
            user.setUser("NO HAY USUARIO");
            list.add(user);
        }
        dbHandler.CloseConnection();

        return list;
    }
}
