package views;

import java.util.ArrayList;

public class CreateMenu {
    public static  String Menu(int Active, int rol){
        String[] iconos = {
           "icon-home",
           "icon-paperclip",
           "icon-file-minus","icon-inbox","icon-file","icon-tool","icon-users","icon-user","icon-log-out"
        };
        String[] titulos = {
                "Inicio" , "Solicitudes", "Administracion de solicitudes", "Casos",
                "Bitacoras", "Testeo", "Usuarios", "Mi perfil", "Salir"

        };
        String[] Links = {
                "../index.jsp", "../solicitudes/solicitudes.jsp",
                "../usuarios/probador.jsp", "../casos/index.jsp",
                "../bitacora/", "../usuarios/probador.jsp",
                "../usuarios/index.jsp", "#", "#"
        };
        String menu = " <div class='navigation'>\n" +
                "        <ul>\n";
        for(int index = 0; index<iconos.length; index++){
            if(Active == index){
                menu+= "<li class='list active'>\n" +
                        "                <a href='"+Links[index]+"'>\n" +
                        "                    <span class='icon'><span class='"+ iconos[index]+"'></span></span>\n" +
                        "                    <span class='title'>"+titulos[index]+"</span>\n" +
                        "                </a>\n" +
                        "            </li>\n";
            }else{
                menu+= "<li class='list'>\n" +
                        "              <a href='"+Links[index]+"'>\n" +
                        "                    <span class='icon'><span class='"+ iconos[index]+"'></span></span>\n" +
                        "                    <span class='title'>"+titulos[index]+"</span>\n" +
                        "                </a>\n" +
                        "            </li>\n";
            }

        }
        menu+="</ul></div>   <div class='toggle'>\n" +
                "        <span class='icon-menu open'></span>\n" +
                "        <span class='icon-x close'></span>\n" +
                "    </div>\n     <div class='bg-menu'></div>" +
                "    <script>\n" +
                "        let toggle = document.querySelector('.toggle')\n" +
                "        let nav = document.querySelector('.navigation')\n" +
                "        toggle.addEventListener('click', (e)=>{\n" +
                "            toggle.classList.toggle('active'); \n" +
                "            nav.classList.toggle('active');\n" +
                "        })\n" +
                "    </script>";
        return menu;
    }
}
