package TrvlDBase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import TrvlEntity.*;

public class UsersDB 
{
	
	/* Data base methods */
	// SELECT - Get get specific agent information
	public static Users getUser(String userId,String passwd)
	{
		try 
		{
			Users usr = new Users();
			
			// get connection
			Connection conn = DBase.getMySqlConnection();
			
			PreparedStatement stmt;
			
			ResultSet rs;
			
			StringBuilder qry = new StringBuilder();
			qry.append("SELECT userid,passwd,role,primaryKeyID ");
			qry.append(" FROM users where userid =? AND passwd =?");
			//System.out.println(qry.toString());
			stmt = conn.prepareStatement(qry.toString());
						
		    stmt.setString(1, userId);
		    stmt.setString(2, passwd);
		    
			rs = stmt.executeQuery();
			
			while (rs.next())
			{
				usr.setUserId(rs.getString("userid"));
				usr.setPasswd(rs.getString("passwd"));
				usr.setRole(rs.getInt("role"));
				usr.setPrimaryKeyId(rs.getInt("primaryKeyID"));
			}

			// close all data base objects to release memory
			DBase.closeDBase(conn, rs, stmt);
			/*usr.setPasswd("asd");
			usr.setUserId("asdas");
			usr.setPrimaryKeyId(12344);
			usr.setRole(2);*/
			return usr;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		return null;
	}
	// -----------------------------------------

}
