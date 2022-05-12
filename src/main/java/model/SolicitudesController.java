package model;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SolicitudesController {

    public void newSolicitud(SolicitudData solicitud){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "INSERT INTO solicitudapertura(IdUsuario" +
                ",Descripcion, FechaInicio, IdDepartamento" +
                ",ArchivoPDF, Estado) VALUES (?,?,?,?,?, 1)" ;
        try{
            PreparedStatement statement = dbHandler.getCn().prepareStatement(query);
            statement.setInt(1, solicitud.getIdUsuario());
            statement.setString(2, solicitud.getDescripcion());
            statement.setString(3, solicitud.getFechaInicio());
            statement.setInt(4, solicitud.getIdDepartamento());
            statement.setAsciiStream(5, solicitud.getPdfFile());
            statement.executeUpdate();
            System.out.println("Se ha creado la solicitud");
        }catch (SQLException e){
            System.out.println("Error, razón: " + e.getMessage());
        }
    }

        public ArrayList<SolicitudData> getAllSolicitudes(){
            ArrayList<SolicitudData> lista = new ArrayList<>();
            ConnectionDB dbHandler = new ConnectionDB();
            String query = "SELECT * FROM solicitudapertura ORDER BY Estado ASC" ;
            dbHandler.selectData(query);
            ResultSet rs = dbHandler.getData();
            try {
                while (rs.next()){
                    SolicitudData soli = new SolicitudData();
                    soli.setIdSolicitud(rs.getInt(1));
                    soli.setFechaInicio(rs.getString(2));
                    soli.setIdUsuario(rs.getInt(3));
                    soli.setDescripcion(rs.getString(4));
                    soli.setEstado(rs.getInt(6));
                    soli.setIdDepartamento(rs.getInt(7));
                    lista.add(soli);
                }
            } catch (SQLException throwables) {
                System.out.println(throwables.getMessage());
            }
            return lista;
        }
    public ArrayList<SolicitudData> getAllSolicitudesbyDept(int id){
        ArrayList<SolicitudData> lista = new ArrayList<>();
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT * FROM solicitudapertura WHERE IdDepartamento = ? ORDER BY Estado ASC" ;
        try {
            PreparedStatement statement = dbHandler.getCn().prepareStatement(query);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            while (rs.next()){
                SolicitudData soli = new SolicitudData();
                soli.setIdSolicitud(rs.getInt(1));
                soli.setFechaInicio(rs.getString(2));
                soli.setIdUsuario(rs.getInt(3));
                soli.setDescripcion(rs.getString(4));
                soli.setEstado(rs.getInt(6));
                soli.setIdDepartamento(rs.getInt(7));
                lista.add(soli);
            }
        } catch (SQLException throwables) {
            System.out.println(throwables.getMessage());
        }
        return lista;
    }
    public InputStream getPDFilebyID(String id){
        InputStream pdf = null;
        String sql = "SELECT ArchivoPDF FROM solicitudapertura WHERE IdSolicitud = ?";
        ConnectionDB dbHandler = new ConnectionDB();
        try {
            PreparedStatement statement = dbHandler.getCn().prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(id));
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                byte[] pdfFile = rs.getBytes(1);
                pdf = new ByteArrayInputStream(pdfFile);
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }


        return pdf;
    }
    public EstadoData   getEstadoByID(int id){
        EstadoData estadoData = new EstadoData();
        String sql = "SELECT * FROM Estado WHERE IdEstado= ?";
        ConnectionDB dbHandler = new ConnectionDB();
        try {
            PreparedStatement statement = dbHandler.getCn().prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                estadoData.setName(rs.getString(2));
                estadoData.setId(rs.getInt(1));
            }
        }catch (SQLException e){
            System.out.println("Error, razón: " + e.getMessage());
        }
        return estadoData;
    }

    public static SolicitudData getSolibyID(int id){
        SolicitudData solicitud = new SolicitudData();
        String sql = "SELECT * FROM solicitudapertura WHERE IdSolicitud = ?";
        ConnectionDB dbHandler = new ConnectionDB();
        try {
            PreparedStatement statement = dbHandler.getCn().prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                solicitud.setIdSolicitud(rs.getInt(1));
                solicitud.setFechaInicio(rs.getString(2));
                solicitud.setIdUsuario(rs.getInt(3));
                solicitud.setDescripcion(rs.getString(4));
                solicitud.setEstado(rs.getInt(6));
                solicitud.setIdDepartamento(rs.getInt(7));
            }
        }catch (SQLException e) {
            System.out.println("Error, razón: " + e.getMessage());
        }
        return solicitud;
    }


    public void newEstadoForSolicitud(int solID) {
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "UPDATE solicitudapertura SET Estado = 3 WHERE IdSolicitud = ?";
        try {
            PreparedStatement statement = dbHandler.getCn().prepareStatement(query);
            statement.setInt(1, solID);
            statement.executeUpdate();
            System.out.println("Se actualizo #" + statement.getUpdateCount() + " columnas.");
        } catch (SQLException e) {
            System.out.println("Error, razón: " + e.getMessage());
        }
    }
    public static String getRazonSolicitud(SolicitudData sol){
        ConnectionDB dbHandler = new ConnectionDB();
        String razon = "No hay razón de rechazo, puede haber un error, por favor contacte con un Jefe de desarrollo";
        String query = "SELECT Argumento FROM rechazosolicitud WHERE IdSolicitud = ?";
        try {
            PreparedStatement statement = dbHandler.getCn().prepareStatement(query);
            statement.setInt(1, sol.getIdSolicitud());
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                razon = rs.getString(1);
            }

        } catch (SQLException e) {
            System.out.println("Error, razón: " + e.getMessage());
        }
        return razon;
    }
}
