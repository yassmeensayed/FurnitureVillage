/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.servlets;

import com.dal.dao.UserHome;
import com.dal.pojo.User;
import java.util.ArrayList;
import java.util.Date;
import org.hibernate.Session;

/**
 *
 * @author KimOoO
 */
public class TestClass {
    public static void main(String[] args) {
        
        User user = new User();
        user.setEmail("yassmeen@gmail.com");
        user.setActiveStatus(Boolean.TRUE);
        user.setAddress("maadi");
        user.setBirthdate(new Date("1/1/2014"));
        user.setFullName("Kareem Moustafa");
        user.setPassword("123");
        user.setLoginStatus(Boolean.FALSE);
        user.setJob("doc");
        
        UserHome uh = new UserHome();
        uh.persist(user);
        
        User user2 = uh.findById(user.getId());
        System.out.println(user2.getId() + " " + user2.getFullName());
        System.out.println("Done!");
    }
}
