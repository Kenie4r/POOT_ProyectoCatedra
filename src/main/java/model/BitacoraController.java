package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BitacoraController {
    public ArrayList<Bitacora> getBitacoraByProgramador(int idProgramador){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT * FROM bitacora WHERE IdProgramador = " + idProgramador;
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
                bitacoras.add(bitacoraNew);
            }
        }catch (SQLException e){
            System.out.print("ERROR:" + e);
        }
        return bitacoras;

    }
}
