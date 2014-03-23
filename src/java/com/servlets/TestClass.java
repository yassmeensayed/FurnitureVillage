/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.servlets;

import com.dal.dao.AdminUserHome;
import com.dal.dao.ItemHome;
import com.dal.dao.UserHome;
import com.dal.pojo.Categories;
import com.dal.pojo.Item;
import com.dal.pojo.User;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author KimOoO
 */
public class TestClass {
    public static void main(String[] args) {
        
       /* User user = new User();
        user.setEmail("yassmeen@gmail.com");
        user.setActiveStatus(Boolean.TRUE);
        user.setAddress("maadi");
        user.setBirthdate(new Date("1/1/2014"));
        user.setFullName("Kareem Moustafa");
        user.setPassword("123");
        user.setLoginStatus(Boolean.FALSE);
        user.setJob("doc");*/
        
        UserHome uh = new UserHome();
        //uh.persist(user);
        
        //ArrayList<User> user2 = (ArrayList<User>)uh.findByEmail("yassmeen@gmail.com");
        
        User user =  uh.findById(new Integer(21));
        
        AdminUserHome ah = new AdminUserHome();
        
        System.out.println(ah.isAdminUser(user));
        //System.out.println(user2.get(0).getId() + " " + user2.get(0).getFullName());
        
        /*ItemHome ih = new ItemHome();
        Categories cat = new Categories();
        cat.setId(1);
        ArrayList<Item> item = (ArrayList<Item>)ih.findByCategory(cat);
        System.out.println(item.get(0).getPrice() + " " + item.get(0).getName());*/

        System.out.println("Done!");
    }
}
