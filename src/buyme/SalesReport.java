package buyme;

import java.sql.*;

public class SalesReport {

	public String generate(String report) throws SQLException, Exception{
	    ResultSet rs=null;
	    String output="";
		try{
	        if(report.equals("Earnings")){
				rs = totalEarnings();
				output="Total Earnings: $";
				if(rs.next()){
					if (rs.getString(1) == null) {
						output+= "0";
					} else {
						output+=rs.getString(1);	
					}
				}
			}
			else if(report.equals("earnPerItem")){
				rs= itemEarnings();	
				output="<h3>Earnings Per Item</h3>";
				output+="<table>";
				output+="<tr><th>Total</th><th>Item</th></tr>";
				while(rs.next()){
					output+="<tr>";
					output+="<td>"+rs.getString(1)+"</td>";
					output+="<td>"+rs.getString(2)+"</td>";
					output+="</tr>";
				}
				output+="</table>";
			}
			else if(report.equals("earnPerIT")){
				rs = itemtypeEarnings();
				output="<h3>Earnings Per Item Type</h3>";
				output+="<table>";
				output+="<tr><th>Total</th><th>Item Type</th></tr>";
				while(rs.next()){
					output+="<tr>";
					output+="<td>"+rs.getString(1)+"</td>";
					output+="<td>"+rs.getString(2)+"</td>";
					output+="</tr>";
				}
				output+="</table>";
			}
			else if(report.equals("earnPerUser")){
				rs = userEarnings();
				output="<h3>Earnings Per User</h3>";
				output+="<table>";
				output+="<tr><th>Total</th><th>User</th></tr>";
				while(rs.next()){
					output+="<tr>";
					output+="<td>"+rs.getString(1)+"</td>";
					output+="<td>"+rs.getString(2)+"</td>";
					output+="</tr>";
				}
				output+="</table>";
			}
			else if(report.equals("bestItem")){
				rs = bestItems();
				output="<h3>Best Selling Items</h3>";
				output+="<table>";
				output+="<tr><th>Item</th><th>Total Sells</th></tr>";
				while(rs.next()){
					output+="<tr>";
					output+="<td>"+rs.getString(1)+"</td>";
					output+="<td>"+rs.getString(2)+"</td>";
					output+="</tr>";
				}
				output+="</table>";
			}
			else if(report.equals("bestBuyer")){
				rs = bestBuyers();
				output="<h3>Best Buyers</h3>";
				output+="<table>";
				output+="<tr><th>User</th><th>Total Buys</th></tr>";
				while(rs.next()){
					output+="<tr>";
					output+="<td>"+rs.getString(2)+"</td>";
					output+="<td>"+rs.getString(3)+"</td>";
					output+="</tr>";
				}
				output+="</table>";
			}
			else{
				return "Error: <a href='adminDashboard'>Return to dashboard.</a>";
			}
	        return output;
	    }
	    catch(SQLException se){
	    	throw se;
	    }
	    catch(Exception e){
	    	throw e;
	    }
	}
	
	public static ResultSet totalEarnings()throws SQLException, Exception{
		Connection con=null;
	    Statement st=null;
	    ResultSet rs=null;
		try{
	    	Class.forName("com.mysql.jdbc.Driver");
	    	con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	st = con.createStatement();	
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	    	String query="SELECT SUM(current_bid) FROM Auction WHERE TIMESTAMP(end_date)<'"+date+"' AND current_bid > min_sell_price";
	    	rs = st.executeQuery(query);
	    	return rs;
		}
		catch(SQLException se){
			throw se;
	    }
	    catch(Exception e){
	    	throw e;
	    }
	}
	
	public static ResultSet itemEarnings()throws SQLException, Exception{
		Connection con=null;
	    Statement st=null;
	    ResultSet rs=null;
		try{
	    	Class.forName("com.mysql.jdbc.Driver");
	    	con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	st = con.createStatement();	
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	    	String query="SELECT SUM(current_bid), item_name FROM Auction GROUP BY item_name WHERE TIMESTAMP(end_date)<'"+date+"' AND current_bid>buy_at_price";
	    	rs = st.executeQuery(query);
	    	return rs;
		}
		catch(SQLException se){
			throw se;
	    }
	    catch(Exception e){
	    	throw e;
	    }
	}
	
	public static ResultSet itemtypeEarnings()throws SQLException, Exception{
		Connection con=null;
	    Statement st=null;
	    ResultSet rs=null;
		try{
	    	Class.forName("com.mysql.jdbc.Driver");
	    	con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	st = con.createStatement();	
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	    	String query="SELECT SUM(current_bid), subcategory_name FROM Auction GROUP BY subcategory_name WHERE TIMESTAMP(end_date)<'"+date+"' AND current_bid>buy_at_price";
	    	rs = st.executeQuery(query);
	    	return rs;
		}
		catch(SQLException se){
			throw se;
	    }
	    catch(Exception e){
	    	throw e;
	    }
	}
	
	public static ResultSet userEarnings()throws SQLException, Exception{
		Connection con=null;
	    Statement st=null;
	    ResultSet rs=null;
		try{
	    	Class.forName("com.mysql.jdbc.Driver");
	    	con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	st = con.createStatement();	
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	    	String query="SELECT SUM(current_bid), seller, user_id FROM Auction GROUP BY user_id WHERE TIMESTAMP(end_date)<'"+date+"' AND current_bid>buy_at_price";
	    	rs = st.executeQuery(query);
	    	return rs;
		}
		catch(SQLException se){
			throw se;
	    }
	    catch(Exception e){
	    	throw e;
	    }
	}

	public static ResultSet bestItems()throws SQLException, Exception{
		Connection con=null;
	    Statement st=null;
	    ResultSet rs=null;
		try{
	    	Class.forName("com.mysql.jdbc.Driver");
	    	con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	st = con.createStatement();	
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	    	String query="SELECT item_name, COUNT(item_name) FROM Auction ORDER BY COUNT(item_name) DESC WHERE TIMESTAMP(end_date)<'"+date+"' AND current_bid>buy_at_price";
	    	rs = st.executeQuery(query);
	    	return rs;
		}
		catch(SQLException se){
			throw se;
	    }
	    catch(Exception e){
	    	throw e;
	    }
	}

	public static ResultSet bestBuyers()throws SQLException, Exception{
		Connection con=null;
	    Statement st=null;
	    ResultSet rs=null;
		try{
	    	Class.forName("com.mysql.jdbc.Driver");
	    	con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	    	st = con.createStatement();	
	    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	    	String query="SELECT user_id,name, COUNT(user_id) FROM Bid INNER JOIN Auction ON Auction.auction_id=Bid.auction_id WHERE TIMESTAMP(end_date)<'"+date+"'AND current_bid>buy_at_price AND Auction.current_bid=Bid.price GROUP BY user_id ORDER BY COUNT(user_id) DESC" ;
	    	rs = st.executeQuery(query);
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
