package model;

public class BitacoraController {
    public String getBitacoraByProgramador(){
        ConnectionDB dbHandler = new ConnectionDB();
        String query = "SELECT ";
        //dbHandler.getData(query);
        System.out.println(dbHandler.getData());
        return "Registro exitoso";

    }
}
