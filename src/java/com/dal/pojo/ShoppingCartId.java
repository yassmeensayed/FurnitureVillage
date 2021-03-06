package com.dal.pojo;
// Generated Mar 22, 2014 10:38:54 AM by Hibernate Tools 3.2.1.GA



/**
 * ShoppingCartId generated by hbm2java
 */
public class ShoppingCartId  implements java.io.Serializable {


     private int userId;
     private int itemId;

    public ShoppingCartId() {
    }

    public ShoppingCartId(int userId, int itemId) {
       this.userId = userId;
       this.itemId = itemId;
    }
   
    public int getUserId() {
        return this.userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public int getItemId() {
        return this.itemId;
    }
    
    public void setItemId(int itemId) {
        this.itemId = itemId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof ShoppingCartId) ) return false;
		 ShoppingCartId castOther = ( ShoppingCartId ) other; 
         
		 return (this.getUserId()==castOther.getUserId())
 && (this.getItemId()==castOther.getItemId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getUserId();
         result = 37 * result + this.getItemId();
         return result;
   }   


}


