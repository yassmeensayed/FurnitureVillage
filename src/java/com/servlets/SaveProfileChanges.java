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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yassmeen
 */
public class SaveProfileChanges extends HttpServlet {

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
        PrintWriter out = response.getWriter();

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

        UserHome uh = new UserHome();
        Integer id = new Integer(15);
        User u = uh.findById(id);
        request.setAttribute("user", u);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/EditProfile.jsp");
        rd.forward(request, response);
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
        try {
            UserHome uh = new UserHome();
            Integer id = new Integer(15);
            User u = uh.findById(id);

            String bdate = request.getParameter("bday");
            System.out.println("DATE " + bdate);
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = formatter.parse(bdate);
            u.setAddress(request.getParameter("address"));
            u.setBalance(Integer.parseInt(request.getParameter("balance")));
            u.setFullName(request.getParameter("uName"));
            u.setEmail(request.getParameter("mail"));
            u.setBirthdate(date);
            u.setPassword(request.getParameter("newpassword"));
            u.setInterests(request.getParameter("interests"));
            uh.persist(u);
            request.getParameter("oldpassword");
            System.out.println("POST REACHED " + request.getParameter("uName"));
        } catch (ParseException ex) {
            Logger.getLogger(SaveProfileChanges.class.getName()).log(Level.SEVERE, null, ex);
        }


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
