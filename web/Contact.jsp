<%-- 
    Document   : Contact
    Created on : Mar 20, 2014, 9:05:56 PM
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
        <title>Contact</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/lightbox.css" media="screen" />	
        <script type="text/javascript" src="js/jquery.lightbox.js"></script>
        <script type="text/javascript">
            $(function() {
                $('.grid-img a').lightBox();
            });
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
                    <div class="col span_1_of_3">
                        <div class="contact_info">
                            <h2>Find Us Here</h2>
                            <div class="map">
                                <iframe width="100%" height="175" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265&amp;output=embed"></iframe><br><small><a href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265" style="color:#666;text-align:left;font-size:12px">View Larger Map</a></small>
                            </div>
                        </div>
                        <div class="company_address">
                            <h2>Company Information :</h2>
                            <p>500 Lorem Ipsum Dolor Sit,</p>
                            <p>22-56-2-9 Sit Amet, Lorem,</p>
                            <p>USA</p>
                            <p>Phone:(00) 222 666 444</p>
                            <p>Fax: (000) 000 00 00 0</p>
                            <p>Email: <span>info@mycompany.com</span></p>
                            <p>Follow on: <span>Facebook</span>, <span>Twitter</span></p>
                        </div>
                    </div>				
                    <div class="col span_2_of_3">
                        <div class="contact-form">
                            <h2>Contact Us</h2>
                            <form>
                                <div>
                                    <span><label>NAME</label></span>
                                    <span><input type="text" value="" /></span>
                                </div>
                                <div>
                                    <span><label>E-MAIL</label></span>
                                    <span><input type="text" value="" /></span>
                                </div>
                                <div>
                                    <span><label>MOBILE</label></span>
                                    <span><input type="text" value="" /></span>
                                </div>
                                <div>
                                    <span><label>SUBJECT</label></span>
                                    <span><textarea> </textarea></span>
                                </div>
                                <div>
                                    <span><input type="submit" value="Submit"></span>
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
            <div class="footer1">
                <p class="w3-link">© All Rights Reserved | Designed by&nbsp; <a href="http://w3layouts.com/"> W3Layouts</a></p>
            </div>
        </div>
    </body>
</html>