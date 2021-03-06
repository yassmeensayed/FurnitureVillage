<%-- 
    Document   : index
    Created on : Mar 14, 2014, 1:49:17 PM
    Author     : KimOoO
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
        <title>Furniture Village</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!--slider-->
        <script src="js/modernizr.js"></script>
        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>
        <!-- FlexSlider -->
        <script defer src="js/jquery.flexslider.js"></script>
        <script type="text/javascript">
            
//            $(document).ready(function(){
//                
//            });

        </script>
        <script src="js/searchbarScript.js"></script>
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
                    <c:if test="${not empty sessionScope.currentAdmin}">
                        <div id="loggedInAdmin">
                            <a href="Admin.jsp?date=<%= new java.util.Date().getTime()%>"><font color="RED">Admin Panel</font></a>
                            <a href="ViewProfile?date=<%= new java.util.Date().getTime()%>"><c:out value="${sessionScope.currentAdmin.getFullName()}"/>'s Profile</a>
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
                 <div class="search">
                    Search By:<select id="sortBy">
                        <option>Category</option>
                        <option>Price</option>
                    </select>
                    <span id="priceSearch" style="display: none;"><input type="text" id="startPrice"value="" style="width:50px"/>
                    -
                    <input type="text" id="endPrice" value="" style="width:50px"/>
                    </span>
                    <span id="categorySearch"><input type="text" id="categoryName" value=""></span>
                    <input type="submit" id="searchButton" value="">

                </div>
                <div class="clear"></div>
            </div>
            <div class="flexslider">
                <div class="flex-viewport" style="overflow: hidden; position: relative;">
                    <ul class="slides" style="width: 100%; -webkit-transition: 0.6s; transition: 0.6s; -webkit-transform: translate3d(-5032px, 0, 0);">
                        <li class="clone" style="width: 100%; float: left; display: block;">
                            <img src="images/LivingRooms/classic  sofa.jpg" alt=""/>
                        </li>
                        <li style="width: 100%; float: left; display: block;" class="">
                            <img src="images/BedRooms/sliderimg2.jpg" alt=""/>
                        </li>
                        <li class="" style="width:100%; float: left; display: block;">
                            <img src="images/DiningRooms/dining.jpg" alt=""/>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="content">
                <div class="section group">
                    <div class="col_1_of_3 span_1_of_4">
                        <div class="grid-imgs" >
                            <a href="LoadCategoryItems?category=DiningRooms"><img src="images/DiningRooms/diningroomCategory.png" alt=""/></a> 
                        </div>
                        <h2>Dinig Rooms </h2>
                        <p>We have a variety of dining room designs.</p>
                    </div>
                    <div class="col_1_of_3 span_1_of_4">
                        <div class="grid-imgs">
                            <a href="LoadCategoryItems?category=LivingRooms"><img src="images/LivingRooms/livingroomCategory.png" alt=""/></a> 
                        </div>
                        <h2>Living Rooms </h2>
                        <p>We have a variety of living room designs. We also have different comfy chairs and sofas</p>
                    </div>
                    <div class="col_1_of_3 span_1_of_4">
                        <div class="grid-imgs">
                            <a href="LoadCategoryItems?category=BedRooms"><img src="images/BedRooms/bedroomCategory.png" alt=""/></a> 
                        </div>
                        <h2>Bed Rooms </h2>
                        <p>We have a variety of bed room designs.</p>
                    </div>
                    <div class="col_1_of_3 span_1_of_4" id="kitchen">
                        <div class="grid-imgs">
                            <a href="LoadCategoryItems?category=Kichens"><img id="kitchen" src="images/Kitchens/kitchenCategory.png" alt=""/></a> 
                        </div>
                        <h2>Kitchens </h2>
                        <p>We have a variety of kitchen designs.</p>
                    </div>
                </div>
<!--                <div class="text-h">
                    <h2>feature products</h2>
                </div>
                <div class="section group">
                    <div class="col_1_of_5 span_1_of_5" style="margin-left: 0px;">
                        <div class="grid-img">
                            <a href="details.jsp"><img src="images/LivingRooms/lamp.jpg" alt=""/></a> 
                        </div>
                        <p>Sed do eiusmod tempor incididunt ut labore et dolore.</p>
                        <button class="left">$23.58</button>
                        <div class="btn right"><a href="Details.jsp">view</a></div>
                    </div>
                    <div class="col_1_of_5 span_1_of_5">
                        <div class="grid-img">
                            <a href="Details.jsp"><img src="images/Chairs and sofa/chair.jpg" alt=""/></a> 
                        </div>
                        <p>Sed do eiusmod tempor incididunt ut labore et dolore.</p>
                        <button class="left">$23.58</button>
                        <div class="btn right"><a href="Details.jsp">view</a></div>
                    </div>
                    <div class="col_1_of_5 span_1_of_5">
                        <div class="grid-img">
                            <a href="Details.jsp"><img src="images/tables/table1.jpg" alt=""/></a> 
                        </div>
                        <p>Sed do eiusmod tempor incididunt ut laboreet dolore.</p>
                        <button class="left">$23.58</button>
                        <div class="btn right"><a href="Details.jsp">view</a></div>
                    </div>
                    <div class="col_1_of_5 span_1_of_5">
                        <div class="grid-img">
                            <a href="Details.jsp"><img src="images/Chairs and sofa/shalta.jpg" alt=""/></a> 
                        </div>
                        <p>Sed do eiusmod tempor incididunt ut labore et dolore.</p>
                        <button class="left">$23.58</button>
                        <div class="btn right"><a href="Details.jsp">view</a></div>
                    </div>
                    <div class="col_1_of_5 span_1_of_5">
                        <div class="grid-img">
                            <a href="Details.jsp"><img src="images/DiningRooms/American-Furniture.jpg" width="160px" alt=""/></a> 
                        </div>
                        <p>Sed do eiusmod tempor incididunt ut labore et dolore.</p>
                        <button class="left">$23.58</button>
                        <div class="btn right"><a href="Details.jsp">view</a></div>
                    </div>
                </div>-->
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
