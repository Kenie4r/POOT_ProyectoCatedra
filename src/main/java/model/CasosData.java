package model;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;

public class CasosData {
    private int id;
    private String Descripcion;
    private InputStream pdf;
    private String estado;
    private int idJefeDesarrollo;
    private String fechaInicio;
    private String fechaFinalizacion;
    private int idSolicitud;
    private String fechaProduccion;
    //Extra
    private String nombreJefeDesarrollo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String descripcion) {
        Descripcion = descripcion;
    }

    public InputStream getPdf() {
        return pdf;
    }

    public void setPdf(InputStream pdf) {
        this.pdf = pdf;
    }

    public int getIdJefeDesarrollo() {
        return idJefeDesarrollo;
    }

    public void setIdJefeDesarrollo(int idJefeDesarrollo) {
        this.idJefeDesarrollo = idJefeDesarrollo;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFinalizacion() {
        return fechaFinalizacion;
    }

    public void setFechaFinalizacion(String fechaFinalizacion) {
        this.fechaFinalizacion = fechaFinalizacion;
    }

    public int getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(int idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public String getFechaProduccion() {
        return fechaProduccion;
    }

    public void setFechaProduccion(String fechaProduccion) {
        this.fechaProduccion = fechaProduccion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getNombreJefeDesarrollo() {
        return nombreJefeDesarrollo;
    }

    public void setNombreJefeDesarrollo(String nombreJefeDesarrollo) {
        this.nombreJefeDesarrollo = nombreJefeDesarrollo;
    }

}
