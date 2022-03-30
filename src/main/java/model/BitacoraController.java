package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BitacoraController {
    public ArrayList<Bitacora> getBitacoraByProgramador(int idProgramador){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT bitacora.IdBitacora, bitacora.IdCaso, bitacora.IdProgramador, bitacora.progreso, caso.Descripcion FROM bitacora INNER JOIN caso ON caso.IdCaso = bitacora.IdCaso WHERE bitacora.IdProgramador = " + idProgramador;
        dbHandler.selectData(query);
        ResultSet resultado = dbHandler.getData();
        ArrayList<Bitacora> bitacoras = new ArrayList<Bitacora>();
        Bitacora bitacoraNew = new Bitacora();
        try {
            while (resultado.next()){
                bitacoraNew.setId(resultado.getInt("IdBitacora"));
                bitacoraNew.setIdCaso(resultado.getInt("IdCaso"));
                bitacoraNew.setIdProgramador(resultado.getInt("IdProgramador"));
                bitacoraNew.setPorcentaje(resultado.getDouble("Progreso"));
                bitacoraNew.setDescripcionCaso(resultado.getString("Descripcion"));
                bitacoras.add(bitacoraNew);
            }
        }catch (SQLException e){
            System.out.print("ERROR:" + e);
        }
        return bitacoras;

    }

    public String getProgramadorByBitacora(int idProgramador){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT * FROM usuario\n" +
                "WHERE usuario.IdUsuario = " + idProgramador;
        dbHandler.selectData(query);
        ResultSet resultado = dbHandler.getData();
        String fullname = "";
        try {
            while (resultado.next()){
                fullname = resultado.getString("Nombres") + " " + resultado.getString("Apellidos");
            }
        }catch (SQLException e){
            System.out.print("ERROR:" + e);
        }
        return fullname;

    }
}
