/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Salle;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.SalleService;

/**
 *
 * @author HP
 */
@WebServlet(name = "SalleController", urlPatterns = {"/SalleController"})
public class SalleController extends HttpServlet {

    SalleService salleService = new SalleService();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("op") != null) {
            if (request.getParameter("op").equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                salleService.delete(salleService.findById(id));
            } else if (request.getParameter("op").equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String code = request.getParameter("code");
                Salle salleUpdate = new Salle();
                salleUpdate.setId(id);
                salleUpdate.setCode(code);
  

                salleService.update(salleUpdate);
            }
        } else {
            String code = request.getParameter("code");
            Salle newSalle = new Salle();
            newSalle.setCode(code);
            salleService.create(newSalle);
        }
        response.sendRedirect("salles.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "SalleController";
    }
}
