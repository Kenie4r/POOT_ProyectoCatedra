package model;

public class ProbadorData {
    private int idCaso;
    private int Estado;
    private String Descripcion;

    public ProbadorData(){

    }
    public ProbadorData(int idCaso, int Estado, String Descripcion){
        setIdCaso(idCaso);
        setEstado(Estado);
        setDescripcion(Descripcion);
    }

    public int getIdCaso() {
        return idCaso;
    }

    public void setIdCaso(int idCaso) {
        this.idCaso = idCaso;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int estado) {
        Estado = estado;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String descripcion) {
        Descripcion = descripcion;
    }
}
