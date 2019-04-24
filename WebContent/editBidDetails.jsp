<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="buyme.Bid" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<% 
Bid b=new Bid();
b.edit(Integer.parseInt(request.getParameter("aid")), Integer.parseInt(request.getParameter("uid")), 
		Integer.parseInt(request.getParameter("bid")), Double.parseDouble(request.getParameter("price")));
out.println("Changes saved.");
out.println("<a href='custRepDashboard.jsp'>Return to dashboard.</a>");
%>

</body>
</html>
