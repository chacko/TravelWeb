package TrvlDBase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import TrvlEntity.*;


public class CustomerDB {
	public CustomerDB(){
		
	}
	
	// retrieving all customer which is assigned to the agent which is about to be deleted
	public static Vector<Customers> getCustomers(){
		try {
			Vector<Customers> customer = new Vector<Customers>();
			
			Connection conn = DBase.getMySqlConnection();
			
			Statement stmt = conn.createStatement();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT customerId, custFirstName, custLastName FROM Customers ");
						
			ResultSet rs = stmt.executeQuery(sql.toString());
			
			while(rs.next()){
				Customers cust = new Customers();
				cust.setCustomerID(Integer.valueOf(rs.getString("customerId")));
				cust.setCustomerFirstName(rs.getString("custFirstName"));
				cust.setCustomerLastName(rs.getString("custLastName"));
				
				customer.add(cust);
				cust = null;
			}
			
			DBase.closeDBase(conn, rs, stmt);
			return customer;
			
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
	public static Vector<Customers> getCustomer(Integer custId){
		try {
			Vector<Customers> customer = new Vector<Customers>();
			
			Connection conn = DBase.getMySqlConnection();
			
			StringBuilder qry = new StringBuilder();
			qry.append("SELECT CustomerId, CustFirstName, CustLastName ");
			qry.append(",CustAddress,CustCity,CustProv,CustPostal,CustBusPhone");
			qry.append(",CustEmail FROM Customers ");
			qry.append(" WHERE  customerId =?");
			
			PreparedStatement  stmt = conn.prepareStatement(qry.toString());
			stmt.setInt(1, custId);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				Customers cust = new Customers();
				cust.setCustomerID(Integer.valueOf(rs.getString("customerId")));
				cust.setCustomerFirstName(rs.getString("custFirstName"));
				cust.setCustomerLastName(rs.getString("custLastName"));
				cust.setCustomerAdrs(rs.getString("CustAddress"));
				cust.setCustomerCity(rs.getString("CustCity"));
				cust.setCustomerProv(rs.getString("CustProv"));
				cust.setCustomerPostal(rs.getString("CustPostal"));
				
				customer.add(cust);
				cust = null;
			}
			
			DBase.closeDBase(conn, rs, stmt);
			return customer;
			
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
