/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dal.dao.CategoriesHome;
import com.dal.dao.ItemHome;
import com.dal.pojo.Categories;
import com.dal.pojo.Item;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Yassmeen
 */
public class AddNewItem extends HttpServlet {

    private final static int KITCHENS= 1;
    private final static int DiningRooms= 2;
    private final static int BedRooms= 3; 
    private final static int LivingRooms= 4; 

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
        try {
            /* TODO output your page here. You may use following sample code. */
           Item item = new Item();
            ItemHome ih = new ItemHome();
            CategoriesHome ch = new CategoriesHome();
            
            String name = request.getParameter("name");
            String AvQuant = request.getParameter("email");
            String price = request.getParameter("address");
            String cat = request.getParameter("categories");
            
            String des = request.getParameter("interests");
            item.setAvailableQuantity(Integer.parseInt(AvQuant)); 
            if(cat.toLowerCase().equals("kitchens")){
                Categories c = ch.findById(KITCHENS);
                item.setCategories(c);
            }
            if(cat.toLowerCase().equals("diningrooms")){
                Categories c = ch.findById(DiningRooms);
                item.setCategories(c);
            }            
            if(cat.toLowerCase().equals("bedrooms")){
                Categories c = ch.findById(BedRooms);
                item.setCategories(c);
            }
            if(cat.toLowerCase().equals("livingrooms")){
                Categories c = ch.findById(LivingRooms);
                item.setCategories(c);
            }
            item.setDescription(des);
            item.setName(name);
            item.setPrice(Double.parseDouble(price));
            
            ih.merge(item);
            
            response.sendRedirect("/FurnitureCrazeV1-1/Admin.jsp?date=" + new Date().getTime());
            
            System.out.println(name + " " + AvQuant + " " + price + " " + cat );
        } finally {            
            out.close();
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
