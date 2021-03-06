<%-- 
    Document   : Admin
    Created on : Mar 20, 2014, 6:24:48 PM
    Author     : Yassmeen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Admin Panel</title>
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

       
<script type="text/javascript">
           var xmlHttp = "";

           function goProfile(test){
               $.post("ViewProfile", {email:test});
           }
            function startRequest(){
                
                createXMLHttpRequest();
                xmlHttp.onreadystatechange = handelReq3;
                xmlHttp.open("get", "LoadAdminPage",true);
                xmlHttp.send(null);
            }
            
            function createXMLHttpRequest(){
                if(window.ActiveXObject)
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                else if (window.XMLHttpRequest) xmlHttp = new XMLHttpRequest();
            }
            function handelReq3(){
                var xmlDoc = "";
                if(xmlHttp.readyState === 4){

                    var xmlDoc = xmlHttp.responseXML;
                    var names = xmlDoc.getElementsByTagName("name");
                    var messages = xmlDoc.getElementsByTagName("email");
                    var actives = xmlDoc.getElementsByTagName("active");

                    var out ="<tr><td width =10%  ><h1 style=\"font-size: 28px;\">Users</h1></td></tr>";
                    for(var i = 0 ; i < names.length ; i++){
                        
                        currentName = names[i];
                        currentEmail = messages[i];
                        currentActive = actives[i];
                       // alert(currentActive.childNodes[0].nodeValue );
                        if(currentActive.childNodes[0].nodeValue == 'true'){
                            
                        
                        out = out+"<tr><td width =15% align=\"center\">"+currentName.childNodes[0].nodeValue +"</td>"
                            + "<td width =10% align=\"center\"><a href=\"ViewProfile?date="+new Date()+"&email="+currentEmail.childNodes[0].nodeValue
                            +"\"><input class=\"adminbutton\" type=\"button\" value=\"View Profile\" size=25 name=\"Frist Name\"></a></td>"
                        +"<td align=\"center\"><input type=\"button\" value=\"Activate\"  disabled class=\"userActive\" size=25 name=\"Frist Name\">&nbsp;&nbsp;&nbsp;<a href=\"UserActivation?date="
                        +new Date()+"&active="+currentActive.childNodes[0].nodeValue+"&email="+currentEmail.childNodes[0].nodeValue
                            +"\"><input type=\"button\" class=\"userDeActive\" value=\"Deactivate\" enabled style=\"cursor:pointer; cursor:hand\" size=25 name=\"Frist Name\"></a></td>"
                        +"</tr>";
                    }
                    if (currentActive.childNodes[0].nodeValue == 'false'){
                        
                    out = out+"<tr><td width =15% align=\"center\">"+currentName.childNodes[0].nodeValue +"</td>"
                            + "<td width =10% align=\"center\"><a href=\"ViewProfile?date="+new Date()+"&email="+currentEmail.childNodes[0].nodeValue
                            +"\"><input class=\"adminbutton\" type=\"button\" value=\"View Profile\" size=25 name=\"Frist Name\"></a></td>"
                        +"<td align=\"center\"><a href=\"UserActivation?date="
                        +new Date()+"&active="+currentActive.childNodes[0].nodeValue+"&email="+currentEmail.childNodes[0].nodeValue
                            +"\"><input type=\"button\" value=\"Activate\" enabled style=\"cursor:pointer; cursor:hand\" class=\"userActive\" size=25 name=\"Frist Name\"></a>&nbsp;&nbsp;&nbsp;<input type=\"button\" class=\"userDeActive\" value=\"Deactivate\" disabled size=25 name=\"Frist Name\"></td>"
                        +"</tr>";
                    }
                        //out = currentMsg.length;

                    }
            document.getElementById('tableusers').innerHTML = out;	    
            }
                    
                }
          function goNew(){
              window.location ="NewItem.jsp?name="+new Date();
          }
    
</script>

</head>
<body onload="startRequest();">
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
<!--                <div class="search">
                    <form>
                        <input type="text" value="">
                        <input type="submit" value="">
                    </form>
                </div>-->
                <div class="clear"></div>
            </div>
