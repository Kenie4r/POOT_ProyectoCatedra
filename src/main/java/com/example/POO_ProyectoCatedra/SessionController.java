package com.example.POO_ProyectoCatedra;
import jakarta.servlet.http.*;

import java.io.IOException;

public class SessionController {
    public static boolean isSessionStarted(HttpSession session, HttpServletResponse response){
        System.out.println(session.getAttribute("id"));
        System.out.println(session.getAttribute("rol"));

        if(session.getAttribute("id")==null || session.getAttribute("rol")==null){
            System.out.println("si entro");
            return true;
        }
        return false;
    }

    public static String existsSession(HttpSession sesion){
        String etiqueta = "";
        if(sesion.getAttribute("id") == null || sesion.getAttribute("rol") == null){
            etiqueta = "<c:redirect url=\"../index.jsp\">\n" +
                    " </c:redirect>";
        }

        return etiqueta;
    }
}
