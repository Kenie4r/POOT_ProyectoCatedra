package com.example.POO_ProyectoCatedra;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.SolicitudData;
import model.SolicitudesController;

import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
@MultipartConfig(maxFileSize = 16177215)
@WebServlet(name = "CreateSolicitudServlet", urlPatterns = "/CreateSolicitudServlet")
public class CreateSolicitudServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);
    }
    protected void doProcedure(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{
        try(Writer writer = response.getWriter()){
            SimpleDateFormat formatSDF = new SimpleDateFormat("yyyy-MM-dd");
            Date fecha = new Date();
           /* try{
               fecha = formatSDF.parse();

           }catch (ParseException e){

               formatSDF.format(fecha);
           }*/
            InputStream file = null;
            Part filePart = request.getPart("filePDF");
            if (filePart != null) {
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());

                file = filePart.getInputStream();
            }


            SolicitudData soli = new SolicitudData(Integer.parseInt(request.getParameter("slcDept")),
                    Integer.parseInt(request.getParameter("txtUserID")),request.getParameter("txtDateTime") ,
                    request.getParameter("txtDescr"), file);
            SolicitudesController dbHandlerS = new SolicitudesController();
            dbHandlerS.newSolicitud(soli);
            response.sendRedirect("/usuarios/index.jsp");
        }
    }
}
