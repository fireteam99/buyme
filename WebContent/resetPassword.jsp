<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%
String usn=request.getParameter("usn");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	Statement st = con.createStatement();
	PreparedStatement update = con.prepareStatement("UPDATE User SET password = 'password' WHERE username = ?");
	update.setString(1,usn);
	int res=update.executeUpdate();
	if(res>=0){
		out.println("Password has been reset.");
	}
}
catch(SQLException se){
	se.printStackTrace();
}
catch(Exception e){
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Reset Password</title>
</head>
<body>
	<p></p>
</body>
</html>