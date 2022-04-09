package com.example.POO_ProyectoCatedra;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.SolicitudesController;

import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "ServletPDF", urlPatterns = "/ServletPDF")
public class ServletPDF extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);
    }

    protected void doProcedure(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{
        response.setContentType("Application/pdf");
        String id = request.getParameter("idPDF");
        SolicitudesController dbHandler = new SolicitudesController();
        InputStream PDF = dbHandler.getPDFilebyID(id);

        int  pdfL = PDF.available();
        byte[] pdfdata = new byte[pdfL];
        PDF.read(pdfdata, 0, pdfL);
        response.getOutputStream().write(pdfdata);
        PDF.close();

    }
}
