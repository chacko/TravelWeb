
	<!--Code Collaborators: Mark Neil Del Rosario & George Chacko
	Date: April 03, 2014
	Project: Instructor: Harvey Peters
	Team Member: 6
	Deadline: April 17, 2014
	Programming Language: Java,HTML,CSS,JavaScript,  -->
	

<%@page import="TrvlDBase.CustomerDB"%>
<%@page import="TrvlDBase.DBase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,TrvlEntity.*"%>
    
<% 
if(session.getAttribute("primaryID") == null)
{
	response.sendRedirect("HomePage.jsp");
}
%>
    
<%@include file="Header.jsp" %>

<% 
	Vector<Customers> custs = CustomerDB.getCustomers();
	
	StringBuilder optStr = new StringBuilder();
	for(Customers cst: custs)
	{
		optStr.append("<option value='");
		optStr.append(cst.getCustomerID());
		optStr.append("'>");
		optStr.append(cst.toString());
		optStr.append("</option>\n");
	}
%>
 
<div class="Content">
<table border="1" class="regForm">
<tr>
	<td style='height:405px;vertical-align:top'>
	<form method='post'>
		<table border='1' style='width:700px'>
		<tr>
			<td valign="top">
				<select name='Cust' id='Cust' onchange='showCustomer(this.value)'>
					<option value="0">Select Customer</option>
					<%=optStr.toString() %>
				</select>
			</td>
			<!-- Customer details TD -->		
			<td id="custTD" valign="top">
			
			</td>
			<!-- booking drop down list TD -->
			<td id="BkgTD" valign="top">
			
			</td>
			<!-- booking Details TD -->
			<td id="BkgDtlsTD" valign="top">		
			</td>
		</tr>
		</table>
	</form>
	</td>
</tr>
</table>
</div>
<%@include file="Footer.jsp" %>