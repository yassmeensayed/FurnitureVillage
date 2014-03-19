<%-- 
    Document   : Registration
    Created on : Mar 19, 2014, 12:37:37 PM
    Author     : Yassmeen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>The Free Extro-Electronics Website Template | Contact :: w3layouts</title>
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
            $(document).ready(
            function(){
                $("#signup").click(function(){
                    fname=document.getElementById("fullname");
                    email=document.getElementById("Email");
                    address=document.getElementById("address");
                    bday=document.getElementById("bday");
                    username = document.getElementById("username");
                    password = document.getElementById("password");
                    confirmpassword = document.getElementById("confirmpassword");
                    balance = document.getElementById("balance");
                    interests= document.getElementById("interests");
                    if(validateName()&&validateEmail()&&validateUsername()&&validatePassword()&&validateBalance()){
				
                    }
                });
                 function validateName(){
                var namePattern=/^[a-zA-Z]/;
                if(fname.value==null || fname.value.trim()==""||!namePattern.test(fname.value)){
                    $(".error.required:eq(0)").css("display","inline");
                    return false;
                }
                return true;
            }
            function validateEmail(){
                atpos = email.value.indexOf("@");
                dotpos = email.value.lastIndexOf(".");
                if (atpos < 1 || ( dotpos - atpos < 2 )||email.value.trim()=="") 
                {
                    $(".error.required:eq(1)").css("display","inline");
                    return false;
                }
		  
                return( true );
            }
            function validateAddress(){
                var namePattern=/^[a-zA-Z]/;
                if(fname.value==null || fname.value.trim()==""||!namePattern.test(fname.value)){
                    $(".error.required:eq(0)").css("display","inline");
                    return false;
                }
                return true;
            }
            }
        );
           

        
        </script>
    </head>
    <body>
        <div class="wrap"> 
            <div class="header">
                <a href="index.html">
                    <div class="logo"></div>
                </a>
                <div class="nav-right">
                    <ul class="nav">
                        <li class="active"><a href="index.html">Home</a></li>
                        <li><a href="about.html">About</a></li>
                        <li><a href="Register.html">Register</a></li>
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <div class="menu-bg">
                <ul class="menu">
                    <li><a href="home-appliances.html">Dining Rooms</a></li>
                    <li><a href="accessories.html">Living Rooms</a>
                        <ul>
                            <li><a href="accessories.html" >Chairs</a></li>
                            <li><a href="accessories.html">Sofas</a></li>
                            <li><a href="accessories.html">Fire Places</a></li>
                        </ul>
                    </li>
                    <li><a href="computing.html">Bed Rooms</a></li>
                    <li><a href="accessories.html" >Kitchens</a></li>
                </ul> 
                <div class="search">
                    <form>
                        <input type="text" value="">
                        <input type="submit" value="">
                    </form>
                </div>
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
                                <span><input type="text" id="email" name="email" /></span><span class="error required" >*</span>
                            </div>
                            <div>
                                <span><label>ADDRESS</label></span>
                                <span><input type="text" id="address" name="address"/></span>
                            </div>
                            <div>
                                <span><label>BIRTHDAY</label></span>
                                <span><input type="text" id="bday" name="bday"/></span>
                            </div>
                            <div>
                                <span><label>USERNAME</label></span>
                                <span><input type="text" id="username" name="username"/></span><span class="error required" >*</span>
                            </div>
                            <div>
                                <span><label>PASSWORD</label></span>
                                <span><input type="password" id="password" name="password"/></span><span class="error required" >*</span>
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
                                <span><textarea id="interests" name="interests"> </textarea></span>
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
