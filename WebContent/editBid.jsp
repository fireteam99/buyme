<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="buyme.Bid" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Bid</title>
</head>
<body>
<%
Bid b=new Bid();
ResultSet rs=b.showEdit(Integer.parseInt(request.getParameter("bid")), Integer.parseInt(request.getParameter("aid")));
if(rs.next()){
%>
<form action='editBidDetails.jsp' method='POST'>
	Auction ID <input type='number' name='aid' value=<%=rs.getInt("auction_id")%>><br>
	Bid ID <input type='number' name='bid' value=<%=rs.getInt("bid_id")%>><br>
	User ID <input type='number' name='uid' value=<%=rs.getInt("user_id")%>><br>
	Price <input type='number' name='price' value=<%=rs.getDouble("price")%>><br>
<input type='submit' value='Save Changes'>
</form>
<%
}
%>
</body>
</html>