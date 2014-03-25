/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dal.dao.ItemHome;
import com.dal.dao.OrderHistoryHome;
import com.dal.dao.ShoppingCartHome;
import com.dal.dao.UserHome;
import com.dal.pojo.Item;
import com.dal.pojo.OrderHistory;
import com.dal.pojo.OrderHistoryId;
import com.dal.pojo.ShoppingCart;
import com.dal.pojo.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yassmeen
 */
public class CheckOut extends HttpServlet {

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
        HttpSession currentSession = request.getSession(false);
        if (currentSession != null) {
            if (currentSession.getAttributeNames().hasMoreElements()) {
                ArrayList<ShoppingCart> sessionCart = (ArrayList<ShoppingCart>) currentSession.getAttribute("shoppingCart");
                Integer virtualBalance = (Integer)currentSession.getAttribute("virtualBalance");
                User currentCustomer = (User) currentSession.getAttribute("currentCustomer");
                StringBuilder orderHistory = new StringBuilder();
                UserHome userHome = new UserHome();
                if(sessionCart.size()>0){
                currentCustomer.setBalance(virtualBalance);
                userHome.merge(currentCustomer);
                ShoppingCartHome cartHome = new ShoppingCartHome();
                OrderHistoryHome historyHome = new OrderHistoryHome();
                ItemHome itemHome = new ItemHome();
                for(int i=0;i< sessionCart.size();i++){
                    Item item= itemHome.findById(sessionCart.get(i).getId().getItemId());
                    orderHistory.append("item name: "+item.getName());
                    orderHistory.append(", item quantity: "+sessionCart.get(i).getQuantity()+"\n");
                    ShoppingCart shoppingCartToDelete = sessionCart.get(i);
                    cartHome.delete(shoppingCartToDelete);
                }
                sessionCart.removeAll(sessionCart);
//                OrderHistory currentOrder = new OrderHistory();
//                currentOrder.setId(new OrderHistoryId(currentCustomer.getId(),new Date()));
//                currentOrder.setDescription(orderHistory.toString());
//                currentOrder.setUser(currentCustomer);
//                historyHome.persist(currentOrder);
                
                response.getWriter().print("succesfully bought"+"\n"+orderHistory);
                }
            } else {
                response.getWriter().print("invalidSession");
            }
        } else {
            response.getWriter().print("invalidSession");
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
