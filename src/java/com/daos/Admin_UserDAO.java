/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.daos;

import com.pojos.Admin_User;
import java.sql.*;
import java.util.*;
/**
 *
 * @author KimOoO
 */
public class Admin_UserDAO {
    
    Connection conn;
    
    public Admin_UserDAO(){
    
     //Connect to the database

    }
    
    public List<Admin_User> selectAllAdminUsers(){
        return null;
    }
    
    public Admin_User selectAdminUserById(int id){
        return null;
    }

    public Admin_User selectAdminUserByUserID(int user_id){
        return null;
    }
   
    
    public void insertAdminUser(Admin_User admin){
    
    }
    
    public void updateAdminUserID(int id){
    
    }

    public void updateAdminUserUserId(int user_id){
    
    }
    
    
    public void deleteAdminUser(Admin_User admin){
    
    }    
}
