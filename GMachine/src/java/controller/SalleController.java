/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entities.Salle;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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

            if (request.getParameter("op").equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Salle salleToDelete = salleService.findById(id);
                System.out.println(id);

                System.out.println(salleService.findById(id));
                salleService.delete(salleService.findById(id));
                response.sendRedirect("salles.jsp");

            } else if (request.getParameter("op").equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Salle salleToUpdate = salleService.findById(id);
                RequestDispatcher dispatcher = request.getRequestDispatcher("salles.jsp");
                request.setAttribute("room", salleToUpdate);
                dispatcher.forward(request, response);
            }
         else if (request.getParameter("op").equals("Ajouter")) {
            String code = request.getParameter("code");
            Salle newSalle = new Salle();
            newSalle.setCode(code);
            salleService.create(newSalle);
            response.sendRedirect("salles.jsp");

        } else if (request.getParameter("op").equals("Modifier")) {
            int id = Integer.parseInt(request.getParameter("roomId"));
            String code = request.getParameter("code");
            Salle ns = salleService.findById(id);
            ns.setCode(code);
            salleService.update(ns);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println("get");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println("post");
    }

    @Override
    public String getServletInfo() {
        return "SalleController";
    }
}
