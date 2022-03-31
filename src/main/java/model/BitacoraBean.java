package model;

import java.util.ArrayList;

public class BitacoraBean {
    private int id;
    private int idCaso;
    private String descripcionCaso;
    private int idProgramador;
    private String nombreProgramador;
    private double porcentaje;
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

    //Metodos
    public void llenarBitacora(int id){
        BitacoraBean bitacoraAuxiliar = this.controller.getBitacora(id);
        setId(bitacoraAuxiliar.getId());
        setIdCaso(bitacoraAuxiliar.getIdCaso());
        setIdProgramador(bitacoraAuxiliar.getIdProgramador());
        setPorcentaje(bitacoraAuxiliar.getPorcentaje());
    }

    public void llenarRegistros(){
        setRegistros( this.controller.getResgitros( getId() ) );
    }

    public int countRegistros(){
        return this.registros.size();
    }
}
