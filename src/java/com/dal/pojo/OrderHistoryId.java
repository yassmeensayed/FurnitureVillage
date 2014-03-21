package com.dal.pojo;
// Generated Mar 21, 2014 1:41:05 PM by Hibernate Tools 3.6.0


import java.util.Date;

/**
 * OrderHistoryId generated by hbm2java
 */
public class OrderHistoryId  implements java.io.Serializable {


     private int userId;
     private Date orderDate;

    public OrderHistoryId() {
    }

    public OrderHistoryId(int userId, Date orderDate) {
       this.userId = userId;
       this.orderDate = orderDate;
    }
   
    public int getUserId() {
        return this.userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public Date getOrderDate() {
        return this.orderDate;
    }
    
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof OrderHistoryId) ) return false;
		 OrderHistoryId castOther = ( OrderHistoryId ) other; 
         
		 return (this.getUserId()==castOther.getUserId())
 && ( (this.getOrderDate()==castOther.getOrderDate()) || ( this.getOrderDate()!=null && castOther.getOrderDate()!=null && this.getOrderDate().equals(castOther.getOrderDate()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getUserId();
         result = 37 * result + ( getOrderDate() == null ? 0 : this.getOrderDate().hashCode() );
         return result;
   }   


}

