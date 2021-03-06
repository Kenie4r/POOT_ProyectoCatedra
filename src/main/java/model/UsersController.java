package model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsersController {
    public UserData getUserByID(String id) {
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT * FROM usuario WHERE IdUsuario = ?";
        UserData user = new UserData();
        Connection handler = dbHandler.getCn();
        try {
            PreparedStatement statement = handler.prepareStatement(query);
            statement.setInt(1, Integer.parseInt(id) );
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                user.setIdUser(rs.getInt(1));
                user.setNombres(rs.getString(2));
                user.setApellidos(rs.getString(3));
                user.setIdRol(rs.getInt(4));
                user.setUser(rs.getString(5));
                user.setIdDepartamento(rs.getInt(7));
                user.setPass("");
            }
        } catch (SQLException throwables) {
            System.out.println("Error, razón: " +throwables.getMessage());
        }
        dbHandler.CloseConnection();
        return user;
    }
    public UserData getUserByUser(String id, String pass) {
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT * FROM usuario WHERE Usuario = ? AND Passwd = ?";
        Connection handler = dbHandler.getCn();
        UserData user = new UserData();
        try {
            PreparedStatement statement = handler.prepareStatement(query);
            statement.setString(1, id);
            statement.setString(2, pass);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                user.setIdUser(rs.getInt("IdUsuario"));
                user.setNombres(rs.getString("Nombres"));
                user.setApellidos(rs.getString("Apellidos"));
                user.setIdRol(rs.getInt("Rol"));
                user.setUser(rs.getString("Usuario"));
                user.setIdDepartamento(rs.getInt("IdDepartamento"));
                user.setEstadoBaja(rs.getByte("EstadoBaja"));
            }
        }catch (NullPointerException | SQLException e){
            System.out.println(e.getMessage());
        }
        dbHandler.CloseConnection();
        return user;
    }
    public void NewUser(UserData user){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "INSERT INTO usuario(Nombres, Apellidos, Usuario,Rol, Passwd,IdDepartamento)" +
                " VALUES(?,?,?,?,?,?)";
        try{
            PreparedStatement statement = dbHandler.getCn().prepareStatement(query);
            statement.setString(1, user.getNombres());
            statement.setString(2, user.getApellidos());
            statement.setString(3, user.getUser());
            statement.setInt(4, user.getIdRol());
            statement.setString(5, user.getPass());
            statement.setInt(6, user.getIdDepartamento());
            statement.executeUpdate();
            System.out.println("Registro hecho");
        }catch (SQLException e){
            System.out.println("Error, razón: " + e.getMessage());
            e.printStackTrace();
        }

        //return "Registro exitoso";

    }
    public void UpdateUser(UserData user){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "UPDATE usuario SET Nombres = ?  ," +
                " Apellidos = ?, Usuario = ? ," +
                "Rol = ?,IdDepartamento =?"+
                " WHERE IdUsuario = ?";
        try{
            PreparedStatement statement = dbHandler.getCn().prepareStatement(query);
            statement.setString(1, user.getNombres());
            statement.setString(2, user.getApellidos());
            statement.setString(3, user.getUser());
            statement.setInt(4, user.getIdRol());
            statement.setInt(5, user.getIdDepartamento());
            statement.setInt(6, user.getIdUser());
            statement.executeUpdate();
            System.out.println("Registro hecho");

        }catch (SQLException e){
            System.out.println("Error, razón: " + e.getMessage());
            e.printStackTrace();
        }

        //return "Registro exitoso";

    }
    public ArrayList<UserData> getAllUsers(){
        ArrayList<UserData> list = new ArrayList<>();
        String sql = "SELECT IdUsuario, Usuario, Rol, IdDepartamento, EstadoBaja FROM usuario";
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
                user.setEstadoBaja(rs.getByte(5));
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
    public boolean updatePass(UserData user){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "UPDATE usuario SET Passwd = ? WHERE IdUsuario = ?";
        try{
            PreparedStatement statement = dbHandler.getCn().prepareStatement(query);
            statement.setString(1, user.getPass());
            statement.setInt(2, user.getIdUser());
            statement.executeUpdate();
            System.out.println("Registro hecho");
            return true;
        }catch (SQLException e){
            System.out.println("Error, razón: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    public int getCUserbyPass(UserData user){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT COUNT(IdUsuario) FROM usuario WHERE Passwd = ? AND IdUsuario = ? ";
        try{
            int c = 0;
            PreparedStatement statement = dbHandler.getCn().prepareStatement(query);
            statement.setString(1, user.getPass());
            statement.setInt(2, user.getIdUser());
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                System.out.println(rs.getString(1));
                c = rs.getInt(1);
            }
            System.out.println("se encontro = "  + c);
            return c;
        }catch (SQLException e){
            System.out.println("Error, razón: " + e.getMessage());
            e.printStackTrace();
            return 0;
        }
    }
    public Boolean updateEstadoBaja(UserData user){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "UPDATE usuario SET EstadoBaja = ? WHERE IdUsuario = ?";
        try{
            PreparedStatement statement = dbHandler.getCn().prepareStatement(query);
            statement.setByte(1, user.getEstadoBaja());
            statement.setInt(2, user.getIdUser());
            statement.executeUpdate();
            System.out.println("(Update Estado de Baja) Registro hecho");
            return true;
        }catch (SQLException e){
            System.out.println("(Update Estado de Baja) Error, razón: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
