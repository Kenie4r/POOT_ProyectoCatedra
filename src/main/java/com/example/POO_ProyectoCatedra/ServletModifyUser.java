package com.example.POO_ProyectoCatedra;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.UserData;
import model.UsersController;

import java.io.IOException;
import java.io.Writer;

@WebServlet(name = "ServletModifyUser", urlPatterns = "/ServletModifyUser")
public class ServletModifyUser extends HttpServlet {
    protected void doProcedure(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserData user = new UserData();
        UsersController userBD = new UsersController();

        Writer out = response.getWriter();
        if(request.getParameter("opt").equals("pass")){
            user.setIdUser(Integer.parseInt(request.getParameter("user")));
            user.setPass(request.getParameter("pass"));
            if(userBD.getCUserbyPass(user) > 0){
                out.write("continuar");
            }else{
                out.write("La actualización ha fallado, vuelve a intentarlo");
            }
        }else if(request.getParameter("opt").equals("change")){
            user.setIdUser(Integer.parseInt(request.getParameter("user")));
            user.setPass(request.getParameter("pass"));
            if(userBD.updatePass(user)){
                out.write("¡Se actualizo tu contraseña con exito!");
            }
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
