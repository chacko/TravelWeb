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
	 		message = "Login Success";
		 	session.setAttribute("primaryID",usr.getPrimaryKeyId()); 
		 	session.setAttribute("role",usr.getRole());
		}
	}
}

%>
<%@include file="Header.jsp" %>
 

<tr>
	<td style='height:405px;vertical-align:top'>
	<form method='post'>
		<h2 style='color:red'><%=message%> </h2>
		<table border='1' style='width:100%'>
		<tr><td>User Id</td>
		<td><input type='text' name='userId'></td></tr>
		<tr><td>Password</td>
		<td><input type='text' name='password'></td></tr>
		<tr>
			<td colspan='2'><input type='submit' value='Login'> </td>
		</tr>				
		</table>
	</form>
	</td>
</tr>


<%@include file="Footer.jsp" %>