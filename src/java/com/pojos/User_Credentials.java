/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pojos;

/**
 *
 * @author KimOoO
 */
public class User_Credentials {
 
    private int user_id;
    private String email;
    private String password;
    private int activate_status;
    private int login_status;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getActivate_status() {
        return activate_status;
    }

    public void setActivate_status(int activate_status) {
        this.activate_status = activate_status;
    }

    public int getLogin_status() {
        return login_status;
    }

    public void setLogin_status(int login_status) {
        this.login_status = login_status;
    }
    
    
}
