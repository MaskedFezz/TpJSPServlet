<%-- 
    Document   : recherche
    Created on : 26 oct. 2023, 20:04:48
    Author     : HP
--%>
<%@page import="entities.Salle"%>
<%@page import="services.SalleService"%>
<%@page import="entities.Machine"%>
<%@page import="services.MachineService"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search Machines by Salle</title>
    <link href="CSS/styles.css" rel="stylesheet" type="text/css"/>
</head>
<body>
         <jsp:include page="main.jsp"/>
    <form action="RechercheController" method="post">
        <fieldset>
            <legend>Recherche Machines par Salle</legend>
            <label for="salleId">Select a Salle:</label>
            <select name="salleId" class="box">
                                <%
                                    SalleService ss = new SalleService();
                                    Salle s =null;
                                    for (Salle salle : ss.findAll()) {                                  
                                %>
                                <option value="<%=salle.getId()%>"><%= salle.getCode()%></option>
                                <%
                                    }
                                %>
                            </select>
            <input type="submit" value="Search">
        </fieldset>
    </form>
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
int id = -1;
if(request.getParameter("salleId")!=null){
id=Integer.parseInt(request.getParameter("salleId"));
for (Machine m : ms.findAll()) {
    if (m.getSalle().getId() == id) {
%>

                        <tr>
                            <td><%= m.getId()%></td>
                            <td><%= m.getRef()%></td>
                            <td><%= m.getMarque()%></td>
                            <td><%= m.getPrix()%></td>
                            <td><%= m.getSalle().getCode()%></td>
                            <td><a href="MachineController?op=delete&id=<%= m.getId()%>">Supprimer</a></td>
                            <td><a href="MachineController?op=update&id=<%= m.getId()%>">Modifier</a></td>
                        </tr>
                        <%
                        System.out.println("Machine matched with selected Salle ID.");
                            }
                                }
}

                        %>
                    </tbody>
                </table>
            </fieldset>
</body>
</html>

