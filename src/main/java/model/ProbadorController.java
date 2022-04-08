package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProbadorController {
    public ProbadorData getCasoByID(String id){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT * FROM caso WHERE idCaso = " + id;
        dbHandler.selectData(query);
        ProbadorData probador = new ProbadorData();

        try {
            ResultSet rs = dbHandler.getData();
            while (rs.next()){
                probador.setIdCaso(rs.getInt(1));
                probador.setEstado(rs.getInt(2));
                probador.setDescripcion(rs.getString(3));
            }
        }catch (NullPointerException | SQLException e){
            System.out.println(e.getMessage());
            probador.setIdCaso(0);
            probador.setDescripcion("NO HAY CASO");
        }
        dbHandler.CloseConnection();
        return probador;
    }

    public ArrayList<ProbadorData> getAllCasos(){
        ArrayList<ProbadorData> list = new ArrayList<>();
        String sql = "SELECT idCaso, Estado, Descripcion FROM caso WHERE Estado = " + 6;
        ConnectionDB dbHandler = new ConnectionDB();
        dbHandler.selectData(sql);
        try {

            ResultSet rs = dbHandler.getData();
            while (rs.next()){
                ProbadorData probador = new ProbadorData();
                probador.setIdCaso(rs.getInt(1));
                probador.setEstado(rs.getInt(2));
                probador.setDescripcion(rs.getString(3));
                list.add(probador);
            }
        }catch ( SQLException e){
            ProbadorData probador = new ProbadorData();
            probador.setIdCaso(0);
            probador.setDescripcion("NO HAY CASO");
            list.add(probador);
        }
        dbHandler.CloseConnection();

        return list;
    }
}
