package model;

import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProbadorController {
    public ProbadorData getCasoByID(String id){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT * FROM caso WHERE idCaso = ?";
        ProbadorData probador = new ProbadorData();

        try {
            PreparedStatement statement = dbHandler.getCn().prepareStatement(query);
            statement.setInt(1, Integer.parseInt(id));
            ResultSet rs = statement.executeQuery();
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
        String query = "UPDATE caso SET fechaProduccion = ? ," +
                " Estado = 7 "+
                " WHERE IdCaso =?";
        try{
            PreparedStatement statement = dbHandler.getCn().prepareStatement(query);
            statement.setString(1, probador.getFecha());
            statement.setInt(2, probador.getIdCaso());
            statement.executeUpdate();
            System.out.println("Actualizacion hecha");
        }catch (SQLException e){
            System.out.println("Error ,razón: " + e.getMessage());
        }

        dbHandler.CloseConnection();
    }

    public void reprobar(ProbadorData probador){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "UPDATE caso SET " + " Estado = 5 " + " WHERE IdCaso =? " ;
        try{
            PreparedStatement statement = dbHandler.getCn().prepareStatement(query);
            statement.setInt(1, probador.getIdCaso());
            statement.executeUpdate();
        }catch (SQLException e){
            System.out.println("Error ,razón: " + e.getMessage());
        }

        dbHandler.CloseConnection();
    }

    public void reprobarinsert(ProbadorData probador){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "INSERT INTO observaciones(Titulo, Descripcion, IdCaso)" +
                " VALUES(?,?,?)";
        try{
            PreparedStatement statement = dbHandler.getCn().prepareStatement(query);
            statement.setString(1, probador.getTitulo());
            statement.setString(2, probador.getDescripcion2());
            statement.setInt(3, probador.getIdCaso());
            statement.executeUpdate();
            System.out.println("Registro creado exitosamente");
        }catch (SQLException e){
            System.out.println("Error, razón: " + e.getMessage());
            e.printStackTrace();
        }
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
