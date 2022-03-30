package model;

public class Bitacora {
    private int id;
    private int idCaso;
    private String descripcionCaso;
    private int idProgramador;
    private String nombreProgramador;
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

    public String getNombreProgramador() {
        return nombreProgramador;
    }

    public void setNombreProgramador(String nombreProgramador) {
        this.nombreProgramador = nombreProgramador;
    }

    public String getDescripcionCaso() {
        return descripcionCaso;
    }

    public void setDescripcionCaso(String descripcionCaso) {
        this.descripcionCaso = descripcionCaso;
    }
}
