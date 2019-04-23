<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy Me</title>
<%@ include file="./partials/commonCss.jsp" %>

<%@page import="buyme.User"%>
<%@page import="java.sql.*"%>


<link rel="stylesheet" href="css/index.css" type="text/css">

</head>
<body>
	<%@ include file="./partials/navbar.jsp"%>
	
	
<%
    if ((session.getAttribute("user") == null)) {
    	
%>
    You are not logged in<br/>
    <a href="login.jsp">Please Login</a>
<%
    } else {
    	String user = (String)session.getAttribute("user");
    	ResultSet rs = User.getUser(user);
    	rs.next();
		String username = rs.getString("full_name");
		
%>


     Welcome <%=username%>
     
     <a href="userPage.jsp">Go To User Page</a>
   	 <a href='logout.jsp'>Log out</a>
<%
    }
%>



<%@ include file="./partials/footer.jsp"%>
<%@ include file="./partials/commonScripts.jsp"%>
</body>
</html>