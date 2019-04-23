package buyme;
import java.sql.*;
import java.text.SimpleDateFormat;

public class Bid {
	
	public static void createBid(int auction_id, int user_id, double price) throws SQLException, Exception{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	Statement st = con.createStatement();  
	    	String createStatement= String.format("INSERT INTO Bid (auction_id, user_id, price) VALUES (%d, %d, %f);",auction_id, user_id, price);  
	    	st.executeUpdate(createStatement);
	    	
		}
		catch(SQLException se){
			throw se;
		}
		catch(Exception e){
			throw e;
		}
	}
	
	
	
	
	public void remove(int bid) throws SQLException, Exception{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	Statement st = con.createStatement();  
	    	String delStatement="DELETE FROM Bid WHERE bid_id="+bid;
	    	st.executeUpdate(delStatement);
		}
		catch(SQLException se){
			throw se;
		}
		catch(Exception e){
			throw e;
		}
	}
	
	public void edit(int aid, int uid, int bid, double price) throws SQLException, Exception{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	Statement st = con.createStatement();  
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	    	String updateStatement="UDPATE Bid SET uid="+uid+", price="+price+", time_create='"+date.toString()+"'WHERE bid_id="+bid;
	    	st.executeUpdate(updateStatement);
		}
		catch(SQLException se){
			throw se;
		}
		catch(Exception e){
			throw e;
		}
	}
	
	public ResultSet showEdit(int bid, int aid) throws SQLException,Exception{
		ResultSet rs=null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	Statement st = con.createStatement();  
	    	String selectStatement="SELECT * FROM Bid WHERE bid="+bid+" AND aid="+aid;
	    	rs=st.executeQuery(selectStatement);
	    	return rs;
		}
		catch(SQLException se){
			throw se;
		}
		catch(Exception e){
			throw e;
		}
	}
	public static ResultSet showBids(int auction_id) throws SQLException, Exception{
		ResultSet rs=null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	Statement st = con.createStatement();    	
	    	String bidSelect="SELECT * FROM Bid WHERE auction_id="+auction_id+" ORDER BY time_create DESC";
	    	rs=st.executeQuery(bidSelect);
	    	return rs;
		}
		catch(SQLException se){
			throw se;
		}
		catch(Exception e){
			throw e;
		}
	}
}
