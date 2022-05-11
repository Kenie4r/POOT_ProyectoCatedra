    package model;

public class ProbadorData {
    private int idCaso, idObser, IdEvaluacion;
    private int Estado;
    private String Descripcion, Titulo, Descripcion2;
    private String fecha;
    public ProbadorData(){

    }
    public ProbadorData(int idCaso, int Estado, String Descripcion, String fecha){
        setIdCaso(idCaso);
        setEstado(Estado);
        setDescripcion(Descripcion);
        setFecha(fecha);
    }

    public ProbadorData(int idObser, String Titulo, String Descripcion2, int IdEvaluacion){
        setIdObser(idObser);
        setTitulo(Titulo);
        setDescripcion2(Descripcion2);
        setIdEvaluacion(IdEvaluacion);
    }

    public int getIdObser() {
        return idObser;
    }

    public int getIdEvaluacion() {
        return IdEvaluacion;
    }

    public String getDescripcion2() {
        return Descripcion2;
    }

    public void setDescripcion2(String descripcion2) {
        Descripcion2 = descripcion2;
    }

    public String getTitulo() {
        return Titulo;
    }

    public void setTitulo(String titulo) {
        Titulo = titulo;
    }

    public void setIdEvaluacion(int idEvaluacion) {
        IdEvaluacion = idEvaluacion;
    }

    public void setIdObser(int idObser) {
        this.idObser = idObser;
    }

    public ProbadorData(int idCaso, String fecha) {
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
