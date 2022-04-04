<%@ page import="model.RegistroBitacoraBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bitacora" scope="request" class="model.BitacoraBean"></jsp:useBean>
<%
    //VARIABLES GLOBALES -----------------------------------------------------------------
    int idProgramador = 1; //Id programador
    int idBitacora = Integer.parseInt( request.getParameter("idBitacora") ); //Id bitacora
    String operacion = "eliminar"; //Operacion
    String rol = "Jefe de desarrollo"; //Solo jefes pueden eliminar una bitacora

    //BITACORA ---------------------------------------------------------------------------
    bitacora.llenarBitacora(idBitacora); //Lenamos la bitacora con los datos de la base de datos
    bitacora.llenarRegistros(); //Llenamos la bitacora con sus registros

    //VARIABLES LOCALES ------------------------------------------------------------------
    Boolean estadoBitacora = false;
    Boolean estadoRegistro = false;
    int registrosEliminados = 0;
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar bitacora</title>
    <link rel="stylesheet" href="../styles/icomoon/style.css">
    <link rel="stylesheet" href="../styles/bitacora.css">
</head>
<body>
<section>
    <article>
        <h1>Eliminar Bitacora</h1>
    </article>
    <%
        //Eliminamos los registros
        for(RegistroBitacoraBean registro:bitacora.getRegistros()){
            estadoRegistro = registro.delete();
            if(estadoRegistro){
                registro.updateProgresoBitacora(operacion);
                registrosEliminados++;
            }
        }
        //Eliminamos la bitacora
        estadoBitacora =  bitacora.delete();
        if( estadoBitacora ){ //Si se elimino la bitacora
    %>
    <div>
        <h4 class="title-success"><span class="icon-thumbs-up"></span> Bitácora eliminada correctamente.</h4>
    </div>
    <%
        }else{
    %>
    <div>
        <h4 class="title-unsuccess"><span class="icon-x-octagon"></span> ERROR: La bitácora no se pudo eliminar.</h4>
    </div>
    <%
        }
    %>
    <div>
        <h4 class="title-success"><%= registrosEliminados %> registros eliminados de <%= bitacora.getRegistros().size() %>.</h4>
    </div>
    <div class="contenedor-center">
        <a href="index.jsp" class="btn btn-azul"><span class="icon-arrow-left"></span> Regresar</a>
    </div>
</section>
<div>
</div>
</body>
</html>
