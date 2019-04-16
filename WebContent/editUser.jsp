<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Edit User</title>
</head>
<body>
	<h2>Edit User Details</h2>
<%
	String usn=request.getParameter("usn");
	String email=request.getParameter("email");
	String name=request.getParameter("name");
%>
	<form method="POST" action="userUpdate.jsp">
      Full Name: <input type="text" name="name" value=<%=name%>> <br/>
      Username: <input type="text" name="username" value=<%=usn%>> <br/>
      Email: <input type="text" name="email" value=<%=email%>> <br/>
      <input type="hidden" name="oldName" value=<%=name%>>
      <input type="hidden" name="oldUser" value=<%=usn%>>
      <input type="hidden" name="oldEmail" value=<%=email%>>
      <input type="submit" value="Save Changes">
	</form>
	

</body>
</html>