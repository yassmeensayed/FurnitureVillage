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
import com.pojos.Shopping_Cart;
import java.sql.*;
import java.util.*;

public class Shopping_CartDAO {
    
    Connection conn;
    
    public Shopping_CartDAO(){
    
        //Connect to the database
    }
    
     public List<Shopping_Cart> selectAllShoppingCarts(){
        return null;
    }
    
    public Shopping_Cart selectShoppingCartByUserId(int user_id){
        return null;
    }

    public Shopping_Cart selectShoppingCartByItemId(int item_id){
        return null;
    } 
       
    public void insertShoppingCart(Shopping_Cart shoppingCart){
    
    }
    
    public void updateShoppingCartUserID(int user_id){
    
    }

    public void updateShoppingCartItemID(int item_id){
    
    }
    
    public void updateShoppingCartQuantity(String quantity){
    
    }
    
    public void deleteShoppingCart(Shopping_Cart shoppingCart){
    
    }    
    
}
