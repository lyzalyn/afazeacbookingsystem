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
import com.mycompany.afazeacbs.dao.packageDAO;
import com.mycompany.afazeacbs.model.Packages;
import java.sql.SQLException;  //
import java.util.List;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author Name : Nur Hasliza Binti Haslin
 */
@WebServlet("/PackageServlet")
public class PackageServlet extends HttpServlet {

    private packageDAO packageDAO;

    @Override
    public void init() {
        packageDAO = new packageDAO();
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

        System.out.println("PackageServlet => Action = " + action);
        try {
            switch (action) {
                case "/PackageServlet":
                case "/newPackage":
                    displayNewPackageForm(request, response);
                    break;

                case "/editPackage":
                    displayEditPackageForm(request, response);
                    break;
                case "/insertPackage":
                    createPackage(request, response);
                    break;
                case "/updatePackage":
                    updatePackage(request, response);
                    break;
                case "/deletePackage":
                    deletePackage(request, response);
                    break;
                case "/listPackage":
                    retrievePackage(request, response);
                    break;

            }
        } catch (SQLException ex) {
            throw new ServletException(ex);

        }
    }

    private void displayNewPackageForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/PackageForm.jsp");
        dispatcher.forward(request, response);

    }

    private void displayEditPackageForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {

        int packagesId = Integer.parseInt(request.getParameter("packagesId"));

        Packages currentpackage = packageDAO.selectPackageById(packagesId);
        request.setAttribute("packages", currentpackage);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/PackageForm.jsp");
        dispatcher.forward(request, response);
    }

    private void createPackage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        try {
            String packageName = request.getParameter("packageName");

            Packages packages = new Packages(packageName);
            packageDAO.insertPackage(packages);
            response.sendRedirect("listPackage");
        } catch (SQLException ex) {
            // Log the exception or print the stack trace
            ex.printStackTrace();
            throw new ServletException("Error inserting data into the database", ex);
        }

    }

    private void retrievePackage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        List<Packages> packages = packageDAO.selectAllPackage();

        //stored users record inside the variable listUser..
        request.setAttribute("listofPackage", packages);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/packageList.jsp");
        dispatcher.forward(request, response);
    }

    private void updatePackage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        try {
            int packagesId = Integer.parseInt(request.getParameter("packagesId"));
            String packageName = request.getParameter("packageName");

            Packages packages = new Packages(packagesId, packageName);
            packageDAO.updatePackage(packages);
            response.sendRedirect("listPackage");
        } catch (SQLException ex) {
            // Log the exception or print the stack trace
            ex.printStackTrace();
            throw new ServletException("Error inserting data into the database", ex);
        }
    }

    private void deletePackage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {

        int packagesId = Integer.parseInt(request.getParameter("packagesId"));
        packageDAO.deletePackage(packagesId);
        response.sendRedirect("listPackage");

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
