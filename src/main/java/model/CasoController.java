package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CasoController {
    public ArrayList<CasoBean> getCasos(){
        //Dato a retornar
        ArrayList<CasoBean> casos = new ArrayList<CasoBean>();
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT caso.IdCaso, caso.Descripcion, caso.ArchivoPDF, Estado.Titulo AS 'Estado', caso.IdJDesarrollo, CONCAT(usuario.Nombres, ' ', usuario.Apellidos) AS 'Jefe de desarrollo', caso.FechaInicio, caso.FechaLimite, caso.IdSolicitud, caso.fechaProduccion FROM caso\n" +
                "INNER JOIN Estado\n" +
                "ON caso.Estado = Estado.IdEstado\n" +
                "INNER JOIN usuario\n" +
                "ON usuario.IdUsuario = caso.IdJDesarrollo";
        dbHandler.selectData(query);
        ResultSet resultado = dbHandler.getData();
        try {
            while (resultado.next()){
                CasoBean casoNew = new CasoBean();
                casoNew.setId(resultado.getInt("IdCaso"));
                casoNew.setDescripcion(resultado.getString("Descripcion"));
                casoNew.setEstado(resultado.getString("Estado"));
                casoNew.setIdJefeDesarrollo(resultado.getInt("IdJDesarrollo"));
                casoNew.setNombreJefeDesarrollo(resultado.getString("Jefe de desarrollo"));
                casoNew.setFechaInicio(resultado.getDate("FechaInicio"));
                casoNew.setFechaFinalizacion(resultado.getDate("FechaLimite"));
                casoNew.setIdSolicitud(resultado.getInt("IdSolicitud"));
                //casoNew.setFechaProduccion(resultado.getDate("fechaProduccion"));
                casos.add(casoNew);
            }
        }catch (SQLException e){
            System.out.println("ERROR: (CasoController.getCasos) " + e);
        }
        dbHandler.CloseConnection();
        return casos;
    }
}
