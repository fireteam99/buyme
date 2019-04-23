<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Delete User</title>
</head>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	Statement st = con.createStatement();
	String usn=request.getParameter("usn");
	int res=st.executeUpdate("DELETE FROM User WHERE username='"+usn+"'");
	if(res>0){
		out.println("User deleted.");
	}
	else{
		out.println("Error deleting user.");
		out.println("<a href='custRepDashboard.jsp'>Return to dashboard.</a>");
	}
}
catch (SQLException se){
	out.println("Error.");
	out.println("<a href='custRepDashboard.jsp'>Return to dashboard.</a>");
	se.printStackTrace();
}
catch (Exception e){
	e.printStackTrace();
}
%>
<body>
	<p>User deleted.</p>
	<a href="custRepDashboard.jsp">Homepage</a>
</body>
</html>
