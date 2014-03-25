/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dal.dao.UserHome;
import com.dal.pojo.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yassmeen
 */
public class ViewProfile extends HttpServlet {

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
    UserHome uh = new UserHome();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession currentSession = request.getSession(false);
        
        if (currentSession != null) {
            if (currentSession.getAttributeNames().hasMoreElements()) {
                String email = request.getParameter("email");
                if(email != null){
                    ArrayList<User> test = (ArrayList<User>)uh.findByEmail(email);
                request.setAttribute("user", test.get(0));
                    System.out.println("here" + test.get(0).getFullName());
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/Profile.jsp?date=" + new Date().getTime());
                rd.forward(request, response);    
                }else{
                request.setAttribute("user", ((User) currentSession.getAttribute("currentCustomer")));
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/Profile.jsp?date=" + new Date().getTime());
                rd.forward(request, response);
                }
            } else {
                response.sendRedirect("/FurnitureCrazeV1-1/index.jsp");
            }
        } else {
            response.sendRedirect("/index.jsp");
        }
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
