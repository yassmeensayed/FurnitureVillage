/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dal.dao.CategoriesHome;
import com.dal.dao.ItemHome;
import com.dal.pojo.Categories;
import com.dal.pojo.Item;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 *
 * @author Yassmeen
 */
public class AddNewItem extends HttpServlet {

    private final static int KITCHENS= 1;
    private final static int DiningRooms= 2;
    private final static int BedRooms= 3; 
    private final static int LivingRooms= 4; 
	private static final long serialVersionUID = 1L;
	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 5000 * 1024;
	private int minFileSize = 4 * 1024;
	private File file;
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
            String name=""; String AvQuant=""; String price=""; String cat=""; String des="";
            /*String name = request.getParameter("name");
                        System.out.println("Name:::::::" + name);
            String AvQuant = request.getParameter("email");
                        System.out.println("Name:::::::" + AvQuant);
            String price = request.getParameter("address");
            String cat = request.getParameter("categories");
            System.out.println("Name:::::::" + name);
            String des = request.getParameter("interests");*/
           
            ////////////////
             ServletContext context = request.getServletContext();
            String filePath = context.getInitParameter("file-upload");
       	System.out.println("I'm in init" + filePath);

		isMultipart = ServletFileUpload.isMultipartContent(request);
		response.setContentType("text/html");
		System.out.println("I'm in dopost");
	    if( !isMultipart ){
	    	System.out.println("isn't multi");
	    	out.println("<html>");
	        out.println("<head>");
	        out.println("<title>Servlet upload</title>");  
	        out.println("</head>");
	        out.println("<body>");
	        out.println("<p>No file uploaded</p>"); 
	        out.println("</body>");
	        out.println("</html>");
	          return;
	       }
	    
	    DiskFileItemFactory factory  = new DiskFileItemFactory();
	    factory.setSizeThreshold(maxFileSize);
	    factory.setRepository(new File("C:\\TEMP")); // to put the files larger than maxsizes
	    
	    ServletFileUpload upload = new ServletFileUpload(factory);
	    upload.setSizeMax(maxFileSize);
	    try {
	    	System.out.println("i'm in try");
			List<FileItem> fileItems = upload.parseRequest(request);
			Iterator<FileItem> i = fileItems.iterator();
			System.out.println("I'm after Item");
		    out.println("<html>");
		    out.println("<head>");
		    out.println("<title>Servlet upload</title>");  
		    out.println("</head>");
		    out.println("<body>");
		    while( i.hasNext() ){
		    	System.out.println("i'm in while");

		    	FileItem fi = i.next();
                       
		    	if( !fi.isFormField()){
		    		                    System.out.println("I'm in IF");
		    		String fieldName = fi.getFieldName();
		    		String fileName = fi.getName();
                                System.out.println("File Nameee :" + fileName);
		    		String contentType = fi.getContentType();
		    		boolean isInMemory = fi.isInMemory();
		    		long sizeInBytes = fi.getSize();
		    		//file = new File(filePath);
		    		if ( fileName.lastIndexOf("\\") >=0){
		    			file = new File(filePath +
		    					fileName.substring(fileName.lastIndexOf("\\")));
		    					    		                    System.out.println("I'm in IF1" + file.getPath());

		    		}else{
		    			file = new File(filePath +"\\"+cat+"\\"+
		    					fileName.substring(fileName.lastIndexOf("\\") + 1));
                                        		    		                    System.out.println("I'm in else"+ file.getPath());

		    		}
		    		fi.write(file);
		    		out.println("Uploded FileName : " +  fileName +"<br />");
		    	}else{
                            if(fi.getFieldName().equals("name")){
                                name=fi.getString();
                                System.out.println("Name : " + name);
                            }else if(fi.getFieldName().equals("email")){
                                AvQuant = fi.getString();
                                System.out.println("Av : " + AvQuant);
                            }else if(fi.getFieldName().equals("address")){
                                price = fi.getString();
                                System.out.println("price :" + price);
                            }else if(fi.getFieldName().equals("categories")){
                                cat = fi.getString();
                                System.out.println("cat : " + cat);
                            }else if(fi.getFieldName().equals("interests")){
                                des = fi.getString();
                            }
                        }
		    	
		    }
		    out.println("Bye");
		    out.println("</body>");
		    out.println("</html>");
	    	
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	    
	    System.out.println("i'm out bye");
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
	
            
          ///////////////////
            ih.merge(item);
            uploadFile(request, response, cat);
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

    public void uploadFile(HttpServletRequest request, HttpServletResponse response, String name1) throws IOException, ServletException{
          String UPLOAD_DIRECTORY = "C:/Users/KimOoO/Documents/NetBeansProjects/FurnitureVillage/web/images/"+name1;
          System.out.println("I'm in Uplaod");
          if(ServletFileUpload.isMultipartContent(request)){
          System.out.println("I'm in Multi");

              try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                         System.out.println("File Name: " + name);
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                    }
                }
           
               //File uploaded successfully
               //request.setAttribute("message", "File Uploaded Successfully");
                System.out.println("File Uploaded Successfully!");
            } catch (Exception ex) {
               //request.setAttribute("message", "File Upload Failed due to " + ex);
                  System.out.println("Uplaod Error");
            }          
         
        }else{
            request.setAttribute("message",
                                 "Sorry this Servlet only handles file upload request");
              System.out.println("Not Multi :(");
        }
    
       // request.getRequestDispatcher("/result.jsp").forward(request, response);
     
    }
    
}
