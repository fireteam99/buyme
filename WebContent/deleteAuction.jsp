<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "buyme.Item"%>
<!DOCTYPE html>
<html>
<head>
<title>Delete Auction</title>
</head>
<body>
<%
	Item i=new Item();
	i.deleteByID(Integer.parseInt(request.getParameter("aid")));
	out.println("Auction deleted.");	
%>

</body>
</html>