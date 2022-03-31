package model;

public class RegistroBitacoraBean {
    private int id;
    private String titulo;
    private String descripcion;
    private double porcentaje;
    private int idBitacora;

    //Constructor
    public RegistroBitacoraBean(){
        setId(0);
        setTitulo(null);
        setDescripcion(null);
        setPorcentaje(0.0);
        setIdBitacora(0);
    }

    public RegistroBitacoraBean(int newId, String newTitulo, String newDesc, double newPorcentaje, int newIdBitacora){
        setId(newId);
        setTitulo(newTitulo);
        setDescripcion(newDesc);
        setPorcentaje(newPorcentaje);
        setIdBitacora(newIdBitacora);
    }

    //GET - SET
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(double porcentaje) {
        this.porcentaje = porcentaje;
    }

    public int getIdBitacora() {
        return idBitacora;
    }

    public void setIdBitacora(int idBitacora) {
        this.idBitacora = idBitacora;
    }

    //Metodos
    public Boolean isValid(){
        Boolean valido = true;

        if(getId() == 0 || getTitulo().equals(null) || getDescripcion().equals(null) || getPorcentaje() == 0.0){
            valido = false;
        }

        return valido;
    }
}
