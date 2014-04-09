
<!--Code by: Mark Neil Del Rosario
	Date: April 03, 2014
	Project: Instructor: Harvey Peters
	Group Member: 6
	Deadline: April 17, 2014
	Programming Language: Java,HTML,CSS,JavaScript,  -->

<%@page import="TrvlUtil.MD5"%>
<%@page import="TrvlDBase.CustomerDB"%>
<%@page import="TrvlEntity.Customers"%>
<%@page import="org.apache.catalina.startup.PasswdUserDatabase"%>

<%@page import="com.sun.xml.internal.ws.api.ha.StickyFeature"%>
<%@page import="TrvlDBase.DBase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- this is importing the java sql for everything -->  
    <%@ page import="java.sql.*" %>
    
 

<%@include file="Header.jsp" %>	

<%!
String firstname =""; 
String lastname ="" ; 
String address = "";
String city = "";
String province = "";
String postal = "";
String country = "";
String HPhone = "";
String BPhone = "";
String Email = "";
    		
%>

<%!  
/**
*Insert into customers table
*/
public  void  doInsert(HttpServletRequest request,
		HttpServletResponse response,JspWriter out,HttpSession sessn)
 {
    	firstname = request.getParameter("CustFirstName");
    	lastname = request.getParameter("CustLastName");
    	
	   	 address = request.getParameter("CustAddress");
	   	 city = request.getParameter("CustCity");
	   	 province = request.getParameter("CustProv");
	   	 postal = request.getParameter("CustPostal");
	   	 country = request.getParameter("CustCountry");
	   	 HPhone = request.getParameter("CustHomePhone");
	   	 BPhone = request.getParameter("CustBusPhone");
	   	 Email = request.getParameter("CustEmail");
    	
    	
    	String username = request.getParameter("uname");
    	String password = request.getParameter("passwd");
    	String cPassword = request.getParameter("cpasswd");
    	
    	String custId =""; 
    	
       try
       {
    	//Class.forName("com.mysql.jdbc.Driver");
    	//Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/TravelExperts"
    	//							  , "root", "");
    	
    	Connection conn = DBase.getMySqlConnection(); 	
    	Statement stmt = conn.createStatement();
    	
    	StringBuilder qry = new StringBuilder();
    	qry.append("insert into Customers(CustFirstName, CustLastName, CustAddress, CustCity");
    	qry.append(",CustProv, CustPostal, CustCountry, CustHomePhone, CustBusPhone, CustEmail) ");
    	qry.append(" values ('");
    	qry.append(firstname);
    	qry.append("','");
    	qry.append(lastname);
    	qry.append("','");
    	qry.append(address);
    	qry.append("','");
    	qry.append(city);
    	qry.append("','");
    	qry.append(province);
    	qry.append("','");
    	qry.append(postal);
    	qry.append("','");
    	qry.append(country);
    	qry.append("','");
    	qry.append(HPhone);
    	qry.append("','");
    	qry.append(BPhone);
    	qry.append("','");
    	qry.append(Email);
    	qry.append("')");
    	
    	
    	int i = stmt.executeUpdate(qry.toString());
    	
    	// resets the qry to 0.
    	qry.setLength(0);
    	
    	// getting primary key frm Customers just inserted 
    	qry.append("SELECT MAX( CustomerId ) FROM Customers");
    	
    	ResultSet rs = stmt.executeQuery(qry.toString());
    	
    	if(rs.next())
    	{
    		custId = rs.getString(1);
    	}
    	
    	out.print("<b>Customer Id " + custId + "</b>");
    	
    	// inserting into users
    	qry.setLength(0);
    	
    	qry.append("insert into users (userid,passwd,role,primaryKeyID)");
    	qry.append(" values ('");
    	qry.append(username);
    	qry.append("','");
    	
    	// Encrypting password
    	String encryptPasswd = MD5.getMD5(password);
    	
    	//qry.append(password);
    	qry.append(encryptPasswd);
    	qry.append("',2,"); // setting the role to 2, which identifies a Customers
    	qry.append(custId); // gets the CustomerId after insertion of the latest customer and stores it to users table.
    	qry.append(")");
    	
    	int j = stmt.executeUpdate(qry.toString());
    	//------------------------------	
    	sessn.setAttribute("primaryID",custId); 
    	sessn.setAttribute("role",2);
    	sessn.setAttribute("usr",firstname + " " + lastname);
    	response.sendRedirect("Home.jsp");
    	//------------------------------
    	conn.close();
       }
       catch(Exception e)
       {
       	System.out.println(e);
       	//e.printStackTrace();
       }
    }
    //--------------------------------
    /**
*Update customers table
*/
public  void  doUpdate(HttpServletRequest request,
		HttpServletResponse response,JspWriter out,HttpSession sessn)
 {
    	firstname = request.getParameter("CustFirstName");
    	lastname = request.getParameter("CustLastName");
    	
	   	 address = request.getParameter("CustAddress");
	   	 city = request.getParameter("CustCity");
	   	 province = request.getParameter("CustProv");
	   	 postal = request.getParameter("CustPostal");
	   	 country = request.getParameter("CustCountry");
	   	 HPhone = request.getParameter("CustHomePhone");
	   	 BPhone = request.getParameter("CustBusPhone");
	   	 Email = request.getParameter("CustEmail");
    	
    	
    	String username = request.getParameter("uname");
    	String password = request.getParameter("passwd");
    	String cPassword = request.getParameter("cpasswd");
    	
    	String custId =""; 
    	
       try
       {
    	
    	Connection conn = DBase.getMySqlConnection(); 	
    	Statement stmt = conn.createStatement();
    	
    	StringBuilder qry = new StringBuilder();
    	qry.append("update Customers SET CustFirstName ='");
    	qry.append(firstname);
    	qry.append("', CustLastName ='");
    	qry.append(lastname);
    	qry.append("', CustAddress ='");
    	qry.append(address);
    	qry.append("', CustCity ='");
    	qry.append(city);
    	qry.append("', CustProv ='");
    	qry.append(province);
    	qry.append("', CustPostal ='");
    	qry.append(postal);
    	qry.append("', CustCountry ='");
    	qry.append(country);
    	qry.append("', CustHomePhone ='");
    	qry.append(HPhone);
    	qry.append("', CustBusPhone ='");
    	qry.append(BPhone);
    	qry.append("', CustEmail ='");
    	qry.append(Email);
    	qry.append("' WHERE CustomerId =");
    	qry.append(sessn.getAttribute("primaryID"));
    	
    	
    	int i = stmt.executeUpdate(qry.toString());
    	
    	// resets the qry to 0.
    	//qry.setLength(0);
    	
    	// getting primary key frm Customers just inserted 
    	//qry.append("SELECT MAX( CustomerId ) FROM Customers");
    	
    	/* ResultSet rs = stmt.executeQuery(qry.toString());
    	
    	if(rs.next())
    	{
    		custId = rs.getString(1);
    	}
    	
    	out.print("<b>Customer Id " + custId + "</b>"); */
    	
    	// inserting into users
    	/* qry.setLength(0);
    	
    	qry.append("insert into users (userid,passwd,role,primaryKeyID)");
    	qry.append(" values ('");
    	qry.append(username);
    	qry.append("','");
    	qry.append(password);
    	qry.append("',2,"); // setting the role to 2, which identifies a Customers
    	qry.append(custId); // gets the CustomerId after insertion of the latest customer and stores it to users table.
    	qry.append(")");
    	
    	int j = stmt.executeUpdate(qry.toString()); */
    	//------------------------------	
    	//sessn.setAttribute("primaryID",custId); 
    	//sessn.setAttribute("role",2);
    	// update session variable for user name
    	sessn.setAttribute("usr",firstname + " " + lastname);
    	response.sendRedirect("Home.jsp");
    	//------------------------------
    	conn.close();
       }
       catch(Exception e)
       {
       	System.out.println(e);
       	//e.printStackTrace();
       }
    }
    //--------------------------------
    public void getData(HttpSession sessn)
    {
    	Integer cId = Integer.valueOf(sessn.getAttribute("primaryID").toString());
    	
    	Customers cust = CustomerDB.getCustomer(cId);
    	
    	firstname	= cust.getCustomerFirstName();
    	lastname 	= cust.getCustomerLastName();
    	address 	= cust.getCustomerAdrs();
    	city 		= cust.getCustomerCity();
    	province 	= cust.getCustomerProv();
    	postal 		= cust.getCustomerPostal();
    	country 	= cust.getCustomerCountry();
    	HPhone 		= cust.getCustomerHPhone();
    	BPhone 		= cust.getCustomerPhone();
    	Email 		= cust.getCustomerEmail();
    	//System.out.println("First name" + firstname);	
    }
    //--------------------------------
    public void clearData()
    {
    	
    	
    	firstname	= "";
    	lastname 	= "";
    	address 	= "";
    	city 		= "";
    	province 	= "";
    	postal 		= "";
    	country 	= "";
    	HPhone 		= "";
    	BPhone 		= "";
    	Email 		= "";
    	//System.out.println("First name" + firstname);	
    }
    //-------------------------------
    %> 
    
