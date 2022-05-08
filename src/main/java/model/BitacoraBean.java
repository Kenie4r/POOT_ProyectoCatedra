package model;

import java.util.ArrayList;
import java.util.Date;

public class BitacoraBean {
    //Atributos propios
    private int id;
    private int idCaso;
    private int idProgramador;
    private double porcentaje;
    //Atrbitos caso
    private String descripcionCaso;
    private String estadoCaso;
    private String fechaLimite;
    //Atributos programador
    private String nombreProgramador;
    //Atributos extras
    private ArrayList<RegistroBitacoraBean> registros;
    private BitacoraController controller;

    //Constructor
    public BitacoraBean(){
        setId(0);
        setIdCaso(0);
        setIdProgramador(0);
        setPorcentaje(0.0);
        this.controller = new BitacoraController(); //Controller
    }

    public BitacoraBean(int newId, int newIdCaso, int newIdProgram, double newPorcentaje){
        setId(newId);
        setIdCaso(newIdCaso);
        setIdProgramador(newIdProgram);
        setPorcentaje(newPorcentaje);
        this.controller = new BitacoraController(); //Controller
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

    public ArrayList<RegistroBitacoraBean> getRegistros() {
        return registros;
    }

    public void setRegistros(ArrayList<RegistroBitacoraBean> registros) {
        this.registros = registros;
    }

    public String getEstadoCaso() {
        return estadoCaso;
    }

    public void setEstadoCaso(String estadoCaso) {
        this.estadoCaso = estadoCaso;
    }

    public String getFechaLimite() {
        return fechaLimite;
    }

    public void setFechaLimite(String fechaLimite) {
        this.fechaLimite = fechaLimite;
    }

    //Metodos
    //Obtener datos de una bitacora a partir del id
    public void llenarBitacora(int id){
        BitacoraBean bitacoraAuxiliar = this.controller.getBitacora(id);
        setId(bitacoraAuxiliar.getId());
        setIdCaso(bitacoraAuxiliar.getIdCaso());
        setIdProgramador(bitacoraAuxiliar.getIdProgramador());
        setPorcentaje(bitacoraAuxiliar.getPorcentaje());
    }

    //Obtener los registros de la bitacora
    public void llenarRegistros(){
        setRegistros( this.controller.getResgitros( getId() ) );
    }

    //Devolver la cantidad de registros
    public int countRegistros(){
        return this.registros.size();
    }

    //Obtener el caso de la bitacora
    public void llenarCaso(){
        ArrayList<String> newCaso = this.controller.getCaso( getIdCaso() );
        String descripcion = newCaso.get(0);
        String estado = newCaso.get(1);
        String fechaFinal = newCaso.get(2);
        setDescripcionCaso( descripcion );
        setEstadoCaso( estado );
        setFechaLimite( fechaFinal );
    }

    //Obtener el programador de la bitacora
    public void llenarProgramador(){
        String fullname = this.controller.getProgramador( getIdProgramador() );
        setNombreProgramador( fullname );
    }

    //Delete bitacora
    public Boolean delete(){
        //Eliminamos la bitacora
        int row = this.controller.deleteBitacora( getId() );
        if( row > 0 ){
            return true;
        }else{
            return false;
        }
    }

    //Save bitacora
    public Boolean save(){
        int row = this.controller.insertBitacora( getIdProgramador(), getIdCaso() );
        if( row > 0 ){
            return true;
        }else{
            return false;
        }
    }

    //Update bitacora
    public Boolean update(){
        int row = this.controller.updateBitacora( getId(), getIdProgramador(), getIdCaso() );
        if( row > 0 ){
            return true;
        }else{
            return false;
        }
    }
}
