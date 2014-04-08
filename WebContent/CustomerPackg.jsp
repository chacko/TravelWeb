<%@page import="TrvlDBase.CustomerDB"%>
<%@page import="TrvlDBase.DBase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,TrvlEntity.*"%>
    
<% 
if(session.getAttribute("primaryID") == null)
{
	response.sendRedirect("Login.jsp");
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
 

<tr>
	<td style='height:405px;vertical-align:top'>
	<form method='post'>
		<table border='1' style='width:100%'>
		<tr>
			<td>
				<select name='Cust' id='Cust'>
					<option value="0">Select Customer</option>
					<%=optStr.toString() %>
				</select>
			</td>
		</tr>	
		<tr>
			<td id="custTD">
			
			</td>
		</tr>
		</table>
	</form>
	</td>
</tr>


<%@include file="Footer.jsp" %>