/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.afazeacbs.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletContext;
import jakarta.servlet.RequestDispatcher;
import com.mycompany.afazeacbs.dao.treatmentDAO;
import com.mycompany.afazeacbs.model.Treatment;
import java.sql.SQLException;  //
import java.util.List;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author Name : Nur Hasliza Binti Haslin
 */
@WebServlet("/TreatmentServlet")
public class TreatmentServlet extends HttpServlet {

    private treatmentDAO treatmentDAO;

    @Override
    public void init() {
        treatmentDAO = new treatmentDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();

        System.out.println("TreatmentServlet => Action = " + action);
        try {
            switch (action) {
                case "/TreatmentServlet":
                case "/newTreatment":
                    displayNewTreatmentForm(request, response);
                    break;

                case "/editTreatment":
                    displayEditTreatmentForm(request, response);
                    break;
                case "/insertTreatment":
                    createTreatment(request, response);
                    break;
                case "/updateTreatment":
                    updateTreatment(request, response);
                    break;
                case "/deleteTreatment":
                    deleteTreatment(request, response);
                    break;
                case "/listTreatment":
                    retrieveTreatment(request, response);
                    break;

            }
        } catch (SQLException ex) {
            throw new ServletException(ex);

        }
    }

    private void displayNewTreatmentForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/treatmentForm.jsp");
        dispatcher.forward(request, response);

    }

    private void displayEditTreatmentForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {

        int treatmentId = Integer.parseInt(request.getParameter("treatmentId"));

        Treatment currenttreatment = treatmentDAO.selectTreatmentById(treatmentId);
        request.setAttribute("treatment", currenttreatment);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/treatmentForm.jsp");
        dispatcher.forward(request, response);
    }

    private void createTreatment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        try {
            String treatmentName = request.getParameter("treatmentName");

            Treatment treatment = new Treatment(treatmentName);
            treatmentDAO.insertTreatment(treatment);
            response.sendRedirect("listTreatment");
        } catch (SQLException ex) {
            // Log the exception or print the stack trace
            ex.printStackTrace();
            throw new ServletException("Error inserting data into the database", ex);
        }

    }

    private void retrieveTreatment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        List<Treatment> treatment = treatmentDAO.selectAllTreatment();

        //stored users record inside the variable listUser..
        request.setAttribute("listofTreatment", treatment);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/treatmentList.jsp");
        dispatcher.forward(request, response);
    }
    
    private void updateTreatment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        try {
            int treatmentId = Integer.parseInt(request.getParameter("treatmentId"));
            String treatmentName = request.getParameter("treatmentName");

            Treatment treatment = new Treatment(treatmentId, treatmentName);
            treatmentDAO.updateTreatment(treatment);
            response.sendRedirect("listTreatment");
        } catch (SQLException ex) {
            // Log the exception or print the stack trace
            ex.printStackTrace();
            throw new ServletException("Error inserting data into the database", ex);
        }
    }
    
     private void deleteTreatment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {

        int treatmentId = Integer.parseInt(request.getParameter("treatmentId"));
        treatmentDAO.deleteTreatment(treatmentId);
        response.sendRedirect("listTreatment");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
