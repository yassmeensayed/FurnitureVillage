package com.dal.pojo;
// Generated Mar 22, 2014 10:38:54 AM by Hibernate Tools 3.2.1.GA



/**
 * AdminUser generated by hbm2java
 */
public class AdminUser  implements java.io.Serializable {


     private Integer id;
     private User user;

    public AdminUser() {
    }

    public AdminUser(User user) {
       this.user = user;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }




}


