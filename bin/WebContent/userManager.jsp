<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Manage Users</title>
</head>
<body>
	<h3>Manage Customer Accounts</h3>
	<form>
      <input type="text" name="search" placeholder="Username">
      <button type="submit">Search</button>
    </form>
    <table>
    	<tr>
    		<th>Username</th>
    		<th>Full Name</th>
    		<th>Email</th>
    	</tr>
<% 	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
    	Statement st = con.createStatement();
    	ResultSet rs;
    	String name = request.getParameter("search");
    	if (name != null && name.length() > 0) {
    	    rs = st.executeQuery("SELECT * FROM User WHERE username LIKE'%"+name+"%' AND user_id NOT IN (SELECT user_id FROM Admin) AND user_id NOT IN(SELECT user_id FROM Representative)");
    	} else {
    	    rs = st.executeQuery("SELECT * FROM User WHERE user_id NOT IN (SELECT user_id FROM Admin) AND user_id NOT IN(SELECT user_id FROM Representative)");
    	}
    	while(rs.next()) {
%>
		<tr>
			<td><%=rs.getString("username")%></td>
			<td><%=rs.getString("full_name")%></td>
			<td><%=rs.getString("email")%></td>
			<td>
			<form action="editUser.jsp" method="POST">
      			<input type="submit" value="Edit">
      			<input type="hidden" value=<%=rs.getString("username")%> name="username">
      			<input type="hidden" value=<%=rs.getString("full_name")%> name="name">
       			<input type="hidden" value=<%=rs.getString("email")%> name="email">
   			</form>
   			</td>
   			<td>
  			<form method="POST">
   				<input type="submit" value="Delete" onclick="if(confirm('Are you sure? This action cannot be undone.')){form.action='deleteUser.jsp'}">
  				<input type="hidden" name="usn" value=<%=rs.getString("username")%>> 
  			</form>
   			</td>
			
		</tr>     
<%    
		}
	}
	catch(SQLException se){
		se.printStackTrace();
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>
	</table>
</body>
</html>
