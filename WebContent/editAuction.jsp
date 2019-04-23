<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="buyme.Auction" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Edit Auction</title>
</head>
<body>
<%
Auction a=new Auction();
out.println(a.showEdit(Integer.parseInt(request.getParameter("aid"))));
%>
<br>
<form action="bidManager.jsp" method="POST">
	<input type="submit" value="Edit Bids">
	<input type="hidden" name="aid" value=<%=request.getParameter("aid")%>>
</form>

</body>
</html>