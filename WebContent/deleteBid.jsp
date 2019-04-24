<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "buyme.Bid"%>

<!DOCTYPE html>
<html>
<head>
<title>Delete Bid</title>
</head>
<body>
<%
	Bid b=new Bid();
	b.remove(Integer.parseInt(request.getParameter("bid")));
	out.println("Bid removed.");
	out.println("<a href='custRepDashboard.jsp'>Return to dashboard.</a>");
%>
</body>
</html>
