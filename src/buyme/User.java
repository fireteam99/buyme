package buyme;

import java.sql.*;

public class User {	
	public void create(String name,String pass, String username, String email){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
		    Statement st = con.createStatement();
		    java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		    String insertStatement = String.format("INSERT INTO User (created_at, full_name, password, username, email, user_id) VALUES ('%s', '%s', '%s', '%s', '%s', null);", date.toString(), name, pass, username, email);
		    st.executeUpdate(insertStatement);
		}
		catch(SQLException se) {} 
		catch(Exception e) {}
	}
	
	public static ResultSet getUser(String username,String password) throws Exception{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
		    Statement st = con.createStatement();
		    java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		    ResultSet rs;
		    String selectStatement = "SELECT * FROM User WHERE username='"+username+"' AND password='"+password+"'";
		    rs=st.executeQuery(selectStatement);
		    return rs;
		}
		catch(SQLException se) {throw se;} 
		catch(Exception e) {throw e;}
	}
	
	public static ResultSet getUser(String username) throws Exception{ // OVERLOADED FOR JUST USER
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
		    Statement st = con.createStatement();
		    java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		    ResultSet rs;
		    String selectStatement = "SELECT * FROM User WHERE username='"+username+"'";
		    rs=st.executeQuery(selectStatement);
		    return rs;
		}
		catch(SQLException se) {throw se;} 
		catch(Exception e) {throw e;}
	}
	
	
	
	public ResultSet searchUsers(String search) throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
		    Statement st = con.createStatement();
		    java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		    ResultSet rs;
		    String selectStatement = "SELECT * FROM User WHERE username LIKE %'"+search+"'%";
		    rs=st.executeQuery(selectStatement);
		    return rs;
		}
		catch(SQLException se) {throw se;} 
		catch(Exception e) {throw e;}
	}
	
	public void deleteUser(String username) throws Exception {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
		    Statement st = con.createStatement();
		    String deleteStatement = "DELETE FROM User WEHRE username='"+username+"'";
		    st.executeQuery(deleteStatement);
		}
		catch(SQLException se) {throw se;} 
		catch(Exception e) {throw e;}
	}
}
