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
import com.mycompany.afazeacbs.model.Staff;
import com.mycompany.afazeacbs.dao.staffDAO;
import java.sql.SQLException;  //
import java.util.List;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author Name : Nur Hasliza Binti Haslin
 */
@WebServlet("/StaffServlet")
public class StaffServlet extends HttpServlet {

    private staffDAO staffDAO;

    @Override
    public void init() {
        staffDAO = new staffDAO();
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

        System.out.println("StaffServlet => Action = " + action);
        try {
            switch (action) {
                case "/StaffServlet":
                case "/newStaff":
                    displayNewStaffForm(request, response);
                    break;
                case "/editStaff":
                    displayEditStaffForm(request, response);
                    break;
                case "/insertStaff":
                    createStaff(request, response);
                    break;
                case "/updateStaff":
                    updateStaff(request, response);
                    break;
                case "/deleteStaff":
                    deleteStaff(request, response);
                    break;
                case "/listStaff":
                    retrieveStaff(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }

    private void displayNewStaffForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/staffRegistration.jsp");
        dispatcher.forward(request, response);

    }

    private void displayEditStaffForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {

        int staffId = Integer.parseInt(request.getParameter("staffId"));

        Staff currentstaff = staffDAO.selectStaffById(staffId);
        request.setAttribute("staff", currentstaff);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/staffRegistration.jsp");
        dispatcher.forward(request, response);
    }

    private void createStaff(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {

        String sfName = request.getParameter("sfName");
        String slName = request.getParameter("slName");
        String spNo = request.getParameter("spNo");
        String sEmail = request.getParameter("sEmail");
        String sPassword = request.getParameter("sPassword");
        String sAddress = request.getParameter("sAddress");
        String sCity = request.getParameter("sCity");
        String sPostcode = request.getParameter("sPostcode");
        String sState = request.getParameter("sState");
        String sRole = request.getParameter("sRole");

        Staff staff = new Staff(sfName, slName, spNo, sEmail, sPassword, sAddress, sCity, sPostcode, sState, sRole);
        staffDAO.insertStaff(staff);
        response.sendRedirect("listStaff");
    }

    private void retrieveStaff(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        List<Staff> staffs = staffDAO.selectAllStaff();

        //stored users record inside the variable listUser..
        request.setAttribute("listofStaff", staffs);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/staffList.jsp");
        dispatcher.forward(request, response);
    }

    private void updateStaff(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        
        int staffId = Integer.parseInt(request.getParameter("staffId"));
        String sfName = request.getParameter("sfName");
        String slName = request.getParameter("slName");
        String spNo = request.getParameter("spNo");
        String sEmail = request.getParameter("sEmail");
        String sPassword = request.getParameter("sPassword");
        String sAddress = request.getParameter("sAddress");
        String sCity = request.getParameter("sCity");
        String sPostcode = request.getParameter("sPostcode");
        String sState = request.getParameter("sState");
        String sRole = request.getParameter("sRole");
        
        
         Staff staff = new Staff(staffId, sfName, slName, spNo, sEmail, sPassword, sAddress, sCity, sPostcode, sState, sRole);
        staffDAO.updateStaff(staff);
        response.sendRedirect("listStaff");
    }
    
        private void deleteStaff(HttpServletRequest request , HttpServletResponse response) 
            throws ServletException,SQLException,IOException{
            
            int staffId = Integer.parseInt(request.getParameter("staffId"));
            staffDAO.deleteStaff(staffId);
            response.sendRedirect("listStaff");
            
        }
        
        

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
