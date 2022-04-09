package model;

public class ProbadorData {
    private int idCaso;
    private int Estado;
    private String Descripcion;
    private String fecha;

    public ProbadorData(){

    }
    public ProbadorData(int idCaso, int Estado, String Descripcion, String fecha){
        setIdCaso(idCaso);
        setEstado(Estado);
        setDescripcion(Descripcion);
        setFecha(fecha);
    }

    public ProbadorData(int idCaso,String fecha) {
        setIdCaso(idCaso);
        setFecha(fecha);
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

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
}
