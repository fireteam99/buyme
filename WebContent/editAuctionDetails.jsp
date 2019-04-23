<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="buyme.Auction" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE htm>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<% 
Auction a=new Auction();
a.edit(Integer.parseInt(request.getParameter("auction_id")), request.getParameter("item_name"), 
		Double.parseDouble(request.getParameter("buy_at_price")), Double.parseDouble(request.getParameter("increment")), 
		request.getParameter("item_description"), request.getParameter("category_name"), 
		request.getParameter("subcategory_name"), 
		java.sql.Timestamp.valueOf(request.getParameter("endDate")));
out.println("Changes saved.");
%>


</body>
</html>