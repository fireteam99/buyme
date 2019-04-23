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
	ResultSet rs=a.showEdit(Integer.parseInt(request.getParameter("aid")));
	if(rs.next()){
%>	
<form action='editAuctionDetails.jsp' method='POST'>
	Item Name <input type='text' name='itemName' value=<%=rs.getString("item_Name")%>><br>
	Buy At Price <input type='number' name='buyAtPrice' value=<%=rs.getDouble("buy_at_price")%>><br>
	Increment <input type='number' name='increment' value=<%=rs.getDouble("increment") %>><br>
	Item Description <textarea name='itemDescription'><%=rs.getString("item_description")%></textarea><br>
	Category Name <input type='text' name='categoryName' value=<%=rs.getString("category_name")%>><br>
	Subcategory Name <input type='text' name='subcategoryName' value=<%=rs.getString("subcategory_name")%>><br>
	End Date <input type='datetime' name='endDate' value=<%=rs.getTimestamp("end_date")%>><br>
	<input type='hidden' value="+aid+"name='aid'>
	<input type='submit' value='Save Changes'>
</form>
<%
	}
%>
<br>
<form action="bidManager.jsp" method="POST">
	<input type="submit" value="Edit Bids">
	<input type="hidden" name="aid" value=<%=request.getParameter("aid")%>>
</form>

</body>
</html>