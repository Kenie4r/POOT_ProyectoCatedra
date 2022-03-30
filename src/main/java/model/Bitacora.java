package model;

public class Bitacora {
    private int id;
    private int idCaso;
    private int idProgramador;
    private double porcentaje;

    //Constructor
    public Bitacora(){
        setId(0);
        setIdCaso(0);
        setIdProgramador(0);
        setPorcentaje(0.0);
    }

    public Bitacora(int newId, int newIdCaso, int newIdProgram, double newPorcentaje){
        setId(newId);
        setIdCaso(newIdCaso);
        setIdProgramador(newIdProgram);
        setPorcentaje(porcentaje);
    }

    //GET - SET

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCaso() {
        return idCaso;
    }

    public void setIdCaso(int idCaso) {
        this.idCaso = idCaso;
    }

    public int getIdProgramador() {
        return idProgramador;
    }

    public void setIdProgramador(int idProgramador) {
        this.idProgramador = idProgramador;
    }

    public double getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(double porcentaje) {
        this.porcentaje = porcentaje;
    }
}
