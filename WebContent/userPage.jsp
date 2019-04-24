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

<link rel="stylesheet" href="css/userPage.css" type="text/css">

</head>
<body>
	<%@ include file="./partials/navbar.jsp"%>
	<div class="content">
		<div class="user-container">
			<div class="user-info-container">
				<%
					if ((session.getAttribute("user") == null)) {
						response.sendRedirect("login.jsp");
					} else {
						String user = (String) session.getAttribute("user");
						ResultSet rs = User.getUser(user);
						rs.next();
						String fullName = rs.getString("full_name");
						String pic_link = rs.getString("pic_link");
						java.sql.Date created_at = rs.getDate("created_at");
						
						DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");  
			            String strDate = dateFormat.format(created_at);  
				%>
				<div class="pro-pic-container">
						<img class="pro-pic" src=<%="\""+pic_link+"\""%>>
					</div>
				<div class="card">
					<p class="hdr-med"> <%=fullName %></p> <!-- FULLNAME -->
					<p class="body-sml">User since: <%=strDate %></p>
				</div>
			 	<!-- I LOVE YOU RAY -->
				<a class="link" href='logout.jsp'>Logout</a>
				<%
					}
				%>
			</div>
			<div class="notification-container">
				<p class="hdr-med">Notifications</p>
				<div class="card notification">
					<p class="body-sml">1/2/14 5:30pm</p>
					<p class="body-lrg notification-body">You won an auction!</p>
				</div>
				<div class="card notification">
					<p class="body-sml">1/2/14 5:20pm</p>
					<p class="body-lrg notification-body">jon won an auction.</p>
				</div>
				<div class="card notification">
					<p class="body-sml">1/2/14 5:20pm</p>
					<p class="body-lrg notification-body">jon bidded on an auction.</p>
				</div>
			</div>
			
		</div>
		
		
	</div>

	<%@ include file="./partials/footer.jsp"%>
	<%@ include file="./partials/commonScripts.jsp"%>
</body>
</html>