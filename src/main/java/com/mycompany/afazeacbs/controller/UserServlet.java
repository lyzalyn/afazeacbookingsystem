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
import com.mycompany.afazeacbs.dao.registerDAO; //to request datbase we need to use dao to access the database in between the java servlet
import com.mycompany.afazeacbs.model.User; //object oriented programming...help to maintain the code..easier to debug.
import java.sql.SQLException;  //
import java.util.List;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author Name : Nur Hasliza Binti Haslin
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    private registerDAO registerDAO;

    @Override
    public void init() {
        registerDAO = new registerDAO();
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

        System.out.println("UserServlet => Action = " + action);
        try {
            switch (action) {
                case "/UserServlet":
                case "/newUser":
                    displayNewUserForm(request, response);
                    break;
                case "/editUser":
                    displayEditUserForm(request, response);
                    break;
                case "/insertUser":
                    createUser(request, response);
                    break;
                case "/updateUser":
                    updateUser(request, response);
                    break;
                case "/deleteUser":
                    deleteUser(request, response);
                    break;
                case "/listUser":
                    retrieveUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }

    private void displayNewUserForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/RegisterUser.jsp");
        dispatcher.forward(request, response);

    }

    private void displayEditUserForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {

        int userID = Integer.parseInt(request.getParameter("userId"));

        User currentuser = registerDAO.selectUserById(userID);
        request.setAttribute("user", currentuser);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/RegisterUser.jsp");
        dispatcher.forward(request, response);
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {

        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String pNo = request.getParameter("pNo");
        String email = request.getParameter("email");
        String pssword = request.getParameter("password");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String postcode = request.getParameter("postcode");
        String state = request.getParameter("state");

        User user = new User(fName, lName, pNo, email, pssword, address, city, postcode, state);
        registerDAO.insertUser(user);
        response.sendRedirect("/LoginUser.jsp");

    }

    private void retrieveUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {
        List<User> users = registerDAO.selectAllUsers();

        //stored users record inside the variable listUser..
        request.setAttribute("listofUser", users);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/userList.jsp");
        dispatcher.forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, SQLException, IOException {

        int userID = Integer.parseInt(request.getParameter("userId"));
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String pNo = request.getParameter("pNo");
        String email = request.getParameter("email");
        String pssword = request.getParameter("password");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String postcode = request.getParameter("postcode");
        String state = request.getParameter("state");
        
        User user = new User(userID, fName, lName, pNo, email, pssword, address, city, postcode, state);
        registerDAO.updateUser(user);
        response.sendRedirect("listUser");
    }
    private void deleteUser(HttpServletRequest request , HttpServletResponse response) 
            throws ServletException,SQLException,IOException{
        
        int userID = Integer.parseInt(request.getParameter("userId"));
        registerDAO.deleteUser(userID);
        response.sendRedirect("listUser");
          
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
