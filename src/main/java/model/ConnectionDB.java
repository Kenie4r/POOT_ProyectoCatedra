package model;

import java.sql.*;

public class ConnectionDB {
    private Connection cn;
    private ResultSet rs;
    private Statement statement;

    public ConnectionDB(){
        //conexion a la base de datos
        String host = "jdbc:mysql://bek0ooga0fnldwzhafa7-mysql.services.clever-cloud.com/";
        String username = "ugeqsa0rgmuikxqf";
        String pass = "NpQAarJjzhI0OFgsQON0";
        String db = "bek0ooga0fnldwzhafa7";

        try{
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(host + db ,
                    username,
                    pass);
            statement = cn.createStatement();
            System.out.println("Conexión lograda con exito");
        }catch (SQLException e){
            System.out.println("Conexión fallida. \nRazón: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.out.println("Conexión fallida. \nRazón: " + e.getMessage());
        }
    }
    public void setResult(String query){
        try {
            statement.executeUpdate(query);
            this.rs = statement.getResultSet();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
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
    }
}