<% 	
 

if(request.getParameter("submit") != null)
{
	// clicking submit button for insert
	if(session.getAttribute("primaryID") == null)
	{
		doInsert(request,response,out,session);
	} 
	else // clicking submit button for update
	{
		doUpdate(request, response, out, session);
	}
}
else
{
	// Displays Register page in edit mode when
	// existing customer logs in
	if(session.getAttribute("primaryID") != null)
	{
		getData(session);
	} 
	else  // Displays blank register page for new customer
	{
		clearData();
	}
}


%>

	<!-- Customer page start  -->	
	<div class="Content">
	<form name="myForm" method="post" action="Register.jsp" onsubmit="return validateForm()">
	<center>
		 <table class="regForm" >
		 <thead>
                    <tr>
                        <th colspan="2">Register Here</th>
                    </tr>
                </thead> 
                <tbody>
                	<tr>
                		<td>First Name:</td>
                		<td><input type="text" name="CustFirstName" value="<%=firstname%>"/></td>
                	</tr>
                	
                	<tr>
                		<td>Last Name:</td>
                		<td><input type="text" name="CustLastName" value="<%=lastname%>" /></td>
                	</tr>
                	
                	<tr>
                		<td>Address:</td>  
                		<td><input type="text" name="CustAddress" value="<%=address%>" /></td>
                	</tr>
                
               		 <tr>
                		<td>City:</td>
                		<td><input type="text" name="CustCity" value="<%=city%>" /></td>
                	</tr>
              
                	<tr>
                		<td>Province:</td>
                		<td><input type="text" name="CustProv" value="<%=province%>" maxlength="2"/></td>
                	</tr>
                
               		 <tr>
                		<td>Postal Code:</td>
                		<td><input type="text" name="CustPostal" value="<%=postal%>" /></td>
                	</tr>
                
               		 <tr>
                		<td>Country(Optional):</td>
                		<td><input type="text" name="CustCountry" value="<%=country%>" /></td>
                	</tr>
                
              		  <tr>
                		<td>Home Phone(Optional):</td>
                		<td><input type="text" name="CustHomePhone" value="<%=HPhone%>" /></td>
                	</tr>
                
               		 <tr>
                		<td>Bus Phone:</td>
                		<td><input type="text" name="CustBusPhone" value="<%=BPhone%>" /></td>
                	</tr>
                
               		 <tr>
                		<td>Email:</td>
                		<td><input type="text" name="CustEmail" value="<%=Email%>" /></td>
                	</tr>                 	
                	
                	<%
                		if(session.getAttribute("primaryID") == null)
                		{ 
                	%>
                	             	                            	
                	<tr>
                		<td>UserName:</td>
                		<td><input type="text" name="uname" value="" /></td>
                	</tr>
                	
                	<tr>
                		<td>Password:</td>
                		<td><input type="password" name="passwd" value="" /></td>
                	</tr>
                	
                	<tr>
                		<td>Confirm Password:</td>
                		<td><input type="password" name="cpasswd" value="" /></td>
                	</tr>
                	<% 
                		}
                	%>
                	<tr>
                		<td><input type="submit" name="submit" value="Confirm Registration" /></td>
                		<td><input type="reset" value="Clear" /></td>
                	</tr>
                  </tbody>  
              </table>             		 	                      
		</center>
	</form>	
	</div>	
		
	<!-- Customer page end  -->
			
 
     <!-- This is the connection string for inserting the required information of the 
     	  new Customer.   -->
   

    
  <%@include file="Footer.jsp" %>