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

<%-- <% 
if(session.getAttribute("primaryID") == null)
{
	response.sendRedirect("Login.jsp");
}
%> --%>

<%-- <%@include file="Header.jsp" %> --%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="CSS/Homepage.css" rel="stylesheet" type="text/css">
<link href="CSS/LoginPage.css" rel="stylesheet" type="text/css">


<title>Welcome To Customer Page</title>			
</head>
<body background="Images/bg2.jpg">

	<div class="logoLocation">
		<img src="Images/logo2.png" >
	</div>	

	<div class="Menuwrapper">
		<ul class="Menu">
			<li><a href="HomePage.jsp">Customer Login</a></li>
			<li><a href="Register.jsp">New Customer Registration</a></li>
			<li><a href="Agent.jsp">Agent Login</a></li>
					
		</ul>
	</div>
	
	<div class="Menuwrapper">
		<ul class="LogMenu">
			<li><a href="Customer.jsp">Customer Information</a></li> 	
			<li><a href="Home.jsp">Home</a></li>
			<li><a href="Logout.jsp">Logout</a></li>
		</ul>
	</div>
	
 
 		
<!-- <tr>
	<td style='height:405px;vertical-align:top'>
	<form method='post'>
		<table border='1' style='width:100%'>
		<tr>
			<td>Customer PAGE</td>
		</tr>	
		</table>
	</form>
	</td>
</tr>
 -->


	<div class="Footer">
		<p>Copyright &copy; Travel Experts Team 6 2013</p>
    </div>

<%-- <%@include file="Footer.jsp" %> --%>