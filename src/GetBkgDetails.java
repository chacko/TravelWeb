

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;

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
 * Servlet implementation class GetBkgDetails
 */
@WebServlet("/GetBkgDetails")
public class GetBkgDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBkgDetails() {
        super();
        // TODO Auto-generated constructor stub
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
	//------------------------------------------------
	private void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws IOException 
	{ 
		String bookgId = request.getParameter("bookgId");
		
		if(!bookgId.isEmpty())
		{
			Bookings bkg = BookingDB.getBookingDetls(Integer.valueOf(bookgId));
			
			PrintWriter out = response.getWriter();
			
			SimpleDateFormat dtFormat = new SimpleDateFormat("dd-MMM-yyyy");
			
			out.print("<table border='0' style='width:100%'>\n");
			out.print("<tr><td>Traveler Count:	</td>");
			out.print("<td>" + bkg.getTrvlCount() + "</td></tr>\n");
			out.print("<tr><td>Trip:	</td>");
			out.print("<td>" + bkg.getTrip() + "</td></tr>\n");
			out.print("<tr><td>Package:	</td>");
			out.print("<td>" + bkg.getPackage() + "</td></tr>\n");
			out.print("<tr><td>Start:	</td>");
			out.print("<td>" + dtFormat.format(bkg.getPkgStartDt()) + "</td></tr>\n");
			out.print("<tr><td>End:	</td>");
			out.print("<td>" + dtFormat.format(bkg.getPkgEndDt()) + "</td></tr>\n");
			out.print("<tr><td>Info:	</td>");
			out.print("<td>" + bkg.getPkgDesc() + "</td></tr>\n");
			out.print("<tr><td>Price:	</td>");
			
			NumberFormat formatter = NumberFormat.getCurrencyInstance();
			out.print("<td>" + formatter.format(bkg.getPkgPrice()) + "</td></tr>\n");

			out.print("</table>\n");	
		}
		
	}
	//-------------------------------------------------
}
