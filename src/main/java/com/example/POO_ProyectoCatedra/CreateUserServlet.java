package com.example.POO_ProyectoCatedra;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.UserData;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CreateUserServlet", value = "/CreateUserServlet")
public class CreateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doProcedure(HttpServletRequest request, HttpServletResponse response) throws
            ServletException,IOException{
        try(PrintWriter writer =  response.getWriter()){
            //cración de usuario
            UserData user = new UserData();

        }
    }
}
