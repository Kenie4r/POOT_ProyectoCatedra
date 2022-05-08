<%@ include file="../libs/cabeceraJSP.jsp"%> <!-- Existe una session -->
<jsp:useBean id="bitacora" scope="session" class="model.BitacoraBean"></jsp:useBean>
<%
    if(request.getParameter("idBitacora") == null){ //Si existe un id de bitacora
%>
<c:redirect url="index.jsp">
</c:redirect>
<%
    }

    //Variables locales ------------------------------------------------------------------------------
    //Permisos de bitacora
    String operacion = request.getParameter("operacion")!=null?request.getParameter("operacion"):"trabajar"; //Operacion
    int permisoBitacora = 0;
    if( operacion.equals("ver")){
        permisoBitacora = 1;
    }else if(operacion.equals("eliminar")){
        permisoBitacora = 2;
    }else if(operacion.equals("trabajar") && rol == 10){
        permisoBitacora = 3;
    }else{
        permisoBitacora = 1;
    }

    //Permisos de registro
    int idBitacora = Integer.parseInt(request.getParameter("idBitacora")); //Obtenemos el id de la bitacora
    Boolean permisosRegistros = false; //Hay permisos segun los estados del caso
    //BITACORA
    bitacora.llenarBitacora(idBitacora); //Lenamos la bitacora con los datos de la base de datos
    bitacora.llenarRegistros(); //Llenamos la bitacora con sus registros
    bitacora.llenarCaso(); //Llenamos el caso de la bitacora
    bitacora.llenarProgramador(); //Llenamos el programador de la bitacora

    if(bitacora.getEstadoCaso().equals("En desarrollo") || bitacora.getEstadoCaso().equals("Devuelto con observaciones")){
        permisosRegistros = true;
    }
%>
