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
		th_username = result_username.getString("username");
	}
	
	String euserid = request.getParameter("userid");

	if(!euserid.equals(userid)){
		out.print("You may not edit a thread that you haven't posted");
	}//end of if error
	else{//TO DO: can I make the placeholder for title and description the old stuff?
		String action = "editThreadAction.jsp?threadid=" + threadid;
		out.println("<form method='post' action='" + action + "'>");
		%>
			<label>Title</label>
			<input type="text" name="title" required></input>

			<label>Description</label>
			<textarea name="body" placeholder="What is your question?"  required></textarea>
			
			<label>Solved?</label>
			<input type="checkbox" name="solved" value="Solved"> 

			<input type="submit" value="Submit"></input>


		</form>

	<% } //end of else %>
</body>
</html>
