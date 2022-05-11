<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../libs/cabeceraJSP.jsp"%>
<jsp:useBean id="registro" scope="request" class="model.RegistroBitacoraBean">
    <jsp:setProperty name="registro" property="titulo" param="titulo"></jsp:setProperty>
    <jsp:setProperty name="registro" property="descripcion" param="descripcion"></jsp:setProperty>
    <jsp:setProperty name="registro" property="porcentaje" param="porcentaje"></jsp:setProperty>
    <jsp:setProperty name="registro" property="idBitacora" param="idBitacora"></jsp:setProperty>
</jsp:useBean>
<c:set var="idB" value="${param.idBitacora}"></c:set>
<%
    int idBitacora = Integer.parseInt( request.getParameter("idBitacora") ); //Id bitacora
    Boolean estadoRegistro = false; //Estado del registro
    Boolean estadoProgreso = false; //Estado del registro
    String operacion = request.getParameter("operacion"); //Operacion a hacer
    estadoRegistro = registro.save(); //Guardamos el registro
    if(estadoRegistro){ //Verificamos que se creo
        estadoProgreso = registro.updateProgresoBitacora(operacion); //Actualizamos el progreso
        if(estadoProgreso){ //Verificamos si se actualizo
%>
<c:redirect url="bitacora.jsp">
    <c:param name="idBitacora" value="${idB}"/>
    <c:param name="estado" value="1"/>
</c:redirect>
<%
        }else{ //No se actualizo el progreso
%>
<c:redirect url="bitacora.jsp">
    <c:param name="idBitacora" value="${idB}"/>
    <c:param name="estado" value="2"/>
</c:redirect>
<%
        }
    }else{ //No se creo el registro
%>
<c:redirect url="bitacora.jsp">
    <c:param name="idBitacora" value="${idB}"/>
    <c:param name="estado" value="3"/>
</c:redirect>
<%
    }
%>
