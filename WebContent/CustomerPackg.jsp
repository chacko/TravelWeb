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
		<table border='0' style='width:100%'>
		<tr>
			<td valign="top">
				<select name='Cust' id='Cust' onchange='showCustomer(this.value)'>
					<option value="0">Select Customer</option>
					<%=optStr.toString() %>
				</select>
			</td>
			<!-- Customer details TD -->		
			<td id="custTD">
			
			</td>
		</tr>
		</table>
	</form>
	</td>
</tr>
</table>
</div>
<%@include file="Footer.jsp" %>