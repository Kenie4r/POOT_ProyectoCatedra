package com.example.POO_ProyectoCatedra;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ConnectionDB;

import java.io.IOException;
import java.io.Writer;

@WebServlet(name = "DeleteUserServlet",urlPatterns = "/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);
    }
    protected void doProcedure(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try(Writer writer = response.getWriter()){
            ConnectionDB dbHandler = new ConnectionDB();
            String id = request.getParameter("txtUserID");
            String query = "DELETE FROM usuario WHERE IdUsuario = " + id;
            dbHandler.setResult(query);
            dbHandler.CloseConnection();
            response.sendRedirect("/usuarios/index.jsp");
        }
    }
}
