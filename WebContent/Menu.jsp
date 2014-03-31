<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<tr>
	<td>
		<table border="1" style="width:100%">
			<tr>
				<td>
					<a href="LoginJsp.jsp">Home</a>
				</td>
				<% 
				if(session.getAttribute("userPrimaryID") != null)
				{
					out.print("<td>\n<a href='Customer'>Customer.jsp</a>\n</td>\n");
				}
				%>
			</tr>
		</table>
	</td>
</tr>