package com.example.POO_ProyectoCatedra;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ConnectionDB;
import model.UserData;
import model.UsersController;

import javax.swing.*;
import java.io.IOException;
import java.io.Writer;

@WebServlet(name = "UpdateUserServlet", urlPatterns = "/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcedure(request, response);
    }

    protected void doProcedure(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException{
        try(Writer out = response.getWriter()){
            UsersController userDBHandler = new UsersController();
            UserData user = new UserData(request.getParameter("txtNames"),
                    request.getParameter("txtApellidos"),"",
                    request.getParameter("txtUser"),
                    Integer.parseInt(request.getParameter("slcDepartamento")),
                    Integer.parseInt(request.getParameter("slcRol")));
            user.setIdUser(Integer.parseInt(request.getParameter("txtUserID")));

            userDBHandler.UpdateUser(user);

            response.sendRedirect("../usuarios/index.jsp");
        }
    }
}
