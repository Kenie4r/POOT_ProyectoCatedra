package com.example.POO_ProyectoCatedra;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.CasoController;
import model.CasosData;
import model.SolicitudData;
import model.SolicitudesController;

import java.io.IOException;
import java.io.Writer;
import java.net.Inet4Address;
import java.sql.Blob;

@WebServlet(name = "SolicitudManagerServlet", urlPatterns = "/SolicitudManagerServlet")
public class SolicitudManagerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);
    }
    protected void doProcedure(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{
        response.setContentType("text/html");
        System.out.println("Hoollaa");

        try(Writer out = response.getWriter()){
            CasoController casosDB  = new CasoController();
            SolicitudesController solicitudesController = new SolicitudesController();
            String id = request.getParameter("idSolicitud");
            if(request.getParameter("opcion").equals("rechazar")){
                String Admin = request.getParameter("idUsuario");
                String razon = request.getParameter("razon");

                int res = casosDB.insertRechazo(razon, Integer.parseInt(id), Integer.parseInt(Admin));
                out.write(res);
                if(res>0){
                    out.write("<div class='header'>Solicitud Rechazada</div><div class='body'>Se rechazo la solicitud de manera correcta</div><div class='btn-ver'><a href='solicitudes.jsp'>Volver</a></div>");
                }

            }else if(request.getParameter("opcion").equals("aceptar")){
                String programmer = request.getParameter("programador");
                //primero vamos a actualizar la solicitud
                solicitudesController.newEstadoForSolicitud(Integer.parseInt(id));
                //vamos a obtener todos los datos de la solicitud para copiarlos en un caso
                SolicitudData soli = SolicitudesController.getSolibyID(Integer.parseInt(id));
                CasosData caso = new CasosData();
                caso.setDescripcion(soli.getDescripcion());
                caso.setEstado(Integer.toString(soli.getEstado()));
                caso.setIdSolicitud(soli.getIdSolicitud());
                caso.setIdJefeDesarrollo(10);
                caso.setPdf(soli.getPdfFile());
                casosDB.insertCaso(caso);
                int casoID = casosDB.UltimoCaso();
                casosDB.insertBitacora(casoID, Integer.parseInt(programmer));
                response.sendRedirect("../bitacora/index.jsp");
            }






        }
    }
}
