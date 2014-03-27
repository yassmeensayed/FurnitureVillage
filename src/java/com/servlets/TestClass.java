/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import com.dal.dao.AdminUserHome;
import com.dal.dao.ItemHome;
import com.dal.dao.ShoppingCartHome;
import com.dal.dao.UserHome;
import com.dal.pojo.Categories;
import com.dal.pojo.Item;
import com.dal.pojo.ShoppingCart;
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
//        ShoppingCartHome sh = new ShoppingCartHome();
//        List<ShoppingCart> findByExample = sh.findByExample(new ShoppingCart());
//                                                                 for (int i = 0; i < findByExample.size(); i++) {
//            System.out.println(findByExample.get(i).getItem().getName() +" : "+ findByExample.get(i).getUser().getFullName());
//        }
        Categories cat = new Categories();
        cat.setId(3);
        ItemHome ih = new ItemHome();

        ArrayList<Item> items = (ArrayList<Item>) ih.findByPriceCategory(cat, new Double(2000), new Double(4000));
        System.out.println(items.size());
    }
}
