/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.servlets;

import com.dal.dao.UserCredentialsHome;
import com.dal.pojo.UserCredentials;
import org.hibernate.Session;

/**
 *
 * @author KimOoO
 */
public class TestClass {
    public static void main(String[] args) {
        
        
        //UserCredentials uc = new UserCredentials();
        
        UserCredentialsHome uh = new UserCredentialsHome();
        Session session = uh.getSession();
    }
}
