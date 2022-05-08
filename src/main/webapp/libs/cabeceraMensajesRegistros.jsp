<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int estadoOR = 0;
    String mensaje = "";

    //Traer el estado desde la url
    try {
        estadoOR = request.getParameter("estado")!=null?Integer.parseInt(request.getParameter("estado").toString()):0;
    }catch (Exception e){
        estadoOR = 0;
    }

    switch (estadoOR){
        case 1:
            mensaje = "<span class=\"icon-thumbs-up\"></span> Registro creado correctamente";
            break;
        case 2:
            mensaje = "<span class=\"icon-x-octagon\"></span> Registro creado incorrectamente";
            break;
        case 3:
            mensaje = "<span class=\"icon-x-octagon\"></span> No se pudo crear el registro";
            break;
        case 4:
            mensaje = "<span class=\"icon-thumbs-up\"></span> Se elimino el registro correctamente";
            break;
        case 5:
            mensaje = "<span class=\"icon-x-octagon\"></span> Se elimino el registro incorrectamente";
            break;
        case 6:
            mensaje = "<span class=\"icon-x-octagon\"></span> No se pudo eliminar el registro";
            break;
    }
%>
