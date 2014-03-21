package com.dal.pojo;
// Generated Mar 21, 2014 1:41:05 PM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * Item generated by hbm2java
 */
public class Item  implements java.io.Serializable {


     private Integer itemId;
     private Categories categories;
     private String name;
     private Integer availableQuantity;
     private Double price;
     private byte[] image;
     private String description;
     private Set shoppingCarts = new HashSet(0);

    public Item() {
    }

	
    public Item(Categories categories) {
        this.categories = categories;
    }
    public Item(Categories categories, String name, Integer availableQuantity, Double price, byte[] image, String description, Set shoppingCarts) {
       this.categories = categories;
       this.name = name;
       this.availableQuantity = availableQuantity;
       this.price = price;
       this.image = image;
       this.description = description;
       this.shoppingCarts = shoppingCarts;
    }
   
    public Integer getItemId() {
        return this.itemId;
    }
    
    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }
    public Categories getCategories() {
        return this.categories;
    }
    
    public void setCategories(Categories categories) {
        this.categories = categories;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Integer getAvailableQuantity() {
        return this.availableQuantity;
    }
    
    public void setAvailableQuantity(Integer availableQuantity) {
        this.availableQuantity = availableQuantity;
    }
    public Double getPrice() {
        return this.price;
    }
    
    public void setPrice(Double price) {
        this.price = price;
    }
    public byte[] getImage() {
        return this.image;
    }
    
    public void setImage(byte[] image) {
        this.image = image;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    public Set getShoppingCarts() {
        return this.shoppingCarts;
    }
    
    public void setShoppingCarts(Set shoppingCarts) {
        this.shoppingCarts = shoppingCarts;
    }




}


