package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BitacoraController {
    public ArrayList<BitacoraBean> getBitacoraByProgramador(int idProgramador){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT bitacora.IdBitacora, bitacora.IdCaso, bitacora.IdProgramador, bitacora.progreso, caso.Descripcion FROM bitacora INNER JOIN caso ON caso.IdCaso = bitacora.IdCaso WHERE bitacora.IdProgramador = " + idProgramador;
        dbHandler.selectData(query);
        ResultSet resultado = dbHandler.getData();
        ArrayList<BitacoraBean> bitacoras = new ArrayList<BitacoraBean>();
        BitacoraBean bitacoraNew = new BitacoraBean();
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

    //Obtener una bitacora
    public BitacoraBean getBitacora(int idBitacora){
        //Variable a devolver
        BitacoraBean newBitacora = new BitacoraBean();
        //Conectar base de datos
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "SELECT * FROM bitacora\n" +
                "WHERE bitacora.IdBitacora = " + idBitacora;
        //Ejecutamos la consulta
        dbHandler.selectData(query);
        //Guardamos la informacion devuelta
        ResultSet resultado = dbHandler.getData();
        //Tratamos el resultado
        try {
            while (resultado.next()){
                newBitacora.setIdCaso(resultado.getInt("IdCaso"));
                newBitacora.setIdProgramador(resultado.getInt("IdProgramador"));
                newBitacora.setPorcentaje(resultado.getDouble("Progreso"));
                newBitacora.setDescripcionCaso(resultado.getString("Descripcion"));
            }
        }catch (SQLException e){
            System.out.print("ERROR:" + e);
        }
        return newBitacora;
    }

    //Obtener registros de una bitacora
    public ArrayList<RegistroBitacoraBean> getResgitros(int idBitacora){
        //Variable a devolver
        ArrayList<RegistroBitacoraBean> registros = new ArrayList<RegistroBitacoraBean>();
        //Conectar base de datos
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "SELECT * FROM registrobitacora\n" +
                "WHERE registrobitacora.IdBitacora = " + idBitacora;
        //Ejecutamos la consulta
        dbHandler.selectData(query);
        //Guardamos la informacion devuelta
        ResultSet resultado = dbHandler.getData();
        //Tratamos el resultado
        try {
            while (resultado.next()){
                //Creamos nuevo registro
                RegistroBitacoraBean registro = new RegistroBitacoraBean(
                        resultado.getInt("IdRegistro"),
                        resultado.getString("Titulo"),
                        resultado.getString("Descripcion"),
                        resultado.getDouble("Porcentaje"),
                        resultado.getInt("IdCaso")
                );
                //Lo agregamos al array list
                if(registro.isValid()){
                    registros.add(registro);
                }
            }
        }catch (SQLException e){
            System.out.print("ERROR: (BitacoraControlller.getRegistros) " + e + "\n");
        }
        return registros;
    }
}
