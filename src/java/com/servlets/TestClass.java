/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.servlets;

import com.dal.dao.UserCredentialsHome;
import com.dal.dao.UserHome;
import com.dal.pojo.User;
import com.dal.pojo.UserCredentials;
import java.util.ArrayList;
import java.util.Date;
import org.hibernate.Session;

/**
 *
 * @author KimOoO
 */
public class TestClass {
    public static void main(String[] args) {
        
        
        //UserCredentials uc = new UserCredentials();
        
        User user = new User();
        user.setAddress("haram");
        user.setJob("Mohamy");
        user.setBirthdate(new Date("27/5/1988"));
        user.setFname("mohamed22");
        user.setLname("ahemd22");
        user.setInterests("anything");
      //  user.setId(4);
        UserHome uh = new UserHome();
        
        //uh.merge(user);
        
        ArrayList<User> list = (ArrayList)uh.findByExample(user);
        System.out.println(list.get(0).getAddress());
        System.out.println(list.size());
        System.out.println("Done!");
    }
}
