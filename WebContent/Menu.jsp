<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div class="Menuwrapper">
	<ul class="Menu">
		
		
		<% 
		if(session.getAttribute("role") != null)
		{
			Integer roleId = (Integer)session.getAttribute("role");
			if(roleId == 2) // customer
			{
				out.print("<li><a href='Register.jsp'>Customer</a></li>\n");
				out.print("<li>\n<a href='CustomerPackg.jsp'>Customer Package</a>\n</li>\n");
			}
			else if(roleId == 1)
			{
				out.print("<li>\n<a href='Agent.jsp'>Agent</a>\n</li>\n");
				
			}
			
		}
		%>
		<li><a href="Logout.jsp">Logout</a></li>		
	</ul>
</div>
				
				
				