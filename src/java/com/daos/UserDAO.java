/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.daos;
import com.pojos.User;
import java.sql.Connection;
import java.util.*;
/**
 *
 * @author KimOoO
 */
public class UserDAO {
    
    Connection conn;

    public UserDAO() {
        
        //Connect to the database
    }
    
    
    
    public List<User> selectAllUsers(){
        return null;
    }
    
    public User selectUserById(int id){
        return null;
    }

    public User selectUserByFname(String fName){
        return null;
    }
    
    public User selectUserByLname(String lName){
        return null;
    }
    
    public User selectUserByBirthDate(String birthOfDate){
        return null;
    }
    
    public User selectUserByJob(String job){
        return null;
    }
    
    public User selectUserByAddress(String address){
        return null;
    }
    
    public User selectUserByInterest(String interest){
        return null;
    }
    
    public void insertUser(User user){
    
    }
    
    public void updateUserID(int id){
    
    }

    public void updateUserLname(String lName){
    
    }
    
     public void updateUserFname(String fName){
    
    }
 
    public void updateUserBirthDate(String date){
    
    }
    
    public void updateUserJob(String job){
    
    }    
    
    public void updateUserAddress(String address){
    
    }
    
    public void updateUserInterest(String interest){
    
    }
    
    public void deleteUser(User user){
    
    }    
}
