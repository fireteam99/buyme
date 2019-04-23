<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy Me</title>
<%@ include file="./partials/commonCss.jsp"%>

<%@page import="buyme.User"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>




<link rel="stylesheet" href="css/index.css" type="text/css">

</head>
<body>
	<%@ include file="./partials/navbar.jsp"%>


	<%
		if ((session.getAttribute("user") == null)) {
	%>
	You are not logged in
	<br />
	<a href="login.jsp">Please Login</a>
	<%
		} else {
			String user = (String) session.getAttribute("user");
			ResultSet rs = User.getUser(user);
			rs.next();
			String fullName = rs.getString("full_name");
			String pic_link = rs.getString("pic_link");
			java.sql.Date created_at = rs.getDate("created_at");
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");  
            String strDate = dateFormat.format(created_at);  
	%>
	
	<p><img src=<%="\""+pic_link+"\""%>></p> <!-- IMAGE -->
	<p>Full Name <%=fullName %></p> <!-- FULLNAME -->
	<p>Created at: <%=strDate %></p>
 
 	<!-- I LOVE YOU RAY -->



	<a href="userPage.jsp">Go To User Page</a>
	<a href='logout.jsp'>Log out</a>
	<%
		}
	%>



	<%@ include file="./partials/footer.jsp"%>
	<%@ include file="./partials/commonScripts.jsp"%>
</body>
</html>