package com.example.POO_ProyectoCatedra;
import jakarta.servlet.http.*;

import java.io.IOException;

public class SessionController {
    public static void isSessionStarted(HttpServletRequest request, HttpServletResponse response){
        HttpSession sesion = request.getSession();

        if(sesion.getAttribute("id") == null && sesion.getAttribute("rol") == null){
            try {
                response.sendRedirect("../index.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }
}
