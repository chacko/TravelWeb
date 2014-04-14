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
if(session.getAttribute("primaryID") == null)
{
	response.sendRedirect("Login.jsp");
}
%>

<%@include file="Header.jsp" %>
 
<div class="Content">
<form method='post'>
<table border="1" style="width:100%" class="regForm">
<tr>
	<td style='height:405px;vertical-align:top'>
		Agent PAGE
	</td>
</tr>
</table>
</form>
</div>
<%@include file="Footer.jsp" %>