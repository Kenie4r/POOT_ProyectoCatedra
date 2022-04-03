package model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

public class RegistroBitacoraBean {
    //Atributos originales
    private int id;
    private String titulo;
    private String descripcion;
    private double porcentaje;
    private int idBitacora;
    private Timestamp fecha;
    //Atributos extras
    private BitacoraController controller;

    //Constructor
    public RegistroBitacoraBean(){
        setId(0);
        setTitulo(null);
        setDescripcion(null);
        setPorcentaje(0.0);
        setIdBitacora(0);
        setFecha(null);
        this.controller = new BitacoraController(); //Controller
    }

    public RegistroBitacoraBean(int newId, String newTitulo, String newDesc, double newPorcentaje, int newIdBitacora, Timestamp newFecha){
        setId(newId);
        setTitulo(newTitulo);
        setDescripcion(newDesc);
        setPorcentaje(newPorcentaje);
        setIdBitacora(newIdBitacora);
        setFecha(newFecha);
        this.controller = new BitacoraController(); //Controller
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

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

    //Metodos
    //Es valido
    public Boolean isValid(){
        Boolean valido = true;

        if(getId() == 0 || getTitulo().equals(null) || getDescripcion().equals(null) || getPorcentaje() == 0.0){
            valido = false;
        }

        return valido;
    }

    //Guardar
    public Boolean save(){
        int row = this.controller.insertRegistro( getTitulo(), getDescripcion(), getPorcentaje(), getIdBitacora() );
        if(row > 0){
            return true;
        }else{
            return false;
        }
    }

    //Actualizar progreso bitacora
    public Boolean updateProgresoBitacora(String operacion){
        int row = 0;
        if( operacion.equals("crear") ){
            row = this.controller.sumProgresoBitacora( getIdBitacora(), getPorcentaje() );
        }else if( operacion.equals("eliminar") ){
            row = this.controller.sustrProgresoBitacora( getIdBitacora(), getPorcentaje() );
        }
        if(row > 0){
            return true;
        }else{
            return false;
        }
    }

    //Obtener el maximo de porcentaje que puede tener este registro
    public double getMaxPorcentaje(){
        double max = 100;

        max = this.controller.getProgresoBitacora( getIdBitacora() );

        max = 100.00 - max;

        return max;
    }
}
