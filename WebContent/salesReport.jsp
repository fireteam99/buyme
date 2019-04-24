<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "buyme.SalesReport"%>
<!DOCTYPE html>
<html>
<head>
<title>Sales Report</title>
</head>
<body>
  <a href="adminDashboard.jsp">Return to dashboard</a>
<h2>Sales Report</h2>
<% 
SalesReport s=new SalesReport();	
out.println(s.generate(request.getParameter("select"))); 
%>
</body>
</html>
