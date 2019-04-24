<!DOCTYPE html>
<html>
   <head>
      <title>Questions Forum: </title>
   </head>
   <body>
     
	<h1>Create a post!</h1>
	<% 
	String threadid = request.getParameter("threadid");
	String user = (String)session.getAttribute("user");//actually don't even need to pass this, cause they're logged in
	String action = "createPostDetails.jsp?threadid=" + threadid + "&user=" + user;	
	%>
	
	<form method="post" action="<%=action%>">
	
		<label>Body</label>
		<textarea name="body" placeholder="What do you want to say"  required></textarea>
		<input type="submit" name="po_submit" value="Submit"></input>

		</form>
     
   </body>
</html>