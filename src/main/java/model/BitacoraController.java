package model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BitacoraController {
    public String getBitacoraByProgramador(int idProgramador){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT * FROM bitacora WHERE IdProgramador = " + idProgramador;
        dbHandler.selectData(query);
        ResultSet resultado = dbHandler.getData();
        try {
            while (resultado.next()){
                System.out.printf(resultado.getInt("IdBitacora"));
            }
        }catch (SQLException e){
            System.out.printf("ERROR:" + e);
        }
        return "Registro exitoso";

    }
}
