<%-- 
    Document   : BedRooms
    Created on : Mar 20, 2014, 6:27:02 PM
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
        <title>The Free Extro-Electronics Website Template | Home :: w3layouts</title>
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
                        <li><a href="Registration.jsp">Register</a></li>
                        <li><a href="Contact.jsp">Contact</a></li>
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
                    <li><a href="LoadCategoryItems?category=LivingRooms">Living Rooms</a></li>
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
            <c:if test="${empty requestScope.pageName}">
                <script>
                    alert("Please choose one of the categories in the shown menu");
                </script>>
            </c:if>
            <div class="text-h">
                <h2><c:out value="${requestScope.pageName}"/></h2>
            </div>
            <!--   <div class="single">
                   <div class="PagePath">
                       <p class="left"><a href="index.jsp">Home&nbsp;></a></p>
                       <p class="pageInfo">There are 56 Products.</p>
                       <div class="clear"></div>
                   </div>
               </div>-->
            <div class="section group">
                <c:forEach items="${requestScope.categoryItems}" var="imagepath">

                    <div class="col_1_of_5 span_1_of_5">
                        <div class="grid-img">
                            <a href="ViewItem?itemId=${imagepath.getItemId()}"><img src=<c:out value="images/${requestScope.category}/${imagepath.getImage()}"/> alt="" width="168px" height="164px"/></a> 
                        </div>
                        <p class="categoryItemName"><c:out value="${imagepath.getName()}"/></p>
                        <c:if test="${not empty sessionScope.currentCustomer}">
                            <c:if test="${imagepath.getAvailableQuantity()>0}">
                            <div class="button add"><a href="AddToCart?date=<%new java.util.Date().getTime();%>&itemId=${imagepath.getItemId()}&category=${requestScope.category}"><img src="images/LivingRooms/add.png" alt=""/></a></div>    
                            </c:if>
                        </c:if>
                        <button class="left"><c:out value="$${imagepath.getPrice()}"/></button>
                        <div class="btn right"><a href="ViewItem?itemId=${imagepath.getItemId()}">view</a></div>

                    </div>
                </c:forEach>
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
        </div>
    </body>
</html>