package com.example.POO_ProyectoCatedra;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.CasoController;

import java.io.IOException;
import java.io.Writer;
import java.net.Inet4Address;

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
            String id = request.getParameter("idSolicitud");
            System.out.println("Hoollaa");
            if(request.getParameter("opcion")=="rechazar"){
                String Admin = request.getParameter("idUsuario");
                String razon = request.getParameter("razon");
                System.out.println("Hoollaa2");

                int res = casosDB.insertRechazo(razon, Integer.parseInt(id), Integer.parseInt(Admin));
                out.write(res);
                if(res>0){
                    out.write("<div class='header'>Solicitud Rechazada</div><div class='body'>Se rechazo la solicitud de manera correcta</div><div class='btn-ver'<a href='solicitudes.jsp'>Volver</a></div>");
                }

            }else if(request.getParameter("opcion")=="aceptar"){
                out.write("aceptando...");
            }






        }
    }
}
