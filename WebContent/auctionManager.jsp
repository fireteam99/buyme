<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "buyme.Auction" %>
<!DOCTYPE html>
<html>
<head>
<title>Manage Auctions</title>
</head>
<body>
<h2>Active Auctions</h2>
<% 
	Auction a=new Auction();
	out.println(a.show());
%>
</body>
</html>