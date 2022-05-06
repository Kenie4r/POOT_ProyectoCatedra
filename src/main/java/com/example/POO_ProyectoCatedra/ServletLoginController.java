package com.example.POO_ProyectoCatedra;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.UserData;

import java.io.IOException;
import java.io.Writer;

@WebServlet(name = "ServletLoginController", urlPatterns = "/ServletLoginController")
public class ServletLoginController extends HttpServlet {
    protected void doProcedure(HttpServletRequest request, HttpServletResponse response)
        throws  ServletException, IOException{
        try(Writer out = response.getWriter()){
            UserData user = new UserData();
            request.getSession().invalidate();
            response.sendRedirect("index.jsp");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);

    }
}
