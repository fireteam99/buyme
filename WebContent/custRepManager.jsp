<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Delete Customer Rep</title>
</head>
<body>
	<h3>Manage Customer Representative Accounts</h3>
	<form action="custAcctHandler.jsp">
      <input type="text" name="search" placeholder="Username">
      <button type="submit">Search</button>
    </form>
    <table>
    	<tr>
    		<th>Username</th>
    		<th>Full Name</th>
    		<th>Email</th>
    	</tr>
<% 	
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from Rep");
    while(rs.next()) {
%>
		<tr>
			<td><%=rs.getString("username")%></td>
			<td><%=rs.getString("full_name")%></td>
			<td><%=rs.getString("email")%></td>
			<td><button id=<%=rs.getString("username")%> onClick=<%st.executeQuery("delete from Rep where username ='"+rs.getString("username")+"'");%>>Delete</button></td>
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