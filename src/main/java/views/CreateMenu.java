package views;

import java.util.ArrayList;

public class CreateMenu {
    public static  String Menu(int Active, int rol){
        int[] casos = {
                1,-1,-1,-1,-1,-1,-1,1
        };
        switch (rol){
            case 6:
            for (int index = 0; index<casos.length; index++){
                casos[index] = 1;
            }
            break;
            case 7:
                casos[1]= 1;
                casos[4] = 1;
                casos[7] = 1;
                break;
            case 8:
                casos[4] = 1;
                casos[5] = 1;
                break;
            case 9:
                casos[2] = 1;
                casos[3] = 1;
                casos[4] = 1;
                casos[5] = 1;
                break;
            case 10:
                casos[5] = 1;
                break;
        }
        String[] iconos = {
           "icon-home",
           "icon-paperclip",
           "icon-file-minus","icon-inbox","icon-file","icon-tool","icon-users","icon-log-out"
        };
        String[] titulos = {
                "Inicio" , "Solicitudes", "Administracion de solicitudes", "Casos",
                "Bitacoras", "Testeo", "Usuarios", "Salir"

        };
        String[] Links = {
                "../index.jsp", "../solicitudes/solicitudes.jsp",
                "../solicitudes/solicitudes_admin.jsp", "../casos/index.jsp",
                "../bitacora/", "../usuarios/probador.jsp",
                "../usuarios/index.jsp", "/ServletLoginController"
        };
        String menu = " <div class='navigation'>\n" +
                "        <ul>\n";
        for(int index = 0; index<iconos.length; index++){
            if(casos[index]==1){
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
