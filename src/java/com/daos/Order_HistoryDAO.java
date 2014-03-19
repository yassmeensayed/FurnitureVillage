/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.daos;

/**
 *
 * @author KimOoO
 */

import com.pojos.Order_History;
import java.util.*;
import java.sql.*;

public class Order_HistoryDAO {
    
    Connection conn;
    
    public Order_HistoryDAO(){
    
        //Connect to the database
    }
    
     public List<Order_History> selectAllOrderHistories(){
        return null;
    }
    
    public Order_History selectOrderHistoryByUserId(int user_id){
        return null;
    }

    public Order_History selectOrderHistoryByDate(String date){
        return null;
    }
   
       
    public void insertOrderHistory(Order_History orderHistory){
    
    }
    
    public void updateOrderHistoryUserID(int user_id){
    
    }

    public void updateOrderHistoryDate(String date){
    
    }
    
    public void updateOrderHistoryDescription(String description){
    
    }
    
    public void deleteOrderHistory(Order_History orderHistory){
    
    }    
    
}
