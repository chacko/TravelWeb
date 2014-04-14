<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div class="Menuwrapper">
	<ul class="Menu">
		
		<li><a href='HomePage.jsp'>Home</a></li>
		<% 
		if(session.getAttribute("role") != null)
		{
			//System.out.println(session.getAttribute("role"));
			
			Integer roleId = (Integer)session.getAttribute("role");
			if(roleId == 2) // customer
			{
				out.print("<li><a href='Register.jsp'>Customer</a></li>\n");
				out.print("<li><a href='CustomerInfo.jsp'>Travel Information</a></li>\n");
				out.print("<li><a href='Logout.jsp'>Logout</a></li>\n");
				
			}
			else if(roleId == 1)
			{
				out.print("<li>\n<a href='CustomerPackg.jsp'>Customer Package</a>\n</li>\n");
				out.print("<li>\n<a href='Agent.jsp'>Agent</a>\n</li>\n");
				out.print("<li><a href='Logout.jsp'>Logout</a></li>\n");
			}
			
			if(session.getAttribute("usr") != null)
			{
				out.print("<li style='color:red'> 	<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome..!!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + session.getAttribute("usr") + "</b></li>\n");
			}
			
		}
		%>
				
	</ul>
	<%
		
	%>
</div>
				
				
				