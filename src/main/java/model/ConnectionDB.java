package model;

import util.Verificar;

import java.sql.*;
import java.util.ArrayList;

public class ConnectionDB {
    private Connection cn;
    private ResultSet rs;
    private Statement statement;
    private int changes;

    public ConnectionDB(){
        //conexion a la base de datos
        String host = "jdbc:mysql://localhost/";
        String username = "root";
        String pass = "";
        String db = "proyectocatedra_poo";

        try{
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(host + db ,
                    username,
                    pass);
            statement = getCn().createStatement();
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

    public void setResultV3(String query, ArrayList<String> datos){
        Boolean isNotNumeric = false;
        try {
            PreparedStatement smt = cn.prepareStatement(query);
            for(int i = 0; i < datos.size(); i++){
                try {
                    int aux = Integer.parseInt(datos.get(i));
                    smt.setInt((i+1), aux);
                    isNotNumeric = false;
                }catch (Exception e){
                    isNotNumeric = true;
                }
                /*try {
                    Double aux2 = Double.parseDouble(datos.get(i));
                    smt.setDouble((i+1), aux2);
                    isNotNumeric = false;
                }catch (Exception e){
                    isNotNumeric = true;
                }*/
                if(isNotNumeric){
                    smt.setString((i+1), datos.get(i) );
                }
            }
            changes = smt.executeUpdate();
            this.rs = statement.getResultSet();
        }catch (SQLException e){
            System.out.println("Error SQL (ConnectionDB.setResultV3): " + e);
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
            this.getCn().close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }

        System.out.println( "Conexión cerrada." );
    }

    //Comprobar cambios
    public int getChanges(){
        return this.changes;
    }

    public Connection getCn() {
        return cn;
    }
}