<div class="content">
<!--<div class="section group">
	<div class="col_1_of_3 span_1_of_3">
		<div class="grid-imgs">
			<a href="DiningRooms.html"><img src="images/Dining Room/diningroomCategory.png" alt=""/></a> 
		</div>
		<h2>Dinig Rooms </h2>
		<p>We have a variety of dining room designs.</p>
	</div>
	<div class="col_1_of_3 span_1_of_3">
		<div class="grid-imgs">
			<a href="LivingRooms.html"><img src="images/Living Room/livingroomCategory.png" alt=""/></a> 
		</div>
		<h2>Living Rooms </h2>
		<p>We have a variety of living room designs. We also have different comfy chairs and sofas</p>
	</div>
	<div class="col_1_of_3 span_1_of_3">
		<div class="grid-imgs">
				<a href="BedRooms.html"><img src="images/BedRoom/bedroomCategory.png" alt=""/></a> 
		</div>
		<h2>Bed Rooms </h2>
		<p>We have a variety of bed room designs.</p>
	</div>
	<div class="col_1_of_3 span_1_of_3" id="kitchen">
		<div class="grid-imgs">
				<a href="Kichens.html"><img id="kitchen" src="images/Kitchens/kitchenCategory.png" alt=""/></a> 
		</div>
		<h2>Kitchens </h2>
		<p>We have a variety of kitchen designs.</p>
	</div>
</div>-->
<div class="text-h"  style="margin:20px 0 5px 0;">
	<h2>Admin Panel</h2>
</div>
<div class="section group">
	<!--<div class="col_1_of_5 span_1_of_5">
		<div class="grid-img">
				<a href="details.html"><img src="images/Living Room/lamp.jpg" alt=""/></a> 
		</div>
		<p>Sed do eiusmod tempor incididunt ut labore et dolore.</p>
		<button class="left">$23.58</button>
		<div class="btn right"><a href="details.html">view</a></div>
	</div>
	<div class="col_1_of_5 span_1_of_5">
		<div class="grid-img">
			<a href="details.html"><img src="images/Chairs and sofa/chair.jpg" alt=""/></a> 
		</div>
		<p>Sed do eiusmod tempor incididunt ut labore et dolore.</p>
		<button class="left">$23.58</button>
		<div class="btn right"><a href="details.html">view</a></div>
	</div>
	<div class="col_1_of_5 span_1_of_5">
		<div class="grid-img">
			<a href="details.html"><img src="images/tables/table1.jpg" alt=""/></a> 
		</div>
		<p>Sed do eiusmod tempor incididunt ut laboreet dolore.</p>
		<button class="left">$23.58</button>
		<div class="btn right"><a href="details.html">view</a></div>
	</div>
	<div class="col_1_of_5 span_1_of_5">
		<div class="grid-img">
			<a href="details.html"><img src="images/Chairs and sofa/shalta.jpg" alt=""/></a> 
		</div>
		<p>Sed do eiusmod tempor incididunt ut labore et dolore.</p>
		<button class="left">$23.58</button>
		<div class="btn right"><a href="details.html">view</a></div>
	</div>
	<div class="col_1_of_5 span_1_of_5">
		<div class="grid-img">
			<a href="details.html"><img src="images/Dining Room/American-Furniture.jpg" width="160px" alt=""/></a> 
		</div>
		<p>Sed do eiusmod tempor incididunt ut labore et dolore.</p>
		<button class="left">$23.58</button>
		<div class="btn right"><a href="details.html">view</a></div>
	</div>-->
	
	<form action="register" method="Get">
		<table id="tableusers">
			<tr height=50>
				<td width =10%  ><h1 style="font-size: 28px;">Users</h1></td>
				
			</tr>
			
	
		
		</table>
		</form>
</div>
<div id="update"><input class="adminbutton" type="button" value="Update Status" size=25 name="Frist Name" onclick="startRequest()">
<br /><br />
<input class="adminbutton" type="button" value="Add New Item" size=25 name="Frist Name" onclick="goNew()">
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

</body>
</html>