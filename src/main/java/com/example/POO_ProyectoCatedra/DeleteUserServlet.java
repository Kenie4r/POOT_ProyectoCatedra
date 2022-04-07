package com.example.POO_ProyectoCatedra;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ConnectionDB;

import java.io.IOException;
import java.io.Writer;
import java.sql.SQLException;

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
        response.setContentType("text/html");
        try(Writer writer = response.getWriter()){
            ConnectionDB dbHandler = new ConnectionDB();
            String id = request.getParameter("UserID");
            String query = "DELETE FROM usuario WHERE IdUsuario = " + id;
            try {
                dbHandler.setResultV2(query);
                dbHandler.CloseConnection();
                writer.write( "<div class='header'>Usuario Eliminado</div><div class='body'>Usuario eliminado de manera correcta</div><div class='options-not'><ul>" +
                        "<li> <a href='index.jsp' class='option-salir'>Volver al inicio</a></lI></ul></div>");
            }catch (SQLException e){
                writer.write( "<div class='header'>No se pudo eliminar el usuario</div><div class='body'>El usuario tiene más datos en la aplicacion</div><div class='options-not'><ul>" +
                        "<li> <a href='index.jsp' class='option-salir'>Volver al inicio</a></lI></ul></div>");
            }



        }
    }
}
