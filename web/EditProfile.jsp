<%-- 
    Document   : EditProfile
    Created on : Mar 20, 2014, 6:32:09 PM
    Author     : Yassmeen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <li><a href="Registration.jsp">Register</a></li>
                        <li><a href="Contact.jsp">Contact</a></li>
                    </ul>
                </div>
                <div class="login">

                    E-mail: <input type="text"  name="email" id="email"/>
                    Password: <input type="password"  name="password" id ="password"/>
                    <input type="submit" value="Login" id="loginButton"/>
                    <span class="error required">Empty fields</span>

                </div>
                <div class="clear"></div>
            </div>
            <div class="menu-bg">
                <ul class="menu">
                    <li><a href="DiningRooms.jsp">Dining Rooms</a></li>
                    <li><a href="LivingRooms.jsp">Living Rooms</a>
                        <!--<ul>
                            <li><a href="Chairs.jsp" >Chairs</a></li>
                            <li><a href="Sofas.jsp">Sofas</a></li>
                            <li><a href="FirePlaces.jsp">Fire Places</a></li>
                        </ul>-->
                    </li>
                    <li><a href="BedRooms.jsp">Bed Rooms</a></li>
                    <li><a href="Kitchens.jsp" >Kitchens</a></li>
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
                            <h2>Edit Profile</h2>
                            <form action="" method="post">
                                <div>
                                    <span><label>NAME</label></span>
                                    <span><input type="text" name="fname" value="Lubna Helaly"/></span>
                                </div>
                                <div>
                                    <span><label>E-MAIL</label></span>
                                    <span><input type="text" name="email" value="lubna.m.helaly@gmail.com" /></span>
                                </div>
                                <div>
                                    <span><label>ADDRESS</label></span>
                                    <span><input type="text" name="address" value="Heliopolis"/></span>
                                </div>
                                <div>
                                    <span><label>BIRTHDAY</label></span>
                                    <span><input type="text" name="bday" value="18/4/1990"/></span>
                                </div>
                                <div>
                                    <span><label>USERNAME</label></span>
                                    <span><input type="text" name="username" value="Lubna"/></span>
                                </div>
                                <div>
                                    <span><label>OLD PASSWORD</label></span>
                                    <span><input type="password" name="password"/></span>
                                </div>
                                <div>
                                    <span><label>NEW PASSWORD</label></span>
                                    <span><input type="password" name="confpassword"/></span>
                                </div>
                                <div>
                                    <span><label>CONFIRM PASSWORD</label></span>
                                    <span><input type="password" name="confpassword"/></span>
                                </div>
                                <div>
                                    <span><label>BALANCE</label></span>
                                    <span><input type="text" name="balance" value="100 EGP" /></span>
                                </div>
                                <div>
                                    <span><label>INTERESTS</label></span>
                                    <span><textarea name="interests"> Chrochet</textarea></span>
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