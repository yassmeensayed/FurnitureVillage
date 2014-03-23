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
        <script src="js/AjaxEditProfile.js"></script>
        <script type="text/javascript">
            $(function() {
                $('.grid-img a').lightBox();
            });

            $(document).ready(
                    function() {
                        fname = document.getElementById("fname");
                        email = document.getElementById("email");
                        address = document.getElementById("address");
                        bday = document.getElementById("bday");
                        password = document.getElementById("newpassword");
                        confirmpassword = document.getElementById("confpassword");
                        balance = document.getElementById("balance");
                        interestsy = document.getElementById("interests");

                        $("#fname").focusout(function() {
                            validateName()
                        });

                        $("#email").focusout(function() {
                            validateEmail()
                        });

                        $("#address").focusout(function() {
                            validateAddress()
                        });

                        $("#bday").focusout(function() {
                            validateBirthday()
                        });

                        $("#newpassword").focusout(function() {
                            validatePassword()
                        });

                        $("#confpassword").focusout(function() {
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

                        if (validateName() && validateEmail() && validateAddress() && validateBirthday() && validatePassword() && confirmPassword() && validateinterests()) {
                            // $("btn_submit").removeAttr("disabled");
                            //  document.getElementById("btn_submit").removeAttribute("disabled");
                            //document.getElementById("btn_submit").removeAttribute("disabled"); 
                            //document.getElementById("btn_submit").disabled = false;
                        } else {
                          //   document.getElementById("btn_submit").setAttribute("disabled","disabled");
                          //document.getElementById("btn_submit").disabled = true;
                        }
                    }
            );

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
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
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
            <div class="content">
                <div class="section group">				
                    <div class="col span_2_of_3">
                        <div class="contact-form">
                            <h2>Edit Profile</h2>
                            <div>
                                <span><label>NAME</label></span>
                                <span><input type="text" name="fname"  id="fname" value="${user.fullName}"></span><span class="error required" >*</span>
                            </div>
                            <div>
                                <span><label>E-MAIL</label></span>
                                <span><input type="text" name="email" id="email" value="${user.email}"></span><span class="error required" >yourmail@abc.com*</span>
                            </div>
                            <div>
                                <span><label>ADDRESS</label></span>
                                <span><input type="text" name="address" id="address" value="${user.address}"></span><span class="error required" >*</span>
                            </div>
                            <div>
                                <span><label>BIRTHDAY</label></span>
                                <span><input type="text" name="bday" id="bday" value="${user.birthdate}"></span><span class="error required" >yyyy-mm-dd*</span>
                            </div>
                            <div>
                                <span><label>OLD PASSWORD</label></span>
                                <span><input type="password" name="password" id="password"/></span><span class="error required" >*</span>
                            </div>
                            <div>
                                <span><label>NEW PASSWORD</label></span>
                                <span><input type="password" name="newpassword" id="newpassword"/></span><span class="error required" >Password should contain capital and small letter,numbers, special character @#$% , and its size not less than 6*</span>
                            </div>
                            <div>
                                <span><label>CONFIRM PASSWORD</label></span>
                                <span><input type="password" name="confpassword" id="confpassword"/></span><span class="error required" >*</span>
                            </div>
                            <div>
                                <span><label>BALANCE</label></span>
                                <span><input type="text" name="balance" id="balance" value="${user.balance}"></span><span class="error required" >*</span>
                            </div>
                            <div>
                                <span><label>INTERESTS</label></span>
                                <span><textarea name="interests" id="interests" >${user.interests}</textarea></span><span class="error required" >*</span>
                            </div>
                            <div>
                                <span><input type="submit"  id="btn_submit" value="Submit" ></span>
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