<%-- 
    Document   : Details
    Created on : Mar 20, 2014, 6:30:05 PM
    Author     : Yassmeen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Furniture Village</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" type="text/css" href="css/lightbox.css" media="screen" />
        <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery.lightbox.js"></script>
        <script type="text/javascript">
            $(function() {
                $('.grid-img1 a').lightBox();
            });
        </script>
        <script src="js/jquery-slider.js" type="text/javascript"></script>
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
                        <li><a href="Registration.jsp">Register</a></li>
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </div>

                <div class="login">
                    <c:if test="${empty sessionScope.currentCustomer}">

                        E-mail: <input type="text"  name="email" id="email"/>
                        Password: <input type="password"  name="password" id ="password"/>
                        <input type="submit" value="Login" id="loginButton"/>
                        <span class="error required">Empty fields</span>
                    </c:if>
                    <c:if test="${not empty sessionScope.currentCustomer}">
                        <div id="loggedIn">
                            <a href="ViewProfile?date=<%= new java.util.Date().getTime()%>"><c:out value="${sessionScope.currentCustomer.getFullName()}"/>'s Profile</a>
                            <a href="ViewCart?date=<%= new java.util.Date().getTime()%>"><img src="images/cart3.png" style="width: 3em;"/></a>
                        </div>>
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
                    <div class="cont span_2_of_3">
                        <div class="single">
                            <h2><a href="index.jsp">Home</a></h2>
                            <div class="grid-img1">
                                <a href="images/${requestScope.category}/${item.getImage()}"><img src="images/${requestScope.category}/${item.getImage()}"></a> 
                            </div>
                            <div class="para">
                                <h4><c:out value="${item.getName()}"/></h4>
                                <div class="cart-b">
                                    <button class="left rs">$<c:out value="${item.getPrice()}"/></button>
                                    <c:if test="${not empty sessionScope.currentCustomer}">
                                        <c:if test="${item.getAvailableQuantity()>0}">
                                        <div class="btn right"><a href="AddToCart?date=<%new java.util.Date().getTime();%>&itemId=${item.getItemId()}">Add to Cart</a></div>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${empty sessionScope.currentCustomer}">
                                        <div class="btn right"><a href="index.jsp">Login to purchase</a></div>
                                    </c:if>

                                    <div class="clear"></div>
                                </div>
                                <h5><c:out value="${item.getAvailableQuantity()}"/> items in stock</h5>
                                <p><c:out value="${item.getDescription()}"/></p>
                            </div>
                            <div class="clear"></div>	
                        </div>
                        <!--                        <div class="text-h1 top">
                                                    <h2>20 other products in the same category</h2>
                                                </div>
                                                <div class="div2">
                                                    <div id="mcts1">
                                                        <img src="images/pic4.jpg" />
                                                        <img src="images/pic5.jpg" />
                                                        <img src="images/pic6.jpg" />
                                                        <img src="images/pic7.jpg" />
                                                        <img src="images/pic8.jpg" />
                                                        <img src="images/pic5.jpg" />
                                                    </div>
                                                </div>-->
                    </div>
                    <div class="rsidebar span_1_of_3">
                        <div class="sidebar">
                            <h2>Cart</h2>
                            <p class="left">No Products</p>
                            <button class="right">-</button>
                            <div class="clear"></div>
                            <p class="left">Shipping</p>
                            <button class="right">$32.58</button>
                            <div class="clear"></div>
                            <p class="left">Export</p>
                            <button class="right">$45.23</button>
                            <div class="clear"></div>
                            <p class="left">Import</p>
                            <button class="right">$23.58</button>
                            <div class="clear"></div>
                            <p class="left">Total</p>
                            <button class="right">$100.420</button>
                            <div class="clear"></div>
                            <c:if test="${not empty sessionScope.currentCustomer}">
                                <c:if test="${item.getAvailableQuantity()>0}">
                                <div class="btn top"><a href="AddToCart?date=<%new java.util.Date().getTime();%>&itemId=${item.getItemId()}">Add to Cart</a></div>            
                                </c:if>                                
                            </c:if>
                            <c:if test="${empty sessionScope.currentCustomer}">
                                <div class="btn top"><a href="index.jsp">Login to purchase</a></div>
                            </c:if>

                        </div>
                        <div class="clear"></div>
                        <div class="sidebar">
                            <h2>Categories</h2>
                            <ul class="nav1">
                                <li><a href="LoadCategoryItems?category=DiningRooms">Dining Rooms</a></li>
                                <li><a href="LoadCategoryItems?category=LivingRooms">Living Rooms</a></li>
                                <li><a href="LoadCategoryItems?category=BedRooms">Bed Rooms</a></li>
                                <li><a href="LoadCategoryItems?category=Kitchens">Kitchens</a></li>
                            </ul>
                        </div>
                        <div class="clear"></div>
                        <!--                        <div class="sidebar">
                                                    <h2>Top Sellers</h2>
                                                    <div class="listview_1_of_2 images_1_of_2">
                                                        <div class="listimg listimg_2_of_1">
                                                            <img src="images/pic4.jpg" alt=""/>
                                                        </div>
                                                        <div class="text list_2_of_1">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt  ut labore</p>
                                                        </div>
                                                    </div>
                                                    <div class="listview_1_of_2 images_1_of_2">
                                                        <div class="listimg listimg_2_of_1">
                                                            <img src="images/pic5.jpg" alt=""/>
                                                        </div>
                                                        <div class="text list_2_of_1">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt  ut labore</p>
                                                        </div>
                                                    </div>
                                                    <div class="listview_1_of_2 images_1_of_2">
                                                        <div class="listimg listimg_2_of_1">
                                                            <img src="images/pic6.jpg" alt=""/>
                                                        </div>
                                                        <div class="text list_2_of_1">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt  ut labore</p>
                                                        </div>
                                                    </div>
                                                </div>-->
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
                            <li><a href=""> 500 Lorem Ipsum Dolor Sit,</a></li>
                            <li><a href="">22-56-2-9 Sit Amet, Lorem,</a></li>
                            <li><a href="">USA </a></li>
                            <li><a href="">Phone:(00) 222 666 444 </a></li>
                            <li><a href=""> Email: <span>info@mycompany.com</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer1">
                <p class="w3-link">© All Rights Reserved | Designed by&nbsp; <a href="http://w3layouts.com/"> W3Layouts</a></p>
            </div>
        </div>
    </body>
</html>