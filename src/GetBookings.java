

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import TrvlDBase.BookingDB;
import TrvlDBase.CustomerDB;
import TrvlEntity.Bookings;
import TrvlEntity.Customers;

/**
 * Servlet implementation class GetBookings
 */
@WebServlet("/GetBookings")
public class GetBookings extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBookings() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doProcess(request,response);
	}
	
	//--------------------------------
	private void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws IOException 
	{ 
		String custId = request.getParameter("custId");
		
		if(!custId.isEmpty())
		{
			Vector<Bookings> bookgs = BookingDB.getBookings(Integer.valueOf(custId));
			
			//System.out.println(bookgs.size());
			PrintWriter out = response.getWriter();
			
			out.print("<select name='selBkgs' onchange='showBookingDetls(this.value)'>");
			out.print("<option value='0'>Select Booking</option>\n");
			
			SimpleDateFormat dtFormat = new SimpleDateFormat("dd-MMM-yyyy");
			
			for(Bookings bkg:bookgs)
			{
				out.print("<option value='" + bkg.getBkgId().toString() + "'>");
				out.print(dtFormat.format(bkg.getBkgDate()) + " " + bkg.getBkgNumber());
				out.print("</option>\n"); 
			}
			
			out.print("</select>");
		}
		
	}
	//-------------------------------
}
