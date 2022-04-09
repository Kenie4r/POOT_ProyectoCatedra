package model;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BitacoraController {
    //SELECT
    //Obtener todas las bitacoras
    public ArrayList<BitacoraBean> getBitacoras(){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT bitacora.IdBitacora, bitacora.IdCaso, bitacora.IdProgramador, bitacora.Progreso, caso.Descripcion FROM bitacora INNER JOIN caso ON caso.IdCaso = bitacora.IdCaso";
        dbHandler.selectData(query);
        ResultSet resultado = dbHandler.getData();
        ArrayList<BitacoraBean> bitacoras = new ArrayList<BitacoraBean>();
        try {
            while (resultado.next()){
                BitacoraBean bitacoraNew = new BitacoraBean();
                bitacoraNew.setId(resultado.getInt("IdBitacora"));
                bitacoraNew.setIdCaso(resultado.getInt("IdCaso"));
                bitacoraNew.setIdProgramador(resultado.getInt("IdProgramador"));
                bitacoraNew.setPorcentaje(resultado.getDouble("Progreso"));
                bitacoraNew.setDescripcionCaso(resultado.getString("Descripcion"));
                bitacoras.add(bitacoraNew);
            }
        }catch (SQLException e){
            System.out.println("ERROR: (BitacoraController.getBitacoras) " + e);
        }
        dbHandler.CloseConnection();
        return bitacoras;
    }

    //Get bitacora de un programador
    public ArrayList<BitacoraBean> getBitacoraByProgramador(int idProgramador){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT bitacora.IdBitacora, bitacora.IdCaso, bitacora.IdProgramador, bitacora.progreso, caso.Descripcion FROM bitacora INNER JOIN caso ON caso.IdCaso = bitacora.IdCaso WHERE bitacora.IdProgramador = " + idProgramador;
        dbHandler.selectData(query);
        ResultSet resultado = dbHandler.getData();
        ArrayList<BitacoraBean> bitacoras = new ArrayList<BitacoraBean>();
        try {
            while (resultado.next()){
                BitacoraBean bitacoraNew = new BitacoraBean();
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
                        resultado.getInt("IdBitacora"),
                        resultado.getTimestamp("Fecha")
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

    //Obtener un registro
    public RegistroBitacoraBean getResgitro(int idRegistro){
        //Variable a devolver
        RegistroBitacoraBean registro = new RegistroBitacoraBean();
        //Conectar base de datos
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "SELECT * FROM registrobitacora\n" +
                "WHERE registrobitacora.IdRegistro = " + idRegistro;
        //Ejecutamos la consulta
        dbHandler.selectData(query);
        //Guardamos la informacion devuelta
        ResultSet resultado = dbHandler.getData();
        //Tratamos el resultado
        try {
            while (resultado.next()){
                //Creamos nuevo registro
                registro = new RegistroBitacoraBean(
                        resultado.getInt("IdRegistro"),
                        resultado.getString("Titulo"),
                        resultado.getString("Descripcion"),
                        resultado.getDouble("Porcentaje"),
                        resultado.getInt("IdBitacora"),
                        resultado.getTimestamp("Fecha")
                );
            }
        }catch (SQLException e){
            System.out.print("ERROR: (BitacoraControlller.getRegistro) " + e + "\n");
        }
        dbHandler.CloseConnection();
        return registro;
    }

    //Obtener caso al que pertenece la bitacora
    public ArrayList<String> getCaso(int idCaso){
        //Variable a devolver
        ArrayList<String> caso = new ArrayList<String>();
        String descripcion = "";
        //Conectar base de datos
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "SELECT caso.Descripcion, Estado.Titulo AS Estado FROM caso INNER JOIN Estado ON Estado.IdEstado = caso.Estado\n" +
                "WHERE IdCaso = " + idCaso;
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
                caso.add( resultado.getString("Descripcion") );
                caso.add( resultado.getString("Estado") );
            }
        }catch (SQLException e){
            System.out.print("ERROR: (BitacoraController.getCaso) " + e);
        }
        dbHandler.CloseConnection();
        return caso;
    }

    //Obtener los casos
    public ArrayList<ArrayList<String>> getCasos(){
        //Variable a devolver
        ArrayList<ArrayList<String>> caso = new ArrayList<ArrayList<String>>();
        String descripcion = "";
        //Conectar base de datos
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "SELECT caso.IdCaso ,caso.Descripcion, Estado.Titulo AS Estado FROM caso INNER JOIN Estado ON Estado.IdEstado = caso.Estado";
        //Ejecutamos la consulta
        dbHandler.selectData(query);
        //Guardamos la informacion devuelta
        ResultSet resultado = dbHandler.getData();
        //Tratamos el resultado
        try {
            while (resultado.next()){
                ArrayList<String> fila = new ArrayList<String>();
                fila.add(resultado.getString("IdCaso"));
                fila.add(resultado.getString("Descripcion"));
                fila.add(resultado.getString("Estado"));
                caso.add( fila );
            }
        }catch (SQLException e){
            System.out.print("ERROR: (BitacoraController.getCasos) " + e);
        }
        dbHandler.CloseConnection();
        return caso;
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

    //Obtener los programadores
    public ArrayList<ArrayList<String>> getProgramadores(){
        //Variable a devolver
        ArrayList<ArrayList<String>> programadores = new ArrayList<ArrayList<String>>();
        String descripcion = "";
        //Conectar base de datos
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "SELECT * FROM usuario\n" +
                "WHERE Rol = 10";
        //Ejecutamos la consulta
        dbHandler.selectData(query);
        //Guardamos la informacion devuelta
        ResultSet resultado = dbHandler.getData();
        //Tratamos el resultado
        try {
            while (resultado.next()){
                ArrayList<String> fila = new ArrayList<String>();
                fila.add(resultado.getString("IdUsuario"));
                fila.add(resultado.getString("Nombres") + " " + resultado.getString("Apellidos"));
                //fila.add(resultado.getString("Estado"));
                programadores.add( fila );
            }
        }catch (SQLException e){
            System.out.print("ERROR: (BitacoraController.getProgramadores) " + e);
        }
        dbHandler.CloseConnection();
        return programadores;
    }

    //Obtener el progreso de la bitacora
    public double getProgresoBitacora(int idBitacora){
        //Variable a devolver
        double max = 100;
        //Conectar a la base de datos
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "SELECT Progreso FROM bitacora\n" +
                "WHERE IdBitacora = " + idBitacora;
        dbHandler.selectData(query);
        //Ejecutar la consulta
        ResultSet resultado = dbHandler.getData();
        try {
            while (resultado.next()){
                max = resultado.getDouble("Progreso");
            }
        }catch (SQLException e){
            System.out.print("ERROR: (BitacoraController.getProgresoBitacora) " + e);
        }
        dbHandler.CloseConnection();
        return max;

    }

    //INSERT
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

    //Nueva bitacora
    public int insertBitacora(int idProgramador, int idCaso){
        //Conectar base de datis
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "INSERT INTO bitacora (IdCaso, IdProgramador, Progreso)" +
                " VALUES" +
                "( " + idCaso + ", " + idProgramador + ", 0.0 )";
        //Ejecutamos la consulta
        dbHandler.setResult(query);
        //Obtenemos las filas modificadas
        int row = dbHandler.getChanges();
        System.out.println("(BitacoraController.insertBitacora) Filas afectadas: " + row);
        //Cerramos la conection
        dbHandler.CloseConnection();
        //Retornamos las filas modificadas
        return row;
    }

    //UPDATE
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

    //Modificar bitacora
    public int updateBitacora(int idBitacora, int idProgramador, int idCaso){
        //Conectar base de datis
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "UPDATE bitacora SET " +
                "IdCaso = " + idCaso + ", " +
                "IdProgramador = " + idProgramador +
                "\nWHERE IdBitacora = " + idBitacora;
        //Ejecutamos la consulta
        dbHandler.setResult(query);
        //Obtenemos las filas modificadas
        int row = dbHandler.getChanges();
        System.out.println("(BitacoraController.insertBitacora) Filas afectadas: " + row);
        //Cerramos la conection
        dbHandler.CloseConnection();
        //Retornamos las filas modificadas
        return row;
    }

    //DELETE
    //Eliminar registro
    public int deleteRegistro(int idRegistro){
        //Conectar base de datis
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "DELETE FROM registrobitacora\n" +
                "WHERE IdRegistro = " + idRegistro;
        //Ejecutamos la consulta
        dbHandler.setResult(query);
        //Obtenemos las filas modificadas
        int row = dbHandler.getChanges();
        System.out.println("(BitacoraController.deleteRegistro) Filas afectadas: " + row);
        //Cerramos la conection
        dbHandler.CloseConnection();
        //Retornamos las filas modificadas
        return row;
    }

    //Eliminar bitacora
    public int deleteBitacora(int idBitacora){
        //Conectar base de datis
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "DELETE FROM bitacora\n" +
                "WHERE IdBitacora = " + idBitacora;
        //Ejecutamos la consulta
        dbHandler.setResult(query);
        //Obtenemos las filas modificadas
        int row = dbHandler.getChanges();
        System.out.println("(BitacoraController.deleteBitacora) Filas afectadas: " + row);
        //Cerramos la conection
        dbHandler.CloseConnection();
        //Retornamos las filas modificadas
        return row;
    }
}
