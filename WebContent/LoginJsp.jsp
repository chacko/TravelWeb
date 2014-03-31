<%@page import="org.GNOME.Accessibility.Application"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
   import="java.io.*,java.util.*" 
    
    %>
   
<%! 

//JDBC driver name and database URL
static final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
static final String DB_URL="jdbc:mysql://localhost/test";

//  Database credentials
static final String USER = "root";
static final String PASS = "";

private String message = "";



private void printForm(JspWriter out) throws IOException
{
	if(!message.equals(""))
	{
		out.print("<h2 style='color:red'>" + message + "<h2>");
	}
	out.print("<tr>\n<td style='height:405px;vertical-align:top'><form method='post'>\n");
	out.print("<table border='1' style='width:100%'>\n");
	out.print("<tr><td>User Id</td>\n"); 
	out.print("<td><input type='text' name='userId'></td></tr>\n");
	out.print("<tr><td>Password</td>\n");
	out.print("<td><input type='text' name='password'></td></tr>\n");
	out.print("<tr><td colspan='2'><input type=\"submit\" value=\"Login\"> </td></tr>\n");				
	out.print("</table>\n");
	out.print("</form></td></tr>\n");
}

private void printSuccessPage(JspWriter out) throws IOException
{
	out.print("You are logged in!");
}

private void checkData(String userID, String pword)
{
	try
	{
		// Register JDBC driver
	    Class.forName(JDBC_DRIVER);
	    //Class.forName(getServletContext().getInitParameter("driver"));
	    
	    //String str1 = ;
	    
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    // Open a connection
	    //conn = DriverManager.getConnection(DB_URL,USER,PASS);
	    conn = DriverManager.getConnection(DB_URL,USER,PASS);
	    //application.getInitParameter("driver")
	
	    // Execute SQL query
	    //stmt = conn.createStatement();
	    
	    String sql;
	    sql = "SELECT userid, passwd FROM users where userid=? ";
	    stmt = conn.prepareStatement(sql);
	    stmt.setString(1, userID);
	    
	    ResultSet rs = stmt.executeQuery();
	    
	    // Extract data from result set
    
	    if(rs.next())
	    {
	      if(!pword.equals(rs.getString(1)))
	      {
	    	  message = "UserId or Password are incorrect";
	      }
	      else
	      {
	    	  message="";
	      }
	      
	    }
	}
	catch(ClassNotFoundException e)
	{
		e.printStackTrace();
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
    //-----------------
}
%>

<% 
//application.setAttribute("hitCounter", 2);

if(request.getParameter("userId") != null)
{
	String frmUserId = ((request.getParameter("userId") == null)? "" : request.getParameter("userId")) ;
	String frmPasswd = ((request.getParameter("password") == null)? "" : request.getParameter("password"));

	if(frmUserId.equals("") || frmPasswd.equals(""))
	{
		message = "UserId or Password does not have a value. Please Enter it.";
		//printForm(out);
	}
	else
	{
		checkData(frmUserId,frmPasswd);
		/* if(message.equals(""))
		{
			printSuccessPage(out);
		}
		else
		{
			message="";
		} */
	}
}

%>
<%@include file="Header.jsp" %>
<% 

if ((request.getParameter("userId") != null) && message.equals(""))
{
    printSuccessPage(out);
}
else
{
   printForm(out);
}

%>
<%@include file="Footer.jsp" %>