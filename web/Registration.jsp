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
        <title>Registration</title>
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
            function updateSignUpArea(responseTxt, statusTxt, xhr) {
                if (statusTxt == "success") {
                    $(".error.required:eq(0)").css("display", "block");
                    $(".error.required:eq(0)").html(responseTxt);
                    $("#Email").val(responseTxt);
                    location.href="index.jsp"
                    
                }
            }
            $(document).ready(
            function() {

                fname = document.getElementById("fullname");
                email = document.getElementById("Email");
                address = document.getElementById("address");
                bday = document.getElementById("bday");
                username = document.getElementById("username");
                password = document.getElementById("password");
                confirmpassword = document.getElementById("confirmpassword");
                balance = document.getElementById("balance");
                interestsy = document.getElementById("interests");
                $("#signup").click(function() {
                    if (validateName() && validateEmail() && validateAddress() && validateBirthday() && validatePassword() && confirmPassword() && validateinterests()) {
                        $.post("RegisterUser?data="+new Date().getTime()+ new Date().getTime(),
                        {
                            name : $("#fullname").val(),
                            email: $("#Email").val(),
                            password: $("#password").val(),
                            username: $("#username").val(),
                            address: $("#address").val(),
                            interests: $("#interests").val(),
                            balance: $("#balance").val(),
                            bday: $("#bday").val()}, updateSignUpArea);
                    }});
                
                $("#fullname").focusout(function() {
                    validateName()
                });
                $("#Email").focusout(function() {
                    validateEmail()
                });
                $("#address").focusout(function() {
                    validateAddress()
                });
                $("#bday").focusout(function() {
                    validateBirthday()
                });
                $("#password").focusout(function() {
                    validatePassword()
                });
                $("#confirmpassword").focusout(function() {
                    confirmPassword()
                });
                $("#interests").focusout(function() {
                    validateinterests()
                });
                function validateName() {
                    var namePattern = /^[a-zA-Z]/;
                    if (fname.value == null || fname.value.trim() == "" || !namePattern.test(fname.value)) {
                        $(".error.required:eq(0)").css("display", "inline");
                        return false;
                    } else {
                        $(".error.required:eq(0)").css("display", "none");
                        return true;
                    }
                }
                function validateEmail() {
                    atpos = email.value.indexOf("@");
                    dotpos = email.value.lastIndexOf(".");
                    if (atpos < 1 || (dotpos - atpos < 2) || email.value.trim() == "")
                    {
                        $(".error.required:eq(1)").css("display", "inline");
                        return false;
                    } else {
                        $(".error.required:eq(1)").css("display", "none");
                        return true;
                    }
                }
                function validateAddress() {
                    var namePattern = /^[a-zA-Z]/;
                    if (address.value == null || address.value.trim() == "" || !namePattern.test(address.value)) {
                        $(".error.required:eq(2)").css("display", "inline");
                        return false;
                    } else {
                        $(".error.required:eq(2)").css("display", "none");
                        return true;
                    }
                }

                function validatePassword() {
                    var passwordPattern = /^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[@#$%]).{6,20}$/;
                    if (password.value == null || password.value.trim() == "" || !passwordPattern.test(password.value)) {
                        $(".error.required:eq(5)").css("display", "inline");
                        return false;
                    } else {
                        $(".error.required:eq(5)").css("display", "none");
                        return true;
                    }
                }

                function validateBirthday()
                {
                    //yyyy-mm-dd 
                    var bdayPattern = /^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$/;
                    if (bday.value == null || bday.value.trim() == "" || !bdayPattern.test(bday.value)) {
                        $(".error.required:eq(3)").css("display", "inline");
                        return false;
                    } else {
                        $(".error.required:eq(3)").css("display", "none");
                        return true;
                    }
                }
                function confirmPassword()
                {
                    if (confirmpassword.value == null || confirmpassword.value.trim() == "" || !(confirmpassword.value === password.value)) {
                        $(".error.required:eq(6)").css("display", "inline");
                        return false;
                    } else {
                        $(".error.required:eq(6)").css("display", "none");
                        return true;
                    }
                }
                function validateinterests()
                {
                    var namePattern = /^[a-zA-Z]/;
                    if (interestsy.value == null || interestsy.value.trim() == "" || !namePattern.test(interestsy.value)) {
                        $(".error.required:eq(8)").css("display", "inline");
                        return false;
                    } else {
                        $(".error.required:eq(8)").css("display", "none");
                        return true;
                    }
                }


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
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </div>
                <!--                <div class="login">
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
            </div>-->

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
                            <h2>Register</h2>
                            <div>
                                <span><label>NAME</label></span>
                                <span><input type="text" id="fullname" name="name"/></span><span class="error required">*</span>
                            </div>
                            <div>
                                <span><label>E-MAIL</label></span>
                                <span><input type="text" id="Email" name="email" /></span><span class="error required" >yourmail@abc.com*</span>
                            </div>
                            <div>
                                <span><label>ADDRESS</label></span>
                                <span><input type="text" id="address" name="address"/></span><span class="error required" >*</span>
                            </div>
                            <div>
                                <span><label>BIRTHDAY</label></span>
                                <span><input type="text" id="bday" name="bday"/></span><span class="error required" >yyyy-mm-dd*</span>
                            </div>
                            <div>
                                <span><label>USERNAME</label></span>
                                <span><input type="text" id="username" name="username"/></span><span class="error required" >*</span>
                            </div>
                            <div>
                                <span><label>PASSWORD</label></span>
                                <span><input type="password" id="password" name="password"/></span><span class="error required" >Password should contain capital and small letter,numbers, special character @#$% , and its size not less than 6*</span>
                            </div>
                            <div>
                                <span><label>CONFIRM PASSWORD</label></span>
                                <span><input type="password" id="confirmpassword" name="confpassword"/><span class="error required" >*</span>
                            </div>
                            <div>
                                <span><label>BALANCE</label></span>
                                <span><input type="text" id="balance" name="balance" /></span><span class="error required" >*</span>
                            </div>
                            <div>
                                <span><label>INTERESTS</label></span>
                                <span><textarea id="interests" name="interests"> </textarea></span><span class="error required" >*</span>
                            </div>
                            <div>
                                <input type="submit" id="signup" value="Submit">
                                <input type="reset" value="Clear">
                            </div>

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
