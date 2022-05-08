<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //Variables locales
    int estado = 0;
    String mensaje = "";

    //Traer el estado desde la url
    try {
        estado = request.getParameter("estado")!=null?Integer.parseInt(request.getParameter("estado").toString()):0;
    }catch (Exception e){
        estado = 0;
    }

    //Crear un mensaje segun el estado
    switch (estado){
        case 1:
            mensaje = "<span class=\"icon-x-octagon\"></span> No se envio toda la información de la bitácora";
            break;
        case 2:
            mensaje = "<span class=\"icon-thumbs-up\"></span> Bitácora eliminada correctamente";
            break;
        case 3:
            mensaje = "<span class=\"icon-x-octagon\"></span> La bitácora no se pudo eliminar";
            break;
        case 4:
            mensaje = "<span class=\"icon-thumbs-up\"></span> Bitácora creada correctamente";
            break;
        case 5:
            mensaje = "<span class=\"icon-x-octagon\"></span> No se pudo crear la bitácora";
            break;
        case 6:
            mensaje = "<span class=\"icon-thumbs-up\"></span> Bitácora actualizada correctamente";
            break;
        case 7:
            mensaje = "<span class=\"icon-x-octagon\"></span> No se pudo actualizar la bitácora";
            break;
    }
%>
