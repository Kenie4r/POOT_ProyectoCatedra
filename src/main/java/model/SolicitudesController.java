package model;

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
                ",ArchivoPDF) VALUES ("+solicitud.getIdUsuario()+",'" +
                solicitud.getDescripcion()+"','"+solicitud.getFechaInicio()+"'," +
                solicitud.getIdDepartamento()+",'" +solicitud.getPdfFile()+"')" ;
        dbHandler.setResult(query);
        System.out.println(dbHandler.getData()); }

        public ArrayList<SolicitudData> getAllSolicitudes(){
            ArrayList<SolicitudData> lista = new ArrayList<>();
            ConnectionDB dbHandler = new ConnectionDB();
            String query = "SELECT * FROM solicitudapertura" ;
            dbHandler.selectData(query);
            ResultSet rs = dbHandler.getData();
            try {
                while (rs.next()){
                    SolicitudData soli = new SolicitudData();
                    soli.setIdSolicitud(rs.getInt(1));
                    soli.setFechaInicio(rs.getString(2));
                    soli.setIdUsuario(rs.getInt(3));
                    soli.setDescripcion(rs.getString(4));
                    soli.setEstado(rs.getString(6));
                    soli.setIdDepartamento(rs.getInt(7));
                    Blob pdfFile = rs.getBlob(5);
                    InputStream pdf = pdfFile.getBinaryStream(1, pdfFile.length());
                    soli.setPdfFile(pdf);
                    lista.add(soli);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            return lista;
        }
}
