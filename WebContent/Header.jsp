<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="CSS/Homepage.css" rel="stylesheet" type="text/css">
<!--  <link href="CSS/LoginPage.css" rel="stylesheet" type="text/css">-->


<title>Welcome To Travel Experts</title>
<script type="text/javascript" src="jquery.js"></script>	
<script type="text/javascript" src="JSValidation/Validation.js"></script>

<script type="text/javascript">

function showCustomer(custId)
{
	$( "#custTD" ).load( "GetCustomer?Cust=" + custId);
	
	//
	$( "#BkgTD" ).load( "GetBookings?custId=" + custId);
}
//------------------------------
function showBookingDetls(bkgId)
{
	$( "#BkgDtlsTD" ).load( "GetBkgDetails?bookgId=" + bkgId);
}
</script>		
</head>
<body background="Images/bg2.jpg">

	<div class="logoLocation">
		<img src="Images/logo2.png" >
	</div>	
	
	<%@include file="Menu.jsp" %>
	
