<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Update User</title>
</head>
<body>
<%

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
	Statement st = con.createStatement();
	Statement st2 = con.createStatement();
	ResultSet rs1,rs2;
	String currName=request.getParameter("name");
	String currUser=request.getParameter("username");
	String currEmail=request.getParameter("email");
	String name=request.getParameter("oldName");
	String usn=request.getParameter("oldUser");
	String email=request.getParameter("oldEmail");
	PreparedStatement update = con.prepareStatement("UPDATE User SET full_name = ?, email= ? WHERE username = '"+usn+"'");
	if(!currName.equals(name)||!currEmail.equals(email)){
		update.setString(1,currName);
		update.setString(2,currEmail);
		int res=update.executeUpdate();
		if(res>=0){
			out.println("Changes have been saved.");
		}
	}
}
catch(SQLException se){
	out.println("Error: Cannot Update <br>");
	out.println("<a href='userManager.jsp'>Return to list of users</a>");
	se.printStackTrace();
}
catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>
