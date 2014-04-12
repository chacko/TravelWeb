package TrvlDBase;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import TrvlEntity.Bookings;
import TrvlEntity.Customers;

public class BookingDB 
{

	//---------------------------------------------
	public static Vector<Bookings> getBookings(Integer custId)
	{
		try 
		{
			Vector<Bookings> bookgs = new Vector<Bookings>();
			
			Connection conn = DBase.getMySqlConnection();
			
			StringBuilder qry = new StringBuilder();
			qry.append("SELECT BookingId, BookingNo, ");
			qry.append(" BookingDate FROM Bookings ");
			qry.append(" WHERE  CustomerId =?");
			qry.append(" ORDER BY BookingDate DESC ");
			PreparedStatement  stmt = conn.prepareStatement(qry.toString());
			stmt.setInt(1, custId);
			//System.out.println("DB Id " + custId.toString());
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				
				Bookings bkg = new Bookings();
				bkg.setBkgId(Integer.valueOf(rs.getString("BookingId")));
				bkg.setBkgDate(rs.getDate("BookingDate"));
				bkg.setBkgNumber(rs.getString("BookingNo"));
				
				bookgs.add(bkg);
				bkg = null;
			}
			
			DBase.closeDBase(conn, rs, stmt);
			//System.out.println("DB Size " + bookgs.size());
			return bookgs;
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null; 
	}
	//---------------------------------------------
	public static Bookings getBookingDetls(Integer bkgId)
	{
		try 
		{
			Bookings bkg = new Bookings();
			
			Connection conn = DBase.getMySqlConnection();
			
			StringBuilder qry = new StringBuilder();
			qry.append("SELECT b.TravelerCount, t.TTName, p.PkgName, p.PkgStartDate, ");
			qry.append(" p.PkgEndDate,p.PkgDesc, p.PkgBasePrice ");
			qry.append(" FROM Bookings b, TripTypes t, Packages p ");
			qry.append(" WHERE  b.TripTypeId = t.TripTypeId AND ");
			qry.append(" b.PackageId = p.PackageId AND b.BookingId =? ");
			
			PreparedStatement  stmt = conn.prepareStatement(qry.toString());
			stmt.setInt(1, bkgId);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				bkg.setTrvlCount(rs.getDouble("TravelerCount"));
				bkg.setTrip(rs.getString("TTName"));
				bkg.setPackage(rs.getString("PkgName"));
				bkg.setPkgStartDt(rs.getDate("PkgStartDate"));
				bkg.setPkgEndDt(rs.getDate("PkgEndDate"));
				bkg.setPkgDesc(rs.getString("PkgDesc"));
				bkg.setPkgPrice(rs.getDouble("PkgBasePrice"));
			}
			
			DBase.closeDBase(conn, rs, stmt);
			
			return bkg;
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null; 
	}
	//---------------------------------------------
}
