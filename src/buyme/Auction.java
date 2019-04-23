package buyme;

import buyme.Item;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Auction {
	
	public static int createAuction(String item_name, String pic_link, double initial_price, double increment, String item_description, String category_name, String subcategory_name, String end_date, int seller_id, double min_sell_price) throws Exception{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
		    Statement st = con.createStatement();
		    
		    String insertStatement = String.format("INSERT INTO Auction (item_name, image, initial_price, increment, item_description, category_name, subcategory_name, end_date, user_id, min_sell_price) VALUES ('%s', '%s', %f, %f, '%s', '%s', '%s', STR_TO_DATE('%s','%%Y-%%m-%%d %%T'), '%d', %f);", item_name, pic_link, initial_price, increment, item_description, category_name, subcategory_name, end_date, seller_id, min_sell_price);
		    System.out.println(insertStatement);
		    st.executeUpdate(insertStatement);

		    ResultSet rs = st.executeQuery("SELECT LAST_INSERT_ID() AS auction_id FROM Auction;");
		    rs.next();
		    return rs.getInt("auction_id");
		    
		}
		catch(SQLException se) {
			throw se;
		} 
		catch(Exception e) {
			throw e;
		}
	}
	
	
	public static ResultSet showEdit(int aid)throws SQLException,Exception{
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
	public static void edit(int aid, String itemName, double buyAtPrice, double increment, String itemDescription, 
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
	
	public static ResultSet getAuction(int auction_id) throws SQLException, Exception {
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	Statement st = con.createStatement();    	
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	    	String auctionSelect="SELECT * FROM Auction WHERE auction_id="+auction_id+";";
	    	ResultSet rs=st.executeQuery(auctionSelect);
	    	return rs;
		}
		catch(SQLException se){
			throw se;
		}
		catch(Exception e){
			throw e;
		}
	}
	
	public static ResultSet show() throws SQLException, Exception{
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

