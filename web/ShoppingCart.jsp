<%-- 
    Document   : LivingRooms
    Created on : Mar 20, 2014, 6:29:05 PM
    Author     : Yassmeen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <li><a href="contact.html">Contact</a></li>
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
            <div class="text-h">
                <h2><font color="gray"><center>Shopping Cart</center></font></h2>
            </div>
            <div class="section group">
                <div class="col_1_of_5 span_1_of_5">
                    <div class="button add"><a href="view.html"><img src="images/LivingRooms/view.png" alt=""/></a></div><br>
                    <div class="grid-img">
                        <a href="details.html"><img src="images/Chairs and sofa/chair.jpg" alt=""/></a> 
                    </div>
                    <button class="left">$23.58</button>
                    <div class="button add"><a href="details.html"><img src="images/LivingRooms/add.png" alt=""/></a></div>
                    <div class="button remove"><a href="details.html"><img src="images/LivingRooms/remove.png" alt=""/></a></div>
                </div>
                <div class="col_1_of_5 span_1_of_5">
                    <div class="button add"><a href="view.html"><img src="images/LivingRooms/view.png" alt=""/></a></div><br>
                    <div class="grid-img">
                        <a href="details.html"><img src="images/Chairs and sofa/chair.jpg" alt=""/></a> 
                    </div>
                    <button class="left">$23.58</button>
                    <div class="button add"><a href="details.html"><img src="images/LivingRooms/add.png" alt=""/></a></div>
                    <div class="button remove"><a href="details.html"><img src="images/LivingRooms/remove.png" alt=""/></a></div>
                </div>
                <div class="col_1_of_5 span_1_of_5">
                    <div class="button add"><a href="view.html"><img src="images/LivingRooms/view.png" alt=""/></a></div><br>
                    <div class="grid-img">
                        <a href="details.html"><img src="images/Chairs and sofa/chair.jpg" alt=""/></a> 
                    </div>
                    <button class="left">$23.58</button>
                    <div class="button add"><a href="details.html"><img src="images/LivingRooms/add.png" alt=""/></a></div>
                    <div class="button remove"><a href="details.html"><img src="images/LivingRooms/remove.png" alt=""/></a></div>
                </div>
                <div class="col_1_of_5 span_1_of_5">
                    <div class="button add"><a href="view.html"><img src="images/LivingRooms/view.png" alt=""/></a></div><br>
                    <div class="grid-img">
                        <a href="details.html"><img src="images/Chairs and sofa/chair.jpg" alt=""/></a> 
                    </div>
                    <button class="left">$23.58</button>
                    <div class="button add"><a href="details.html"><img src="images/LivingRooms/add.png" alt=""/></a></div>
                    <div class="button remove"><a href="details.html"><img src="images/LivingRooms/remove.png" alt=""/></a></div>
                </div>
                <div class="col_1_of_5 span_1_of_5">
                    <div class="button add"><a href="view.html"><img src="images/LivingRooms/view.png" alt=""/></a></div><br>
                    <div class="grid-img">
                        <a href="details.html"><img src="images/Chairs and sofa/chair.jpg" alt=""/></a> 
                    </div>
                    <button class="left">$23.58</button>
                    <div class="button add"><a href="details.html"><img src="images/LivingRooms/add.png" alt=""/></a></div>
                    <div class="button remove"><a href="details.html"><img src="images/LivingRooms/remove.png" alt=""/></a></div>
                </div>



            </div>
            <center>
                <div class="contact-button">
                    <span class="btn"><a href="details.html">Buy</a></span>
                    </form>
                </div>
            </center>

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
                            <li><a href=""><img src="images/facebook.png" title="facebook"></a></li>
                            <li><a href=""><img src="images/twitter.png" title="twitter"></a></li>
                            <li><a href=""><img src="images/rss.png" title="rss"></a></li>
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