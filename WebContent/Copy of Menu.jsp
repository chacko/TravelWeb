<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<tr>
	<td>
		<table border="1" style="width:100%">
			<tr>
				<td>
					<a href="Home.jsp">Home</a>
				</td>
				<% 
				if(session.getAttribute("role") != null)
				{
					Integer roleId = (Integer)session.getAttribute("role");
					if(roleId == 2) // customer
					{
						out.print("<td>\n<a href='Customer.jsp'>Customer</a>\n</td>\n");	
					}
					else if(roleId == 1)
					{
						out.print("<td>\n<a href='Agent.jsp'>Agent</a>\n</td>\n");
						out.print("<td>\n<a href='CustomerPackg.jsp'>Customer Package</a>\n</td>\n");
					}
					
				}
				%>
				<td>
					<a href="Logout.jsp">Logout</a>
				</td>
			</tr>
		</table>
	</td>
</tr>