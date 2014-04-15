
	<!--Code Collaborators: Mark Neil Del Rosario & George Chacko
	Date: April 03, 2014
	Project: Instructor: Harvey Peters
	Team Member: 6
	Deadline: April 17, 2014
	Programming Language: Java,HTML,CSS,JavaScript,  -->


<%@page import="TrvlDBase.AgentsDB"%>
<%@page import="TrvlEntity.Agents"%>
<%@page import="TrvlUtil.MD5"%>
<%@page import="TrvlEntity.Customers"%>
<%@page import="TrvlDBase.CustomerDB"%>
<%@page import="TrvlDBase.UsersDB"%>
<%@page import="TrvlEntity.Users"%>
<%@page import="TrvlDBase.DBase"%>
<%@page import="org.GNOME.Accessibility.Application"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
   import="java.io.*,java.util.*" 
    
    %>

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
		// Encrypting password
    	String encryptPasswd = MD5.getMD5(frmPasswd);
    	
		Users usr = UsersDB.getUser(frmUserId, encryptPasswd);
    	
		//if(!frmPasswd.equals(usr.getPasswd()))
		if(!encryptPasswd.equals(usr.getPasswd()))	
		{
			message = "UserId or Password are incorrect";
			//response.sendRedirect("HomePage.jsp");
		}
		else
		{
	 		//message = "Login Success";
		 	session.setAttribute("primaryID",usr.getPrimaryKeyId()); 
		 	session.setAttribute("role",usr.getRole());
		 	
		 	if(usr.getRole().equals(1)) // agent
		 	{
		 		Agents agt = AgentsDB.getAgent(usr.getPrimaryKeyId());
		 		session.setAttribute("usr", agt.getAgentFName() + " " + agt.getAgentLName());
		 	}
		 	else // customer
		 	{
	 			Customers cust = CustomerDB.getCustomer(usr.getPrimaryKeyId());
		 		session.setAttribute("usr",cust.getCustomerFirstName() + " " + cust.getCustomerLastName());
		 	}
		 	response.sendRedirect("Home.jsp");
		}
	}
}

%>
<%@include file="Header.jsp" %>
<link href="CSS/LoginPage.css" rel="stylesheet" type="text/css">
<div class="container">
	<div class="login">
		<h1>Login Here</h1>
		<form method='post' action='Login.jsp'>
			<h3 style='color:blue'><%=message %></h3>
			<p><input type="text" class="uname" name="userId" value="" placeholder="UserId"></p>
	   				<p><input type="password" class="pwd" name="password" value="" placeholder="Password"></p>
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

<%@include file="Footer.jsp" %>