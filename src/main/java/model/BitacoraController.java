package model;

import java.math.BigDecimal;
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
        dbHandler.CloseConnection();
        return bitacoras;

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
                newBitacora.setId(resultado.getInt("IdBitacora"));
                newBitacora.setIdCaso(resultado.getInt("IdCaso"));
                newBitacora.setIdProgramador(resultado.getInt("IdProgramador"));
                newBitacora.setPorcentaje(resultado.getDouble("Progreso"));
            }
        }catch (SQLException e){
            System.out.print("ERROR: (BitacoraController.getBitacora) " + e);
        }
        dbHandler.CloseConnection();
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
                        resultado.getInt("IdBitacora")
                );
                //Lo agregamos al array list
                if(registro.isValid()){
                    registros.add(registro);
                }
            }
        }catch (SQLException e){
            System.out.print("ERROR: (BitacoraControlller.getRegistros) " + e + "\n");
        }
        dbHandler.CloseConnection();
        return registros;
    }

    //Obtener caso al que pertenece la bitacora
    public String getCaso(int idCaso){
        //Variable a devolver
        //BitacoraBean newBitacora = new BitacoraBean();
        String descripcion = "";
        //Conectar base de datos
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "SELECT * FROM caso\n" +
                "WHERE IdCaso =" + idCaso;
        //Ejecutamos la consulta
        dbHandler.selectData(query);
        //Guardamos la informacion devuelta
        ResultSet resultado = dbHandler.getData();
        //Tratamos el resultado
        try {
            while (resultado.next()){
                //newBitacora.setId(resultado.getInt("IdBitacora"));
                //newBitacora.setIdCaso(resultado.getInt("IdCaso"));
                //newBitacora.setIdProgramador(resultado.getInt("IdProgramador"));
                //newBitacora.setPorcentaje(resultado.getDouble("Progreso"));
                descripcion = resultado.getString("Descripcion");
            }
        }catch (SQLException e){
            System.out.print("ERROR: (BitacoraController.getBitacora) " + e);
        }
        dbHandler.CloseConnection();
        return descripcion;
    }

    //Obtener el programador de la bitacora
    public String getProgramador(int idProgramador){
        //Variable a devolver
        String fullname = "";
        //Conectar a la base de datos
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "SELECT * FROM usuario\n" +
                "WHERE usuario.IdUsuario = " + idProgramador;
        dbHandler.selectData(query);
        //Ejecutar la consulta
        ResultSet resultado = dbHandler.getData();
        try {
            while (resultado.next()){
                fullname = resultado.getString("Nombres") + " " + resultado.getString("Apellidos");
            }
        }catch (SQLException e){
            System.out.print("ERROR: (BitacoraController.getProgramador) " + e);
        }
        dbHandler.CloseConnection();
        return fullname;

    }

    //Nuevo registro
    public int insertRegistro(String titulo, String descripcion, double porcentaje, int idBitacora){
        //Conectar base de datis
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "INSERT INTO registrobitacora (Titulo, Descripcion, Porcentaje, IdBitacora)" +
                " VALUES" +
                "( '"+titulo+"', '"+descripcion+"', "+porcentaje+", "+idBitacora+")";
        //Ejecutamos la consulta
        dbHandler.setResult(query);
        //Obtenemos las filas modificadas
        int row = dbHandler.getChanges();
        System.out.println("(BitacoraController.insertRegistro) Filas afectadas: " + row);
        //Cerramos la conection
        dbHandler.CloseConnection();
        //Retornamos las filas modificadas
        return row;
    }

    //Sumar registro
    public int sumProgresoBitacora(int idBitacora, double porcentaje){
        //Conectar base de datis
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "UPDATE bitacora SET Progreso = (Progreso + "+porcentaje+")" +
                "WHERE IdBitacora = " + idBitacora ;
        //Ejecutamos la consulta
        dbHandler.setResult(query);
        //Obtenemos las filas modificadas
        int row = dbHandler.getChanges();
        System.out.println("(BitacoraController.sumProgresoBitacora) Filas afectadas: " + row);
        //Cerramos la conection
        dbHandler.CloseConnection();
        //Devolvemos las filas
        return row;
    }

    //Restar registro
    public int sustrProgresoBitacora(int idBitacora, double porcentaje){
        //Conectar base de datis
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "UPDATE bitacora SET Progreso = (Progreso - "+porcentaje+")" +
                "WHERE IdBitacora = " + idBitacora ;
        //Ejecutamos la consulta
        dbHandler.setResult(query);
        //Obtenemos las filas modificadas
        int row = dbHandler.getChanges();
        System.out.println("(BitacoraController.sustrProgresoBitacora) Filas afectadas: " + row);
        //Cerramos la conection
        dbHandler.CloseConnection();
        //Devolvemos las filas
        return row;
    }
}
