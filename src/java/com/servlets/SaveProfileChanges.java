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
import javax.servlet.http.HttpSession;
import org.hibernate.Session;

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

        HttpSession currentSession = request.getSession(false);
        if (currentSession != null) {
            if (currentSession.getAttributeNames().hasMoreElements()) {
                request.setAttribute("user", ((User) currentSession.getAttribute("currentCustomer")));
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/EditProfile.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }


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


        HttpSession currentSession = request.getSession(false);
        if (currentSession != null) {
            try {
                if (currentSession.getAttributeNames().hasMoreElements()) {
                    User u = ((User) currentSession.getAttribute("currentCustomer"));
                    String bdate = request.getParameter("bday");
                    System.out.println("DATE " + bdate);
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    Date date = formatter.parse(bdate);
                    u.setAddress(request.getParameter("address"));
                    //added by yassmeen
                    Integer virtualBalance = (Integer) currentSession.getAttribute("virtualBalance");
                    virtualBalance+=Integer.parseInt(request.getParameter("balance"))- u.getBalance();
                    currentSession.setAttribute("virtualBalance", virtualBalance);
                    //=========================
                    u.setBalance(Integer.parseInt(request.getParameter("balance")));
                    u.setFullName(request.getParameter("uName"));
                    u.setEmail(request.getParameter("mail"));
                    u.setBirthdate(date);
                    u.setPassword(request.getParameter("newpassword"));
                    u.setInterests(request.getParameter("interests"));
                    UserHome uh = new UserHome();
                    uh.merge(u);
                    request.getParameter("oldpassword");
                    System.out.println("POST REACHED " + request.getParameter("uName"));
                } else {
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
                    dispatcher.forward(request, response);
                }

            } catch (ParseException ex) {
                Logger.getLogger(SaveProfileChanges.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
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
