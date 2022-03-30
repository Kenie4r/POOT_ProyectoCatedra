<%@ page import="model.BitacoraController" %>
<jsp:useBean id="bitacora" scope="session" class="model.BitacoraController"></jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! int idProgramador = 1; %>
<%= bitacora.getBitacoraByProgramador(idProgramador) %>
<html>
<head>
    <title>Bitácoras</title>
</head>
<body>
    <section>
        <div>
            <h1>Bitácoras</h1>
        </div>
        <div>
            <table>
                <tbody>
                <!--<% //for (PersonaBean persona: personalist.getListaPersonas() ) {%>
                <tr>
                    <td><% //= //sout %></td>
                </tr>
                <%//}%>-->

                </tbody>
            </table>
        </div>
    </section>
</body>
</html>
