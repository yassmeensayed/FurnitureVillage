/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dal.dao.ItemHome;
import com.dal.dao.ShoppingCartHome;
import com.dal.pojo.Item;
import com.dal.pojo.ShoppingCart;
import com.dal.pojo.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class AddToCart extends HttpServlet {

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

        HttpSession currentSession = request.getSession(false);
        if (currentSession != null) {
            if (currentSession.getAttributeNames().hasMoreElements()) {
                User currentCustomer = (User) currentSession.getAttribute("currentCustomer");
                Integer virtualBalance = (Integer) currentSession.getAttribute("virtualBalance");
                String itemId = request.getParameter("itemId");
                String category = request.getParameter("category");
                if (itemId != null) {
                    ArrayList<ShoppingCart> sessionCart = (ArrayList<ShoppingCart>) currentSession.getAttribute("shoppingCart");
                    ShoppingCart newShoppingCart = new ShoppingCart();
                    ItemHome itemHome = new ItemHome();
                    Item itemToadd = itemHome.findById(Integer.parseInt(itemId));
                    if (itemToadd != null) {
                        if ((virtualBalance - itemToadd.getPrice()) >= 0) {//checking if his balance is enough
                            boolean found = false;
                            for (int i = 0; i < sessionCart.size(); i++) {
                                if (sessionCart.get(i).getItem().getItemId() == Integer.parseInt(itemId)) {
                                    found = true;
                                    sessionCart.get(i).setQuantity(sessionCart.get(i).getQuantity() + 1);
                                    virtualBalance -= itemToadd.getPrice().intValue();
                                }
                            }
                            if (!found) {
                                newShoppingCart.setItem(itemToadd);
                                newShoppingCart.setQuantity(1);
                                newShoppingCart.setUser(currentCustomer);
                                sessionCart.add(newShoppingCart);
                                virtualBalance -= itemToadd.getPrice().intValue();
                            }
                        }
                    }
                }
                response.sendRedirect("/FurnitureCrazeV1-1/LoadCategoryItems?category=" + category);
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
