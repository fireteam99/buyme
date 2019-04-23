<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "buyme.Bid" %>
<!DOCTYPE html>
<html>
<head>
<title>Manage Bids</title>
</head>
<body>
<h2>All Bids</h2>
<% 
	Bid b=new Bid();
	out.println(b.show(Integer.parseInt(request.getParameter("aid"))));
%>
</body>
</html>