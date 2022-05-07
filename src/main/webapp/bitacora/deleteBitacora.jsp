<%@ page import="model.RegistroBitacoraBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../libs/cabeceraJSP.jsp"%>
<jsp:useBean id="bitacora" scope="request" class="model.BitacoraBean"></jsp:useBean>
<%
    if(request.getParameter("idBitacora") == null){ //Si existe un id de bitacora
%>
<c:redirect url="index.jsp">
    <c:param name="estado" value="1"/>
</c:redirect>
<%
    }
    //VARIABLES GLOBALES -----------------------------------------------------------------
    int idBitacora = Integer.parseInt( request.getParameter("idBitacora") ); //Id bitacora
    String operacion = "eliminar"; //Operacion

    //BITACORA ---------------------------------------------------------------------------
    bitacora.llenarBitacora(idBitacora); //Lenamos la bitacora con los datos de la base de datos
    bitacora.llenarRegistros(); //Llenamos la bitacora con sus registros

    //VARIABLES LOCALES ------------------------------------------------------------------
    Boolean estadoBitacora = false;
    Boolean estadoRegistro = false;
    int registrosEliminados = 0;
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
    if( estadoBitacora ) { //Si se elimino la bitacora
%>
<c:redirect url="index.jsp">
    <c:param name="estado" value="2"/>
</c:redirect>
<%
    } else {
%>
<c:redirect url="index.jsp">
    <c:param name="estado" value="3"/>
</c:redirect>
<%
    }
%>