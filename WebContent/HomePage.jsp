
	<!--Code Collaborators: Mark Neil Del Rosario & George Chacko
	Date: April 03, 2014
	Project: Instructor: Harvey Peters
	Team Member: 6
	Deadline: April 17, 2014
	Programming Language: Java,HTML,CSS,JavaScript,  -->


<%@page import="TrvlDBase.UsersDB"%>
<%@page import="TrvlEntity.Users"%>
<%@page import="TrvlDBase.DBase"%>
<%@page import="org.GNOME.Accessibility.Application"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
   import="java.io.*,java.util.*"   %>
    
    <% 

String message = "";

if(request.getParameter("userId") != null)
{
	String frmUserId = ((request.getParameter("userId") == null)? "" : request.getParameter("userId")) ;
	String frmPasswd = ((request.getParameter("password") == null)? "" : request.getParameter("password"));
	
	if(frmUserId.equals("") || frmPasswd.equals(""))
	{
		message = "UserId or Password does not have a value. Please Enter it.";
	}
	else
	{
		Users usr = UsersDB.getUser(frmUserId, frmPasswd);
		if(!frmPasswd.equals(usr.getPasswd()))
		{
			message = "UserId or Password are incorrect";
		}
		else
		{
	 		//message = "Login Success";
		 	session.setAttribute("primaryID",usr.getPrimaryKeyId()); 
		 	session.setAttribute("role",usr.getRole());
		 	response.sendRedirect("Home.jsp");
		}
	}
}

%>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- Connection link to every CSS that we have used to design our pages. -->

<link href="CSS/Homepage.css" rel="stylesheet" type="text/css">
<link href="CSS/LoginPage.css" rel="stylesheet" type="text/css">


<title>Welcome To Travel Experts</title>			
</head>

	<!-- This is the background for every page that you will see. -->
	
<body background="Images/travel.jpg">

	<!-- This is the logo of our company. -->

	<div class="logoLocation">
		<img src="Images/logo2.png" >
	</div>	
	
	<!-- This is the navigation menu of the welcome page -->

	<div class="Menuwrapper">
		<ul class="Menu">
			<!--  <li><a href="HomePage.jsp">Customer Login</a></li>-->
			<li><a href="Register.jsp">New Customer Registration</a></li>
			<li><a href="Login.jsp">Login</a></li>
					
		</ul>
	</div>	
	
		<!-- These is the travel experts welcome page, where it includes various of famous
				travel destination pictures and the vision of what we bring to you. -->					
		
<div class="Content">
	<div class="image1">
		<img src="Images/Bora.jpg" width="300px">	
	</div>
	<div class="image2">
		<img src="Images/LasVegas.jpg" width="300px" height="221px">	
	</div>
	
	<div class="travdescription">
			<p class="slogan"><a>Explore thousands of beautiful and famous travel destinations, 
				with us, we make sure that you enjoy every single bit of time
				that you spend and complement it with a big SMILE.</a></p>
	</div>
	
	<div class="image3">
		<img src="Images/New York.jpg" width="300px" height="221px">	
	</div>
	
	<div class="image4">
		<img src="Images/Palawan.jpg" width="300px" height="221px">	
	</div>

</div>	
	
		<!-- This is the main Footer for every page -->

		<div class="Footer">
				<p>Copyright &copy; Travel Experts Team 6 2013</p>
		</div>
		
</body>	
</html>