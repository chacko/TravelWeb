

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import TrvlDBase.CustomerDB;
import TrvlDBase.DBase;
import TrvlEntity.Customers;

/**
 * Servlet implementation class GetCustomer
 */
@WebServlet("/GetCustomer")
public class GetCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCustomer() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	
	private void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws IOException 
	{ 
		String custId = request.getParameter("Cust");
		
		if(!custId.isEmpty())
		{
			Customers cust = CustomerDB.getCustomer(Integer.valueOf(custId));
			
			PrintWriter out = response.getWriter();
			
			out.print("<table border='0'>\n");
			out.print("<tr><td>First Name:</td>");
			out.print("<td>" + cust.getCustomerFirstName() + "</td></tr>\n");
			out.print("<tr><td>Last Name:</td>");
			out.print("<td>" + cust.getCustomerLastName() + "</td></tr>\n");
			out.print("<tr><td>Address:</td>");
			out.print("<td>" + cust.getCustomerAdrs() + "</td></tr>\n");
			out.print("<tr><td>City:</td>");
			out.print("<td>" + cust.getCustomerCity() + "</td></tr>\n");
			out.print("<tr><td>Province:</td>");
			out.print("<td>" + cust.getCustomerProv() + "</td></tr>\n");
			out.print("<tr><td>Postal Code:</td>");
			out.print("<td>" + cust.getCustomerPostal() + "</td></tr>\n");
			out.print("<tr><td>Phone:</td>");
			out.print("<td>" + cust.getCustomerPhone() + "</td></tr>\n");
			out.print("<tr><td>Email:</td>");
			out.print("<td>" + cust.getCustomerEmail() + "</td></tr>\n");
			out.print("</table>\n");	
		}
		
	}
}
