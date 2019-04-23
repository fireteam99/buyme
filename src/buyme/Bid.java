package buyme;
import java.sql.*;
import java.text.SimpleDateFormat;

public class Bid {
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
	
	public String showEdit(int bid, int aid) throws SQLException,Exception{
		String edit=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	Statement st = con.createStatement();  
	    	String selectStatement="SELECT * FROM Bid WHERE bid="+bid+" AND aid="+aid;
	    	ResultSet rs=st.executeQuery(selectStatement);
	    	edit+="<form action='editBidDetails.jsp' method='POST'>"
	    	    	+"Auction ID <input type='number' name='aid' value="+rs.getInt("auction_id")+"><br>"
	    	    	+"Bid ID <input type='number' name='bid' value="+rs.getInt("bid_id")+"><br>"
	    	    	+"User ID <input type='number' name='uid' value="+rs.getInt("user_id")+"><br>"
	    	    	+"Price <input type='number' name='price' value='"+rs.getDouble("price")+"'><br>"
	    	    	+"<input type='submit' value='Save Changes'></form>";
	    	return edit;
		}
		catch(SQLException se){
			throw se;
		}
		catch(Exception e){
			throw e;
		}
	}
	public String show(int aid) throws SQLException, Exception{
		String re="";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	Statement st = con.createStatement();    	
	    	String bidSelect="SELECT * FROM Bid WHERE auction_id="+aid+" ORDER BY time_create DESC";
	    	ResultSet rs=st.executeQuery(bidSelect);
	    	re+="<table>";
	    	re+="<tr><th>Bid ID</th><th>Bidder ID</th><th>Price</th><th>Bid Time</th></tr>";
	    	while(rs.next()){
	    		re+="<tr>";
	    		re+="<td>"+rs.getInt("bid_id")+"</td>";	
	    		re+="<td>"+rs.getDouble("user_id")+"</td>";		
	    		re+="<td>"+rs.getInt("price")+"</td>";		
	    		re+="<td>"+rs.getTimestamp("time_create")+"</td>";
	    		re+="<td><form action='editBid.jsp' method='POST'><input type='submit' value='Edit'>"
	    				+ "<input type='hidden' name='aid' value="+aid
	    				+ "<input type='hidden' name='bid' value="+rs.getInt("bid_id")
	    				+ "</form></td>";
	    		if(rs.getInt("price")==rs.getInt("current_bid")){
	    			re+="<td><form action='deleteBid.jsp' method='POST'><input type='submit' value='Delete'>"
	    					+ "<input type='hidden' name='bid' value="+Integer.toString(rs.getInt("bid_id"))+"></form></td>";
	    		}
	    		re+="</tr>";
	    	}
	    	re+="</table>";
	    	return re;
		}
		catch(SQLException se){
			throw se;
		}
		catch(Exception e){
			throw e;
		}
	}
}
