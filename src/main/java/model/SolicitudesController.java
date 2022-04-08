package model;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SolicitudesController {

    public void newSolicitud(SolicitudData solicitud){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "INSERT INTO solicitudapertura(IdUsuario" +
                ",Descripcion, FechaInicio, IdDepartamento" +
                ",ArchivoPDF, Estado) VALUES ("+solicitud.getIdUsuario()+",'" +
                solicitud.getDescripcion()+"','"+solicitud.getFechaInicio()+"'," +
                solicitud.getIdDepartamento()+",'" +solicitud.getPdfFile()+"', 1)" ;
        dbHandler.setResult(query);
        System.out.println(dbHandler.getData()); }

        public ArrayList<SolicitudData> getAllSolicitudes(){
            ArrayList<SolicitudData> lista = new ArrayList<>();
            ConnectionDB dbHandler = new ConnectionDB();
            String query = "SELECT * FROM solicitudapertura WHERE Estado = 1" ;
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
    public InputStream getPDFilebyID(String id){
        InputStream pdf = null;
        String sql = "SELECT ArchivoPDF FROM solicitudapertura WHERE IdSolicitud = " + id;
        ConnectionDB dbHandler = new ConnectionDB();
        dbHandler.selectData(sql);
        try {
            ResultSet rs = dbHandler.getData();
            while(rs.next()){
                byte[] pdfFile = rs.getBytes(1);
                pdf = new ByteArrayInputStream(pdfFile);
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }


        return pdf;
    }
}
