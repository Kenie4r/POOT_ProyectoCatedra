package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RolController {
    public ArrayList<RolData> getRolsExectpID(int id){
        ArrayList<RolData> lista = new ArrayList<>();
        String sql = "SELECT * FROM rol WHERE IdRol <> ?";
        ConnectionDB dbHandler = new ConnectionDB();

        try {
            PreparedStatement statement = dbHandler.getCn().prepareStatement(sql);
            statement.setInt(1,id);

            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                RolData nRol = new RolData();

                nRol.setTitulo(rs.getString(2));
                nRol.setId(rs.getInt(1));
                lista.add(nRol);
            }
        }catch (SQLException e){
            RolData nRol = new RolData();

            nRol.setId(0);
            nRol.setTitulo("No hay Roles");
            lista.set(0, nRol);
        }
        dbHandler.CloseConnection();
        return lista;
    }
    public RolData getRolbyID(int id){
        RolData nRol = new RolData();
        String sql = "SELECT * FROM rol WHERE IdRol = ?";
        ConnectionDB dbHandler = new ConnectionDB();

        try {
            PreparedStatement statement = dbHandler.getCn().prepareStatement(sql);
            statement.setInt(1 ,id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                nRol.setTitulo(rs.getString(2));
                nRol.setId(rs.getInt(1));
            }
        }catch (SQLException e){
            nRol.setTitulo("No hay departamento");
        }
        dbHandler.CloseConnection();

        return nRol;
    }
    public ArrayList<RolData> getAllRols(){
        ArrayList<RolData> lista = new ArrayList<>();
        String sql = "SELECT * FROM rol";
        ConnectionDB dbHandler = new ConnectionDB();
        dbHandler.selectData(sql);
        ResultSet rs = dbHandler.getData();
       try {
           while (rs.next()){
                RolData nRol = new RolData();
                nRol.setTitulo(rs.getString(2));
                nRol.setId(rs.getInt(1));
                lista.add(nRol);
           }
       }catch (SQLException e){
           System.out.println(e.getMessage());
       }
        dbHandler.CloseConnection();


        return lista;
    }
}
