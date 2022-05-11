<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../libs/cabeceraJSP.jsp"%>
<jsp:useBean id="bitacora" scope="request" class="model.BitacoraBean">
    <jsp:setProperty name="bitacora" property="*"></jsp:setProperty>
</jsp:useBean>
<%
    //VARIABLES GLOBALES -----------------------------------------------------------------
    String operacion = request.getParameter("operacion");

    //VARIABLES LOCALES ------------------------------------------------------------------
    String titulo = "";
    Boolean estadoBitacora = false;
    if( operacion.equals("nueva") ){
        titulo = "Nueva bitácora";
    }else if( operacion.equals("modificar") ){
        titulo = "Bitácora N°" + bitacora.getId() + ": Modificar";
    }

    if( operacion.equals("nueva") ){
        estadoBitacora = bitacora.save();
        if(estadoBitacora){
%>
<c:redirect url="index.jsp">
    <c:param name="estado" value="4"/>
</c:redirect>
<%
        }else{
%>
<c:redirect url="index.jsp">
    <c:param name="estado" value="5"/>
</c:redirect>
<%
        }
    }else if(operacion.equals("modificar")){
        estadoBitacora = bitacora.update();
        if(estadoBitacora){
%>
<c:redirect url="index.jsp">
    <c:param name="estado" value="6"/>
</c:redirect>
<%
        }else{
%>
<c:redirect url="index.jsp">
    <c:param name="estado" value="7"/>
</c:redirect>
<%
        }
    }
%>
