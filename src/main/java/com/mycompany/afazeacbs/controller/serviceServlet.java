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
import com.mycompany.afazeacbs.dao.serviceDAO; //to request datbase we need to use dao to access the database in between the java servlet
import com.mycompany.afazeacbs.model.Service; //object oriented programming...help to maintain the code..easier to debug.
import java.sql.SQLException;  //
import java.util.List;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author Name : Nur Hasliza Binti Haslin
 */
@WebServlet("/serviceServlet")
public class serviceServlet extends HttpServlet {

    private serviceDAO serviceDAO;

    @Override
    public void init() {
        serviceDAO = new serviceDAO();
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

        System.out.println("ServiceServlet => Action = " + action);
        try {
            switch (action) {
                case "/serviceServlet":
                case "/newService":
                    displayNewServiceForm(request, response);
                    break;
                case "/editService":
                    displayEditServiceForm(request, response);
                    break;
                case "/insertService":
                    createService(request, response);
                    break;
                case "/updateService":
                    updateService(request, response);
                    break;
                case "/deleteService":
                    deleteService(request, response);
                    break;
                case "/listService":
                    retrieveService(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }

    private void displayNewServiceForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/ServiceForm.jsp");
        dispatcher.forward(request, response);

    }

    private void displayEditServiceForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {

        int serviceId = Integer.parseInt(request.getParameter("serviceId"));

        Service currentservice = serviceDAO.selectServiceById(serviceId);
        request.setAttribute("service", currentservice);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/ServiceForm.jsp");
        dispatcher.forward(request, response);
    }

    private void createService(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        try {
            String serviceName = request.getParameter("serviceName");
            String serviceType = request.getParameter("serviceType");
            String serviceDesc = request.getParameter("serviceDesc");
            String serviceTime = request.getParameter("serviceTime");
            String serviceDays = request.getParameter("serviceDays");
            String servicePriceParam = request.getParameter("servicePrice");
            double servicePrice = (servicePriceParam != null && !servicePriceParam.trim().isEmpty())
                    ? Double.parseDouble(servicePriceParam)
                    : 0.0;  // Default value or handle it according to your business logic

            Service service = new Service(serviceName, serviceType, serviceDesc, serviceTime, serviceDays, servicePrice);
            serviceDAO.insertService(service);
            response.sendRedirect("listService");
        } catch (SQLException ex) {
            // Log the exception or print the stack trace
            ex.printStackTrace();
            throw new ServletException("Error inserting data into the database", ex);
        }

    }

    private void retrieveService(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        List<Service> services = serviceDAO.selectAllService();

        //stored users record inside the variable listUser..
        request.setAttribute("listofService", services);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/serviceList.jsp");
        dispatcher.forward(request, response);
    }

    private void updateService(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
try{
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        String serviceName = request.getParameter("serviceName");
        String serviceType = request.getParameter("serviceType");
        String serviceDesc = request.getParameter("serviceDesc");
        String serviceTime = request.getParameter("serviceTime");
        String serviceDays = request.getParameter("serviceDays");
         String servicePriceParam = request.getParameter("servicePrice");
       double servicePrice = (servicePriceParam != null && !servicePriceParam.trim().isEmpty())
                    ? Double.parseDouble(servicePriceParam)
                    : 0.0;  // Default value or handle it according to your business logic

        Service service = new Service(serviceId, serviceName, serviceType, serviceDesc, serviceTime, serviceDays, servicePrice);
        serviceDAO.updateService(service);
        response.sendRedirect("listService");
    } catch (SQLException ex) {
            // Log the exception or print the stack trace
            ex.printStackTrace();
            throw new ServletException("Error inserting data into the database", ex);
        }
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {

        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        serviceDAO.deleteService(serviceId);
        response.sendRedirect("listService");

    }

}

/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
