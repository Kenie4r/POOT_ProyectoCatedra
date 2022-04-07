package model;

import java.sql.*;

public class ConnectionDB {
    private Connection cn;
    private ResultSet rs;
    private Statement statement;
    private int changes;

    public ConnectionDB(){
        //conexion a la base de datos
        String host = "jdbc:mysql://db4free.net:3306/";
        String username = "adminpoopro";
        String pass = "Q!R#=+oQkHQUwpo0";
        String db = "poot_proyectocat";

        try{
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(host + db ,
                    username,
                    pass);
            statement = cn.createStatement();
            System.out.println("Conexión lograda con exito");
        }catch (SQLException | NullPointerException e){
            System.out.println("Conexión fallida. \nRazón: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println("Conexión fallida. \nRazón: " + e.getMessage());
        }
    }
    public void setResult(String query){
        try {
            changes = statement.executeUpdate(query);
            this.rs = statement.getResultSet();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public void setResultV2(String query) throws SQLException{

        changes = statement.executeUpdate(query);
        this.rs = statement.getResultSet();
    }
    public ResultSet getData(){
        //funcion para obtener datos de un insert
        return this.rs;
    }
    public void selectData(String query){
        try {
            statement.executeQuery(query);
            this.rs = statement.getResultSet();
        } catch (SQLException throwables) {
            System.out.println("Algo ha salido mal: " + throwables.getMessage());
        }
    }
    public void CloseConnection(){
        try{
            this.cn.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }

        System.out.println( "Conexión cerrada." );
    }

    //Comprobar cambios
    public int getChanges(){
        return this.changes;
    }
}
