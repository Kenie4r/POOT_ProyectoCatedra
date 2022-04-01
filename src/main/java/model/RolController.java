package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RolController {
    public RolData getRolbyID(int id){
        RolData nRol = new RolData();
        String sql = "SELECT * FROM rol WHERE IdRol = "+ id;
        ConnectionDB dbHandler = new ConnectionDB();
        dbHandler.selectData(sql);
        ResultSet rs = dbHandler.getData();
        try {
            while (rs.next()){
                nRol.setTitulo(rs.getString(2));
                nRol.setId(rs.getInt(1));
            }
        }catch (SQLException e){
            nRol.setTitulo("No hay departamento");
        }
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


        return lista;
    }
}
