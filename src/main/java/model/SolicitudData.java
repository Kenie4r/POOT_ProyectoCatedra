package model;

import java.io.InputStream;
import java.security.PrivateKey;

public class SolicitudData {

    private int idSolicitud;
    private int IdDepartamento;
    private int IdUsuario;
    private String fechaInicio;
    private String Descripcion;
    private String estado  = "En espera";
    private InputStream pdfFile;

    public SolicitudData(){

    }
    public SolicitudData(int dep, int idusuario, String fehaI, String desc, InputStream pdfF){
        setDescripcion(desc);
        setIdUsuario(idusuario);
        setIdDepartamento(dep);
        setFechaInicio(fehaI);
        setPdfFile(pdfF);
    }


    public int getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(int idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public int getIdDepartamento() {
        return IdDepartamento;
    }

    public void setIdDepartamento(int idDepartamento) {
        IdDepartamento = idDepartamento;
    }

    public int getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        IdUsuario = idUsuario;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String descripcion) {
        Descripcion = descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public InputStream getPdfFile() {
        return pdfFile;
    }

    public void setPdfFile(InputStream pdfFile) {
        this.pdfFile = pdfFile;
    }
}
