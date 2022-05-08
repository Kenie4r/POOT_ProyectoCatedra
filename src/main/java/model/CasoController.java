package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CasoController {
    //GET
    //ultimo caso
    public int UltimoCaso()
    {
        int last = 0;
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT IdCaso FROM caso ORDER BY IdCaso DESC LIMIT 1 ";
        dbHandler.selectData(query);
        ResultSet resultado = dbHandler.getData();
        try {
            while (resultado.next()){
                last = resultado.getInt(1);
            }
        }catch (SQLException e){
            System.out.println("ERROR: (CasoController.getCasos) " + e);
        }
        dbHandler.CloseConnection();
        return last;
    }


    public ArrayList<CasoBean> getCasos(){
        //Dato a retornar
        ArrayList<CasoBean> casos = new ArrayList<CasoBean>();
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT caso.IdCaso, caso.Descripcion, Estado.Titulo AS 'Estado', caso.IdJDesarrollo, CONCAT(usuario.Nombres, ' ', usuario.Apellidos) AS 'Jefe de desarrollo', caso.FechaInicio, caso.FechaLimite, caso.IdSolicitud FROM caso\n" +
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
    //INSERT
    //Caso
    public int insertCaso(CasosData caso){
        //Conectar base de datis
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "INSERT INTO caso (Descripcion, Estado, IdJDesarrollo, FechaInicio, FechaLimite, IdSolicitud)" +
                " VALUES" +
                "(?, ?, ?, ?, ?, ?)";
        //Ejecutamos la consulta
        ArrayList<String> datos = new ArrayList<String>();
        datos.add(caso.getDescripcion());
        datos.add("3");
        datos.add(String.valueOf(caso.getIdJefeDesarrollo()));
        datos.add(caso.getFechaInicio());
        datos.add(String.valueOf(caso.getIdSolicitud()));
        datos.add(caso.getFechaFinalizacion());
        dbHandler.setResultV3(query, datos);
        //Obtenemos las filas modificadas
        int row = dbHandler.getChanges();
        System.out.println("(CasoController.insertCaso) Filas afectadas: " + row);
        //Cerramos la conection
        dbHandler.CloseConnection();
        //Retornamos las filas modificadas
        return row;
    }
    //Rechazo
    public int insertRechazo(String argumento, int idSolicitud, int idUsuario){
        //Conectar base de datis
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "INSERT INTO rechazosolicitud (Argumento, IdSolicitud, IdUsuario)\n" +
                " VALUES " +
                "(?, ?, ?)";
        //Ejecutamos la consulta
        ArrayList<String> datos = new ArrayList<>();
        datos.add(argumento);
        datos.add(String.valueOf(idSolicitud));
        datos.add(String.valueOf(idUsuario));
        dbHandler.setResultV3(query, datos);
        //Obtenemos las filas modificadas
        int row = dbHandler.getChanges();
        System.out.println("(CasoController.insertRechazo) Filas afectadas: " + row);
        //Actualizamos el caso
        query = "UPDATE solicitudapertura SET Estado = 2 WHERE IdSolicitud = ?";
        ArrayList<String> datos2 = new ArrayList<String>();
        datos2.add(String.valueOf(idSolicitud));
        dbHandler.setResultV3(query, datos2);
        row = dbHandler.getChanges();
        System.out.println("(CasoController.insertRechazo) Filas afectadas: " + row);

        //Cerramos la conection
        dbHandler.CloseConnection();
        //Retornamos las filas modificadas
        return row;
    }


    //insertar bitacora
    public int insertBitacora(int caso, int programador){
        //Conectar base de datis
        ConnectionDB dbHandler = new ConnectionDB();
        //Query
        String query = "INSERT INTO bitacora(IdCaso, IdProgramador, Progreso)\n" +
                " VALUES" +
                "(?, ?, ?)";
        //Ejecutamos la consulta
        ArrayList<String> datos = new ArrayList<String>();
        datos.add(String.valueOf(caso));
        datos.add(String.valueOf(programador));
        datos.add("0.00");
        dbHandler.setResult(query);
        //Obtenemos las filas modificadas
        int row = dbHandler.getChanges();
        System.out.println("(CasoController.insertBitacora) Filas afectadas: " + row);
        //Cerramos la conection
        dbHandler.CloseConnection();
        //Retornamos las filas modificadas
        return row;
    }
}
