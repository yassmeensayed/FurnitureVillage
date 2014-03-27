<%-- 
    Document   : Registration
    Created on : Mar 19, 2014, 12:37:37 PM
    Author     : Yassmeen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Add New Product</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/lightbox.css" media="screen" />	
        <script type="text/javascript" src="js/jquery.lightbox.js"></script>
        <script type="text/javascript">


           /* $(document).ready(
            function() {

                fname = document.getElementById("fullname");
                email = document.getElementById("Email");
                address = document.getElementById("address");
                var t = document.getElementById("categories");
                var selectedText = t.options[t.selectedIndex].text;
                username = document.getElementById("username");
                password = document.getElementById("password");
                confirmpassword = document.getElementById("confirmpassword");
                balance = document.getElementById("balance");
                interestsy = document.getElementById("interests");
                $("#signup").click(function() {
                    if (fname != null && email != null && address != null) {
                        $.post("RegisterUser?data="+new Date().getTime()+ new Date().getTime(),
                        {
                            name : $("#fullname").val(),
                            email: $("#Email").val(),
                            password: $("#password").val(),
                            username: $("#username").val(),
                            address: $("#address").val(),
                            interests: $("#interests").val(),
                            balance: $("#balance").val(),
                            bday: $("#bday").val()});
                    }});
            });
*/
        </script>

    </head>
    <body>
        <div class="wrap"> 
            <div class="header">
                <a href="index.jsp">
                    <div class="logo"></div>
                </a>
                <div class="nav-right">
                    <ul class="nav">
                        <li class="active"><a href="index.jsp">Home</a></li>
                    <c:if test="${not empty sessionScope.currentCustomer || not empty sessionScope.currentAdmin}">
                        
                           <li><a href="Logout">Log Out</a></li>
                       
                    </c:if>
                    <c:if test="${ empty sessionScope.currentCustomer && empty sessionScope.currentAdmin}">
                        
                          <li><a href="Registration.jsp">Register</a></li>
                        
                    </c:if>   
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </div>
                               <div class="login">
               <c:if test="${empty sessionScope.currentCustomer && empty sessionScope.currentAdmin}">

                    E-mail: <input type="text"  name="email" id="email"/>
                    Password: <input type="password"  name="password" id ="password"/>
                    <input type="submit" value="Login" id="loginButton"/>
                    <span class="error required">Empty fields</span>
                </c:if>
                <c:if test="${not empty sessionScope.currentCustomer}">
                    <div id="loggedIn">
                        <a href="ViewProfile?date=<%= new java.util.Date().getTime()%>"><c:out value="${sessionScope.currentCustomer.getFullName()}"/>'s Profile</a>
                        <a href="ViewCart?date=<%= new java.util.Date().getTime()%>"><img src="images/cart3.png" style="width: 3em;"/></a>
                    </div>
                </c:if>
            </div>

                <div class="clear"></div>
            </div>
            <div class="menu-bg">
                <ul class="menu">
                    <li><a href="LoadCategoryItems?category=DiningRooms">Dining Rooms</a></li>
                    <li><a href="LoadCategoryItems?category=LivingRooms">Living Rooms</a>
                        <!--<ul>
                            <li><a href="Chairs.jsp" >Chairs</a></li>
                            <li><a href="Sofas.jsp">Sofas</a></li>
                            <li><a href="FirePlaces.jsp">Fire Places</a></li>
                        </ul>-->
                    </li>
                    <li><a href="LoadCategoryItems?category=BedRooms">Bed Rooms</a></li>
                    <li><a href="LoadCategoryItems?category=Kitchens" >Kitchens</a></li>
                </ul> 
                <div class="clear"></div>
            </div>
            <div class="content">
                <div class="section group">				
                    <div class="col span_2_of_3">
                        <div class="contact-form">
                            <form action="AddNewProduct" method="POST" enctype="multipart/form-data">
                            <h2>Add new Item</h2>
                            <div>
                                <span><label>NAME</label></span>
                                <span><input type="text" id="fullname" name="name"/></span><span class="error required">*required</span>
                            </div>
                            <div>
                                <span><label>Avaliable Quantity</label></span>
                                <span><input type="text" id="Email" name="email" /></span><span class="error required" >*required</span>
                            </div>
                            <div>
                                <span><label>Price</label></span>
                                <span><input type="text" id="address" name="address"/></span><span class="error required" >*required</span>
                            </div>
                            <div>
                                <span><label>Category</label></span>
                                <span><select name="categories">
                                        
                                          <option value="Kitchens">Kitchens</option>
                                          <option value="DiningRooms">DiningRooms</option>
                                          <option value="BedRooms">BedRooms</option>
                                          <option value="LivingRooms">LivingRooms</option>
                                        
                                    </select></span>
                            </div>

                           
                            <div>
                                <span><label>Descriptions</label></span>
                                <span><textarea id="interests" name="interests"> </textarea></span><span class="error required" >*required</span>
                            </div>
                                                        <div>
                                <span><label>Image</label></span>
                                <span><input type="file" id="file" name="file"/></span><span class="error required" >*required</span>
                            </div>
                            <div>
                                <input type="submit" id="signup" value="Submit" >
                                <input type="reset" value="Clear">
                            </div>
                            </form>
                        </div>
                    </div>				
                </div>						
            </div>
            <div class="footer">
                <div class="section group">
                    <div class="col_1_of_4 span_1_of_4">
                        <h2>My Account</h2>
                        <ul class="nav1">
                            <li><a href="">Always free from repetition</a></li>
                            <li><a href="">Morbi blandit turpis ewuhre</a></li>
                            <li><a href="">Integer id ante nec elit mo</a></li>
                            <li><a href="">Maecenas accumsan lorem sed</a></li>
                        </ul>
                    </div>
                    <div class="col_1_of_4 span_1_of_4">
                        <h2>Information</h2>
                        <ul class="nav1">
                            <li><a href="">Always free from repetition</a></li>
                            <li><a href="">Morbi blandit turpis ewuhre</a></li>
                            <li><a href="">Integer id ante nec elit mo</a></li>
                            <li><a href="">Maecenas accumsan lorem sed</a></li>
                        </ul>
                    </div>
                    <div class="col_1_of_4 span_1_of_4">
                        <h2>Follow Us</h2>
                        <ul class="nav">
                            <li><a href=""><img src="images/facebook.png" title="facebook" alt=""/></a></li>
                            <li><a href=""><img src="images/twitter.png" title="twitter" alt=""/></a></li>
                            <li><a href=""><img src="images/rss.png" title="rss" alt=""/></a></li>
                        </ul>
                    </div>
                    <div class="col_1_of_4 span_1_of_4">
                        <h2>Contact Us</h2>
                        <ul class="nav">
                            <li><a href=""> 500 Maadi St,</a></li>
                            <li><a href="">22-56-2-9  Cairo, Cairo,</a></li>
                            <li><a href="">Egypt </a></li>
                            <li><a href="">Phone:(00) 222 666 444 </a></li>
                            <li><a href=""> Email: <span>info@mycompany.com</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
