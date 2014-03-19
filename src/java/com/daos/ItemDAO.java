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

import com.pojos.Item;
import java.util.*;
import java.sql.Connection;
public class ItemDAO {
    
    Connection conn;
    
    public ItemDAO(){
        
        //Connect to the database
        
    }
    
     
    public List<Item> selectAllItems(){
        return null;
    }
    
    public Item selectItemById(int item_id){
        return null;
    }

    public Item selectItemByname(String name){
        return null;
    }
    
    public Item selectItemByAvaliableQuantity(String avaliable_quantity){
        return null;
    }
    
    public Item selectItemByPrice(double price){
        return null;
    }
    
    public Item selectItemByCategory(String category){
        return null;
    }
    
    
    public void insertItem(Item item){
    
    }
    
    public void updateItemID(int item_id){
    
    }

    public void updateItemName(String name){
    
    }
    
     public void updateItemAvaliableQuantity(String avaliable_quantity){
    
    }
 
    public void updateItemPrice(double price){
    
    }
    
    public void updateItemCategory(String category){
    
    }    
    
    public void deleteItem(Item item){
    
    }    
}
