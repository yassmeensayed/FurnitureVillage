/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dal.dao.AdminUserHome;
import com.dal.dao.ItemHome;
import com.dal.dao.ShoppingCartHome;
import com.dal.dao.UserHome;
import com.dal.pojo.Item;
import com.dal.pojo.ShoppingCart;
import com.dal.pojo.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yassmeen
 */
public class Login extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String logEmail = request.getParameter("email");
        String logPass = request.getParameter("pass");
        UserHome uh = new UserHome();
        AdminUserHome adminUserHome = new AdminUserHome();
        
        ArrayList<User> user = (ArrayList<User>) uh.findByEmail(logEmail);
        if (user.size() > 0) {
            if (user.get(0).getEmail().equals(logEmail)) {
                if (user.get(0).getPassword().equals(logPass)) {
                    out.print("logged in successfully");
                    HttpSession session = request.getSession(true);
                    ArrayList<ShoppingCart> savedShoppingCart = new ArrayList<ShoppingCart>();
                    ShoppingCartHome sh = new ShoppingCartHome();
                    List<ShoppingCart> oldCart = sh.findByExample(new ShoppingCart());
                    Integer virtualBalance = user.get(0).getBalance();
                    for (int i = 0; i < oldCart.size(); i++) {
                        if(oldCart.get(i).getId().getUserId()==user.get(0).getId()){
                            savedShoppingCart.add(oldCart.get(i));
                            virtualBalance-=(oldCart.get(i).getQuantity()*getItemPrice(oldCart.get(i).getId().getItemId()));
                        }
                    }
                    if(adminUserHome.isAdminUser(user.get(0))){
                        session.setAttribute("currentAdmin", user.get(0));
                        
                    }
                    else{
                        session.setAttribute("currentCustomer", user.get(0));
                    }
                    session.setAttribute("shoppingCart", savedShoppingCart);
                    session.setAttribute("virtualBalance", virtualBalance);
                } else {
                    out.print("Wrong Password");
                }
            }
        } else {
            out.print("Wrong Email");
        }

    }
    private int getItemPrice(int id){
        ItemHome itemHome= new ItemHome();
        Item item =itemHome.findById(id);
        return item.getPrice().intValue();
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
