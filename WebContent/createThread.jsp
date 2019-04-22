<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
   <head>
      <title>Create Thread Form</title>
   </head>
   <body>
     	<h1>Create a thread</h1>
	<% 
   	 if ((session.getAttribute("user") == null)) {
	%>
    	You are not logged in<br/>
    	<a href="login.jsp">Please Login</a>
    	<%
   	 }else{
		//String action = "createThreadDetails.jsp";	
		//out.println("<form method='post' action='" + action + "'>");
	%>
	<form action="createThreadDetails.jsp" method="POST">
		
		<label>Title</label>
		<input type="text" name="title" required></input>

		<label>Description</label>
		<textarea name="body" placeholder="My question is..."  required></textarea>

		<input type="submit" value="Submit"></input>


	</form>
     
     <%
   	 }
     %>
     
   </body>
</html>
