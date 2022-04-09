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
    private Date fechaInicio;
    private Date fechaFinalizacion;
    private int idSolicitud;
    private Date fechaProduccion;
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

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFinalizacion() {
        return fechaFinalizacion;
    }

    public void setFechaFinalizacion(Date fechaFinalizacion) {
        this.fechaFinalizacion = fechaFinalizacion;
    }

    public int getIdSolicitud() {
        return idSolicitud;
    }

    public void setIdSolicitud(int idSolicitud) {
        this.idSolicitud = idSolicitud;
    }

    public Date getFechaProduccion() {
        return fechaProduccion;
    }

    public void setFechaProduccion(Date fechaProduccion) {
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
