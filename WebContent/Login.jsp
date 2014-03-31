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
<title>Team 6 OOSD - Travel Experts</title>
</head>
<body>
<!-- top table  -->
<table border="1" style="width:100%">
	<tr>
		<td>
			<!-- header table  start -->
			<table border="0" style="width:100%">
				<tr>
					<td><h1> Travel Experts - TEAM 6 - OOSD </h1></td>
				</tr>
			</table>
			<!-- header table end -->
		</td>
	</tr>

 

<tr>
	<td style='height:405px;vertical-align:top'>
	<form method='post'>
		<h4 style='color:red'><%=message%> </h4>
		<table border='1' style='width:60%'>
		<tr><td>User Id</td>
		<td><input type='text' name='userId'></td></tr>
		<tr><td>Password</td>
		<td><input type='text' name='password'></td></tr>
		<tr>
			<td colspan='2'><input type='submit' value='Login'> </td>
		</tr>	
		<tr>
			<td><a href="Customer.jsp">Create Customer Login</a>
			<td><a href="Agent.jsp">Create Agent Login</a>
		</tr>			
		</table>
	</form>
	</td>
</tr>


<%@include file="Footer.jsp" %>