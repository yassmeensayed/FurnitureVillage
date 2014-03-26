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
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KimOoO
 */
public class LoadAdminPage extends HttpServlet {

   UserHome  uh = new UserHome();

    
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
   
    /*protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
          /*  out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoadAdminPage</title>");            
            out.println("</head>");
            out.println("<body>");
            //UserHome uh = new UserHome();
           // ArrayList<User> user= (ArrayList<User>)uh.findByExample(new User());
           // out.println("<h1>Servlet LoadAdminPage at " + user.get(0).getFullName() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }*/

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
        //processRequest(request, response);
                PrintWriter out = response.getWriter();

         response.setContentType("text/xml;charset=UTF-8");
        StringBuffer textOut = new StringBuffer();
             // HttpSession session = request.getSession(true);
           //   session.setAttribute("Admin", user.get(0));     
        UserHome  uh = new UserHome();
            ArrayList<User> users= (ArrayList<User>)uh.findByExample(new User());
            System.out.println("Users : " + users.size());
        textOut.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        textOut.append("<users>");
        HttpSession session = request.getSession(false);
        if( (User)session.getAttribute("currentAdmin") != null){
        
        for (int i = 0; i < users.size(); i++) {
            User user = users.get(i);
            textOut.append("<user>");
            textOut.append("<name>");
            textOut.append(user.getFullName());
            textOut.append("</name>");
            textOut.append("<email>");
            textOut.append(user.getEmail());
            textOut.append("</email>");
            textOut.append("<active>");
            textOut.append(user.getActiveStatus());
            textOut.append("</active>");
            textOut.append("</user>");   
        }
        textOut.append("</users>");
        
        out.print(textOut);
        }
        System.out.println("");
        System.out.println(textOut);
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
        //processRequest(request, response);
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
