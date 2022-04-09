package com.example.POO_ProyectoCatedra;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ProbadorData;
import model.ProbadorController;
import model.UserData;
import model.UsersController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AprobarCasoServlet",  urlPatterns = "/AprobarCaso")
public class AprobarCasoServlet extends HttpServlet {
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
            //cración de usuario
            System.out.println("La fecha es" + request.getParameter("fecha"));
            ProbadorData probador = new ProbadorData(Integer.parseInt(request.getParameter("idCaso")),request.getParameter("fecha"));
            ProbadorController dbHandler = new ProbadorController();
            dbHandler.aprobar(probador);
            response.sendRedirect("usuarios/probador.jsp");
        }
    }
}
