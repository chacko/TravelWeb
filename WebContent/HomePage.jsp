
	<!--Code by: Mark Neil Del Rosario
	Date: April 03, 2014
	Project: Instructor: Harvey Peters
	Group Member: 6
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

<link href="CSS/Homepage.css" rel="stylesheet" type="text/css">
<link href="CSS/LoginPage.css" rel="stylesheet" type="text/css">


<title>Welcome To Travel Experts</title>			
</head>
<body background="Images/bg2.jpg">

	<div class="logoLocation">
		<img src="Images/logo2.png" >
	</div>	

	<div class="Menuwrapper">
		<ul class="Menu">
			<!--  <li><a href="HomePage.jsp">Customer Login</a></li>-->
			<li><a href="Register.jsp">New Customer Registration</a></li>
			<!-- <li><a href="Agent.jsp">Agent Login</a></li>-->
					
		</ul>
	</div>
		
	
			
		<div class="container">
			<div class="login">
				<h1>Login Here</h1>
				<form method='post' action='Login.jsp'>
					<h3 style='color:blue'><%=message %></h3>
					<p><input type="text" name="userId" value="" placeholder="UserId"></p>
      				<p><input type="password" name="password" value="" placeholder="Password"></p>
					 <!-- <p class="remember_me">
					 <label>	
         			 <input type="checkbox" name="remember_me" id="remember_me">
         			 Remember me on this computer
        			</label>
    			  </p> -->
      				<p class="submit"><input type="submit" name="commit" value="Login"></p>
				</form>	
			</div>
		</div>
			
		<div class="Footer">
				<p>Copyright &copy; Travel Experts Team 6 2013</p>
		</div>
		
</body>	
</html>