<%@page import="TrvlDBase.BookingDB"%>
<%@page import="TrvlDBase.DBase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,TrvlEntity.*,java.text.SimpleDateFormat"%>
    
<% 
if(session.getAttribute("primaryID") == null)
{
	response.sendRedirect("HomePage.jsp");
}
%>
    
<%@include file="Header.jsp" %>

<% 

Vector<Bookings> bookgs = BookingDB.getBookings(Integer.valueOf(session.getAttribute("primaryID").toString()));


SimpleDateFormat dtFormat = new SimpleDateFormat("dd-MMM-yyyy");

StringBuilder optStr = new StringBuilder();

for(Bookings bkg:bookgs)
{
	optStr.append("<option value='");
	optStr.append(bkg.getBkgId().toString());
	optStr.append("'>");
	optStr.append(dtFormat.format(bkg.getBkgDate()) + " " + bkg.getBkgNumber());
	optStr.append("</option>\n");
}
	
%>
 
<div class="Content">
<table border="1" class="regForm">
<tr>
	<td style='height:405px;vertical-align:top'>
	<form method='post'>
		<table border='0' style='width:900px'>
		<tr>
			
			<!-- Customer details TD -->		
			<!-- <td id="custTD" valign="top">
			
			</td> -->
			<!-- booking drop down list TD -->
			<td id="BkgTD" valign="top" >
				<select name='bookings' id='bookings' onchange='showBookingDetls(this.value)'>
					<option value="0">Select Booking</option>
					<%=optStr.toString() %>
				</select>
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