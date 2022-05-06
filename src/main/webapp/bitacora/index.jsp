<%@ page import="model.BitacoraBean" %>
<%@ page import="java.util.*" %>
<%@ page import="views.CreateMenu" %>
<jsp:useBean id="bitacoraController" scope="session" class="model.BitacoraController"></jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.example.POO_ProyectoCatedra.SessionController" %>
<%@ page session="true" %>
<%
    SessionController.isSessionStarted(request,response);//controlador de session
    int rol = Integer.parseInt(request.getSession().getAttribute("rol").toString());
    int idProgramador = Integer.parseInt(request.getSession().getAttribute("id").toString());

    //DIEGO HAS A LOT OF COMMENTS IN HIS CODE, THAT'S THE REASON WHY I DON'T WORK WITH HIM
   /* //VARIABLES GLOBALES -----------------------------------------------------------------
    HttpSession sesion = request.getSession();
    int idProgramador = 0; //Id programador
    int rol = 0; //Rol
    if( sesion.getAttribute("id") != null ){
        idProgramador = Integer.parseInt(sesion.getAttribute("id").toString());
    }
    if( sesion.getAttribute("rol") != null ){
        rol = Integer.parseInt(sesion.getAttribute("rol").toString());
    }*/

    //LISTA DE BITACORAS -----------------------------------------------------------------
    ArrayList<BitacoraBean> bitacoras = new ArrayList<BitacoraBean>();

    //VARIABLES LOCALES ------------------------------------------------------------------
    int opciones = 0;
    if( rol == 9 ){
        bitacoras = bitacoraController.getBitacoras();
        opciones = 3;
    }else if( rol == 10 ){
        bitacoras = bitacoraController.getBitacoraByProgramador(idProgramador);
        opciones = 1;
    }

    for( BitacoraBean bitacoraFila:bitacoras ){
        bitacoraFila.llenarCaso();
        bitacoraFila.llenarProgramador();
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bitácoras</title>
    <link rel="stylesheet" href="../styles/icomoon/style.css">
    <link rel="stylesheet" href="../styles/bitacora.css">
    <link rel="stylesheet" type="text/css" href="../styles/users.css">
    <link rel="stylesheet" type="text/css" href="../styles/menustyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body class="div-2">
<%= CreateMenu.Menu(4,Integer.parseInt(request.getSession().getAttribute("rol").toString())) %>
    <section class="body-margin">
        <% if( rol == 9 ){ %>
        <article class="btns">
            <a href="formBitacora.jsp?operacion=nueva" class="btn btn-green"><span class="icon-plus"></span> Nueva bitácora</a>
        </article>
        <% } %>
        <div class="tables">
            <h2>Bitácoras</h2>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Caso</th>
                    <th>Programador</th>
                    <th>Progreso</th>
                    <th colspan="<%= opciones %>">Opciones</th>
                </tr>
                </thead>
                <tbody>
                <% for (BitacoraBean bitacoraFila:bitacoras ) {%>
                <tr>
                    <td><%= bitacoraFila.getId() %></td>
                    <td><%= bitacoraFila.getDescripcionCaso() %></td>
                    <td><%= bitacoraFila.getNombreProgramador() %></td>
                    <td><%= bitacoraFila.getPorcentaje() %> %</td>
                    <% if( rol == 9){ %>
                    <td class='btn'><a href="seeBitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>&operacion=ver"> <span class='icon-eye'></span>Ver</a></td>
                    <td class='btn'><a href="formBitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>&operacion=modificar"><span class='icon-edit'></span> Modificar</a></td>
                    <td class='btn'><a href="seeBitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>&operacion=eliminar"><span class='icon-trash-2'></span> Eliminar</a></td>
                    <% }else if( rol == 10){ %>
                    <td class='btn'><a href="bitacora.jsp?idBitacora=<%= bitacoraFila.getId() %>"><span class='icon-eye'></span> Ver registros</a></td>
                    <% } %>
                </tr>
                <%}%>

                </tbody>
            </table>
        </div>
    </section>
</body>
</html>
