<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("primaryID"); 
	session.removeAttribute("role");
	response.sendRedirect("Login.jsp");
%>