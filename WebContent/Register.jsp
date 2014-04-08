
<!--Code by: Mark Neil Del Rosario
	Date: April 03, 2014
	Project: Instructor: Harvey Peters
	Group Member: 6
	Deadline: April 17, 2014
	Programming Language: Java,HTML,CSS,JavaScript,  -->

<%@page import="org.apache.catalina.startup.PasswdUserDatabase"%>
<%@page import="sun.security.provider.MD5"%>
<%@page import="com.sun.xml.internal.ws.api.ha.StickyFeature"%>
<%@page import="TrvlDBase.DBase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- this is importing the java sql for everything -->  
    <%@ page import="java.sql.*" %>
    
 

<%@include file="Header.jsp" %>	

<% 	
/* if(session.getAttribute("primaryID") == null)
{
	response.sendRedirect("HomePage.jsp");
} */
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
                		<td><input type="text" name="CustFirstName" value=""/></td>
                	</tr>
                	
                	<tr>
                		<td>Last Name:</td>
                		<td><input type="text" name="CustLastName" value="" /></td>
                	</tr>
                	
                	<tr>
                		<td>Address:</td>  
                		<td><input type="text" name="CustAddress" value="" /></td>
                	</tr>
                
               		 <tr>
                		<td>City:</td>
                		<td><input type="text" name="CustCity" value="" /></td>
                	</tr>
              
                	<tr>
                		<td>Province:</td>
                		<td><input type="text" name="CustProv" value="" /></td>
                	</tr>
                
               		 <tr>
                		<td>Postal Code:</td>
                		<td><input type="text" name="CustPostal" value="" /></td>
                	</tr>
                
               		 <tr>
                		<td>Country(Optional):</td>
                		<td><input type="text" name="CustCountry" value="" /></td>
                	</tr>
                
              		  <tr>
                		<td>Home Phone(Optional):</td>
                		<td><input type="text" name="CustHomePhone" value="" /></td>
                	</tr>
                
               		 <tr>
                		<td>Bus Phone:</td>
                		<td><input type="text" name="CustBusPhone" value="" /></td>
                	</tr>
                
               		 <tr>
                		<td>Email:</td>
                		<td><input type="text" name="CustEmail" value="" /></td>
                	</tr>                 	
                	             	                            	
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
                	
                	<tr>
                		<td><input type="submit" value="Confirm Registration" /></td>
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
   
    <%!  
public  void  doInsert(HttpServletRequest request,
		HttpServletResponse response,JspWriter out)
 {
    	String firstname = request.getParameter("CustFirstName");
    	String lastname = request.getParameter("CustLastName");
    	String address = request.getParameter("CustAddress");
    	String city = request.getParameter("CustCity");
    	String province = request.getParameter("CustProv");
    	String postal = request.getParameter("CustPostal");
    	String country = request.getParameter("CustCountry");
    	String HPhone = request.getParameter("CustHomePhone");
    	String BPhone = request.getParameter("CustBusPhone");
    	String Email = request.getParameter("CustEmail");
    	
    	
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
    	qry.append(password);
    	qry.append("',2,"); // setting the role to 2, which identifies a Customers
    	qry.append(custId); // gets the CustomerId after insertion of the latest customer and stores it to users table.
    	qry.append(")");
    	
    	int j = stmt.executeUpdate(qry.toString());
    	//------------------------------	
    	
    	conn.close();
       }
       catch(Exception e)
       {
       System.out.println(e);
       e.printStackTrace();
       }
    }
    %> 
    
  <%@include file="Footer.jsp" %>