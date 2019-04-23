package buyme;

import buyme.Item;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

public class Auction {
	public String showEdit(int aid)throws SQLException,Exception{
		String edit="";
		try{
	    	Item i=new Item();
	    	ResultSet rs=i.getByID(aid);
	    	rs.next();
	    	edit+="<form action='editAuctionDetails.jsp' method='POST'>"
	    	+"Item Name <input type='text' name='itemName' value='"+rs.getString("item_Name")+"'><br>"
	    	+"Buy At Price <input type='number' name='buyAtPrice' value="+rs.getDouble("buy_at_price")+"><br>"
	    	+"Increment <input type='number' name='increment' value="+rs.getDouble("increment")+"><br>"
	    	+"Item Description <textarea name='itemDescription'>"+rs.getString("item_description")+"</textarea><br>"
	    	+"Category Name <input type='text' name='categoryName' value='"+rs.getString("category_name")+"'><br>"
	    	+"Subcategory Name <input type='text' name='subcategoryName' value='"+rs.getString("subcategory_name")+"'><br>"
	    	+"End Date <input type='datetime' name='endDate' value='"+new SimpleDateFormat("MM/dd/yyyy HH:mm").format(rs.getTimestamp("end_date"))+"'><br>"
	    	+"<input type='hidden' value="+aid+"name='aid'>"
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
	
	public String show() throws SQLException, Exception{
		String re="";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	Statement st = con.createStatement();    	
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	    	String auctionSelect="SELECT * FROM Auction WHERE TIMESTAMP(end_date)>'"+date+"'";
	    	ResultSet rs=st.executeQuery(auctionSelect);
	    	re+="<table>";
	    	re+="<tr><th>Auction ID</th><th>Item Name</th><th>Start Date</th><th>End Date</th></tr>";
	    	while(rs.next()){
	    		re+="<tr>";
	    		re+="<td>"+rs.getInt("auction_id")+"</td>";	
	    		re+="<td>"+rs.getString("item_name")+"</td>";		
	    		re+="<td>"+new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(rs.getTimestamp("start_date"))+"</td>";		
	    		re+="<td>"+new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(rs.getTimestamp("end_date"))+"</td>";
	    		re+="<td><form action='editAuction.jsp' method='POST'><input type='submit' value='Edit'><input type='hidden' name='aid' value="+Integer.toString(rs.getInt("auction_id"))+"></form></td>";
	    		re+="<td><form method='POST'><input type='submit' value='Delete' onclick='if(confirm(\"Are you sure? This action cannot be undone.\")){form.action=\"deleteAuction.jsp\"}'>"
	    				+"<input type='hidden' name='aid' value="+Integer.toString(rs.getInt("auction_id"))+ "></form></td>";
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
