<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../libs/cabeceraJSP.jsp"%>
<jsp:useBean id="registro" scope="request" class="model.RegistroBitacoraBean">
    <jsp:setProperty name="registro" property="id"></jsp:setProperty>
</jsp:useBean>
<c:set var="idB" value="${param.idBitacora}"></c:set>
<%
    int idBitacora = Integer.parseInt( request.getParameter("idBitacora") ); //Id bitacora
    Boolean estadoRegistro = false; //Estado del registro
    Boolean estadoProgreso = false; //Estado del progreso de la bitacora
    String operacion = request.getParameter("operacion"); //Operacion a hacer
    registro.llenar();

    estadoRegistro = registro.delete(); //Eliminamos el registro
    if(estadoRegistro){ //Verificamos que se elimino
        estadoProgreso = registro.updateProgresoBitacora(operacion); //Actualizamos el progreso
        if(estadoProgreso){ //Verificamos si se actualizo el progreso
%>
<c:redirect url="bitacora.jsp">
    <c:param name="idBitacora" value="${idB}"/>
    <c:param name="estado" value="4"/>
</c:redirect>
<%
        }else{ //No se actualizo el progreso
%>
<c:redirect url="bitacora.jsp">
    <c:param name="idBitacora" value="${idB}"/>
    <c:param name="estado" value="5"/>
</c:redirect>
<%
        }
    }else{ //No se elimino el registro
%>
<c:redirect url="bitacora.jsp">
    <c:param name="idBitacora" value="${idB}"/>
    <c:param name="estado" value="6"/>
</c:redirect>
<%
    }
%>