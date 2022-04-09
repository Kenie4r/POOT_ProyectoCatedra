package model;

import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProbadorController {
    public ProbadorData getCasoByID(String id){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT * FROM caso WHERE idCaso = " + Integer.parseInt(id);
        dbHandler.selectData(query);
        ProbadorData probador = new ProbadorData();

        try {
            ResultSet rs = dbHandler.getData();
            while (rs.next()){
                probador.setIdCaso(rs.getInt(1));
                probador.setEstado(rs.getInt("Estado"));
                probador.setDescripcion(rs.getString("Descripcion"));
                probador.setFecha(rs.getString("fechaProduccion"));
            }
        }catch (NullPointerException | SQLException e){
            System.out.println(e.getMessage());
            probador.setIdCaso(0);
            probador.setDescripcion("NO HAY CASO");
        }
        dbHandler.CloseConnection();
        return probador;
    }

    public void aprobar(ProbadorData probador){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "UPDATE caso SET fechaProduccion ='" + probador.getFecha() + "' ," +
                " Estado =" + 7 +
                " WHERE IdCaso =" + probador.getIdCaso();
        dbHandler.setResult(query);
        System.out.println(dbHandler.getData());
        dbHandler.CloseConnection();
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
