<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("primaryID"); 
	session.removeAttribute("role");
	session.removeAttribute("usr");
	
	response.sendRedirect("HomePage.jsp");
%>