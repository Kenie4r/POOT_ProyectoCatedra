package com.example.POO_ProyectoCatedra;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ProbadorController;
import model.ProbadorData;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ReprobarCasoServlet", value = "/ReprobarCaso")
public class ReprobarCasoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);
    }

    protected void doProcedure(HttpServletRequest request, HttpServletResponse response) throws
            ServletException,IOException{
        try(PrintWriter writer =  response.getWriter()){
            //cración de observaciones
            ProbadorData probador = new ProbadorData(Integer.parseInt(request.getParameter("idCaso")),request.getParameter("fecha"));
            ProbadorController dbHandler = new ProbadorController();
            dbHandler.aprobar(probador);
            response.sendRedirect("usuarios/probador.jsp");
        }
    }
}
