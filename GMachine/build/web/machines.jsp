<%@page import="entities.Machine"%>
<%@page import="entities.Salle"%>
<%@page import="services.MachineService"%>
<%@page import="services.SalleService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="main.jsp"/>
        <form action="MachineController" method="">

            <fieldset>
                <legend>Informations de la machine</legend>
                <table border="0">
                    <tr>
                        <td>Ref:</td>
                        <td><input type="text" name="ref" value="<%= request.getAttribute("ref")%>" /></td>                    </tr>
                    <tr>
                        <td>Marque:</td>
                        <td><input type="text" name="marque" value="" /></td>
                    </tr>
                    <tr>
                        <td>Prix:</td>
                        <td><input type="text" name="prix" value="" /></td>
                    </tr>
                    <tr>
                        <td>Salle:</td>
                        <td>
                            <select name="salleId" class="box">
                                <%
                                    SalleService ss = new SalleService();
                                    for (Salle salle : ss.findAll()) {
                                %>
                                <option value="<%= salle.getId()%>"><%= salle.getCode()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Ajouter" /><input type="reset" value="Annuler" /></td>
                    </tr>
                </table>
            </fieldset>

            <fieldset>
                <legend>Liste des Machines</legend>
                <table border="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>REF</th>
                            <th>MARQUE</th>
                            <th>PRIX</th>
                            <th>SALLE</th>
                            <th>Supprimer</th>
                            <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            MachineService ms = new MachineService();
                            for (Machine m : ms.findAll()) {
                        %>
                        <tr>
                            <td><%= m.getId()%></td>
                            <td><%= m.getRef()%></td>
                            <td><%= m.getMarque()%></td>
                            <td><%= m.getPrix()%></td>
                            <td><%= m.getSalle().getCode()%></td>
                            <td><a href="MachineController?op=delete&id=<%= m.getId()%>" >Supprimer</a></td>
                            <td><a href="MachineController?op=update&id=<%= m.getId()%>&ref=<%= request.getParameter("ref")%>&marque=<%= request.getParameter("marque")%>&prix=<%= request.getParameter("prix")%>">Modifier</a></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </fieldset>
        </form>
    </body>
</html>
