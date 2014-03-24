/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dal.dao.UserHome;
import com.dal.pojo.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yassmeen
 */
public class RegisterUser extends HttpServlet {
   // private Date date;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String fullName,email,address,username,password,balance,interests = "";
        fullName = request.getParameter("name");
        email = request.getParameter("email");
        address = request.getParameter("address");
        username = request.getParameter("username");
        password = request.getParameter("password");
       // balance = request.getParameter("balance");
        interests = request.getParameter("interests");
        String bday = request.getParameter("bday");
        //SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//        String bday = request.getParameter("bday");
//        try {
//             date = formatter.parse(bday);
//        } catch (ParseException ex) {
//            Logger.getLogger(RegisterUser.class.getName()).log(Level.SEVERE, null, ex);
//        }
        System.out.println(fullName + email + address + username + password /*+ balance */+ interests /*+ date*/);
        User user = new User();
        user.setAddress(address);
        //user.setBalance(Integer.parseInt(balance));
        user.setPassword(password);
        user.setFullName(fullName);
        user.setEmail(email);
        user.setInterests(interests);
        //user.setBirthdate();
        UserHome uh = new UserHome();
        uh.persist(user);
        out.println("User found");
		
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
