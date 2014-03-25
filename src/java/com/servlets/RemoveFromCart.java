/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dal.dao.ItemHome;
import com.dal.dao.ShoppingCartHome;
import com.dal.pojo.Item;
import com.dal.pojo.ShoppingCart;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
public class RemoveFromCart extends HttpServlet {

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
        HttpSession currentSession = request.getSession(false);
        if (currentSession != null) {
            if (currentSession.getAttributeNames().hasMoreElements()) {
                ArrayList<ShoppingCart> sessionCart = (ArrayList<ShoppingCart>) currentSession.getAttribute("shoppingCart");
                int itemId = Integer.parseInt(request.getParameter("itemId"));
                ItemHome itemHome = new ItemHome();
                Item itemToDelete = itemHome.findById(itemId);
                ShoppingCartHome cartHome = new ShoppingCartHome();
                Integer virtualBalance=(Integer)currentSession.getAttribute("virtualBalance");
                for (int i = 0; i < sessionCart.size(); i++) {
                    if (sessionCart.get(i).getItem().getItemId() == itemId) {
                        List<ShoppingCart> itemInCart = cartHome.findByExample(sessionCart.get(i));
                        if (sessionCart.get(i).getQuantity() > 1) {
                            sessionCart.get(i).setQuantity(sessionCart.get(i).getQuantity() - 1);
                            itemInCart.get(0).setQuantity(sessionCart.get(i).getQuantity());
                            cartHome.merge(itemInCart.get(0));
                            itemToDelete.setAvailableQuantity(itemToDelete.getAvailableQuantity() +1);
                            itemHome.merge(itemToDelete);
                            virtualBalance += itemToDelete.getPrice().intValue();
                            currentSession.setAttribute("virtualBalance", virtualBalance);
                        } else {
                            cartHome.delete(itemInCart.get(0));
                            sessionCart.remove(i);
                            itemToDelete.setAvailableQuantity(itemToDelete.getAvailableQuantity() +1);
                            itemHome.merge(itemToDelete);
                            virtualBalance += itemToDelete.getPrice().intValue();
                            currentSession.setAttribute("virtualBalance", virtualBalance);
                            break;
                        }
                    }
                }

                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewCart?date=" + new java.util.Date().getTime());
                dispatcher.forward(request, response);


            } else {
                response.sendRedirect("/FurnitureCrazeV1-1/index.jsp");
            }
        } else {
            response.sendRedirect("/FurnitureCrazeV1-1/index.jsp");
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
