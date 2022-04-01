package com.example.POO_ProyectoCatedra;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.UserData;
import model.UsersController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CreateUserServlet", urlPatterns = "/CreateUser")
public class CreateUserServlet extends HttpServlet {
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
            UserData user = new UserData(request.getParameter("names"), request.getParameter("names"), request.getParameter("pass"),
                    request.getParameter("username"), Integer.parseInt(request.getParameter("dept")), Integer.parseInt(request.getParameter("rol")));
            UsersController dbHandler = new UsersController();
            dbHandler.NewUser(user);
            response.sendRedirect("usuarios/UserRegister.jsp");
        }
    }
}
