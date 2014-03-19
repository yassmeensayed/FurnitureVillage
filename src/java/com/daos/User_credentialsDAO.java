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

import com.pojos.User_Credentials;
import java.util.*;
import java.sql.*;

public class User_credentialsDAO {

    public User_credentialsDAO() {
        
        //connect to database
    }
    
        
    public List<User_Credentials> selectAllUserCredentials(){
        return null;
    }
    
    public User_Credentials selectUserCredentialsByUserId(int user_id){
        return null;
    }

    public User_Credentials selectUserCredentialsByEmail(String email){
        return null;
    }
    
    public User_Credentials selectUserCredentialsByActivateStatus(int activate_status){
        return null;
    }
    
    public User_Credentials selectUserCredentialsByLoginStatus(int login_status){
        return null;
    }
    
    
    public void insertUserCredentials(User_Credentials userCredentials){
    
    }
    
    public void updateUserCredentialsUserID(int user_id){
    
    }

    public void updateUserCredentialsemail(String email){
    
    }
    
     public void updateUserCredentialsPassword(String password){
    
    }
 
    public void updateUserCredentialsActivateStatus(int activate_status){
    
    }
    
    public void updateUserCredentialsLoginStatus(int login_status){
    
    }    
    
    public void deleteUserCredentials(User_Credentials user_Credentials){
    
    }   
}
