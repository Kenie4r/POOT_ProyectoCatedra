package model;

public class SolicitudesController {

    public void newSolicitud(SolicitudData solicitud){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "INSERT INTO solicitudapertura(IdUsuario" +
                ",Descripcion, FechaInicio, Estado, IdDepartamento" +
                ",ArchivoPDF) VALUES ("+solicitud.getIdUsuario()+",'" +
                solicitud.getDescripcion()+"','"+solicitud.getFechaInicio()+"','" +
                solicitud.getEstado()+ "', "+solicitud.getIdDepartamento()+"," +solicitud.getPdfFile()+")" ;
        dbHandler.setResult(query);
        System.out.println(dbHandler.getData());
        dbHandler.CloseConnection();
    }
}
