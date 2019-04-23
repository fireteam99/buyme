package buyme;

import buyme.Item;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

public class Auction {
	public ResultSet showEdit(int aid)throws SQLException,Exception{
		ResultSet rs=null;
		try{
	    	Item i=new Item();
	    	rs=i.getByID(aid);
	    	return rs;
		}
		catch(SQLException se){
			throw se;
		}
		catch(Exception e){
			throw e;
		}
	}
	public void edit(int aid, String itemName, double buyAtPrice, double increment, String itemDescription, 
			String categoryName, String subcategoryName, java.sql.Timestamp endDate) throws SQLException, Exception{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	Statement st = con.createStatement();
	    	String updateStatement;
	    	updateStatement="UPDATE Auction SET item_name='"+itemName+"', buy_at_price="+buyAtPrice+", increment="+increment
	    		+", item_description='"+itemDescription+"', category_name='"+categoryName+"', subcategory_name='"+subcategoryName+"', "
	    		+ "endDate='"+endDate.toString()+"' WHERE auction_id="+aid;		
	    	st.executeUpdate(updateStatement);
		}
		catch(SQLException se){
			throw se;
		}
		catch(Exception e){
			throw e;
		}
	}
	
	public ResultSet show() throws SQLException, Exception{
		ResultSet rs=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	Statement st = con.createStatement();    	
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	    	String auctionSelect="SELECT * FROM Auction WHERE TIMESTAMP(end_date)>'"+date+"'";
	    	rs=st.executeQuery(auctionSelect);
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
