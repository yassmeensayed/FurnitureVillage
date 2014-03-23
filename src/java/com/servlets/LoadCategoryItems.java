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
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yassmeen
 */
public class LoadCategoryItems extends HttpServlet {

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
        String category = request.getParameter("category");
        ItemHome itemHome = new ItemHome();
        Item sampleItem = new Item();
        ArrayList<Item> allItems = (ArrayList<Item>) itemHome.findByExample(sampleItem);
        ArrayList<String> imagePaths = new ArrayList<String>();
        ArrayList<Item> categoryItems = new ArrayList<Item>();
        for (int i = 0; i < allItems.size(); i++) {
            if (allItems.get(i).getCategories().getName().equals(category)) {
                imagePaths.add("images/"+category+"/"+allItems.get(i).getImage());
                categoryItems.add(allItems.get(i));
            }
        }
        request.setAttribute("imagePaths", imagePaths);
        request.setAttribute("categoryItems", categoryItems);
        request.setAttribute("category", category);
        if (category.equals("BedRooms")) {
            request.setAttribute("pageName", "Bed Room");
        } else if (category.equals("LivingRooms")) {
            request.setAttribute("pageName", "Living Rooms");
        } else if (category.equals("DiningRooms")) {
            request.setAttribute("pageName", "Dining Rooms");
        } else if (category.equals("Kitchens")) {
            request.setAttribute("pageName", "Kitchens");
        }
        
        ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/CategoryGallery.jsp");
        dispatcher.forward(request, response);
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
