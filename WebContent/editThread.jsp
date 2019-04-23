<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
   <head>
      <title>Edit Your thread</title>
   </head>
   <body>
	<h1>Here!</h1>
	<% 
	String threadid = request.getParameter("threadid");
	String username = (String)session.getAttribute("user");
	String userid = "";//get the userid from the username in the database
	
	//get the username from the user_id to show who posted the thread
	String get_username = "SELECT * FROM User u WHERE u.username = '" + username + "' ";
	String url = "jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "cs336", "thisisareallysecurepassword551");
	Statement st = con.createStatement();
	st = con.createStatement();
	ResultSet result_username = st.executeQuery(get_username);
	String th_username = "";
	if(result_username.next()){
		userid= result_username.getString("user_id");
	}	
	String get_thuserid = "SELECT * FROM Thread t WHERE t.threadid = '" + threadid + "'";//get the userid of the threads poster
	result_username = st.executeQuery(get_thuserid);
	String th_userid = "";
	String title = "";
	String description = "";
	if(result_username.next()){
		th_userid = result_username.getString("user_id");
		title = result_username.getString("title");
		description = result_username.getString("description");
	}
	
	//String euserid = request.getParameter("userid");//get userid from user parameter

	if(!th_userid.equals(userid)){
		out.print("You may not edit a thread that you haven't posted");
	}//end of if error
	else{//TO DO: can I make the placeholder for title and description the old stuff?
		String action = "editThreadAction.jsp?threadid=" + threadid;
		out.println("<form method='post' action='" + action + "'>");
		
			out.println("<label>Title</label>");
			out.println("<input type='text' name='" + title + "' required></input>");

			out.println("<label>Description</label>");
			out.println("<textarea name='body' placeholder='" + description + "'  required></textarea>");
			%>
			<label>Solved?</label>
			<input type="checkbox" name="solved" value="Solved"> 

			<input type="submit" value="Submit"></input>


		</form>

	<% } //end of else %>
</body>
</html>
