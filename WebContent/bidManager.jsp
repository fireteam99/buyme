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

<table>
	<tr><th>Bid ID</th><th>Bidder ID</th><th>Price</th><th>Bid Time</th></tr>
<% 
	Bid b=new Bid();
	ResultSet rs=b.show(Integer.parseInt(request.getParameter("aid")));
	while(rs.next()){
%>
	<tr>
	<td><%=rs.getInt("bid_id")%></td>	
	<td><%=rs.getDouble("user_id")%></td>		
	<td><%=rs.getInt("price")%></td>		
	<td><%=rs.getTimestamp("time_create")%></td>
	<td><form action='editBid.jsp' method='POST'>
	<input type='submit' value='Edit'>
	<input type='hidden' name='aid' value=<%=rs.getInt("aid")%>>
	<input type='hidden' name='bid' value=<%=rs.getInt("bid_id")%>>
	</form></td>
	<td><form action='deleteBid.jsp' method='POST'>
	<input type='submit' value='Delete'>"
	<input type='hidden' name='bid' value=<%=rs.getInt("bid_id")%>></form></td>
	</tr>
<% 
	}
%>
</table>

</body>
</html>