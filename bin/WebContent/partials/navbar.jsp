<nav class="navbar">
	<a class="nav-btn" href="index.jsp">Buy Me</a>
	<a class="nav-btn" href="market.jsp">Shop</a>
	<a class="nav-btn" href="login.jsp">Login</a>
	<a class="nav-btn" href="register.jsp">Register</a>
	<% if(session.getAttribute("user")!=null) { 
		String username = (String)session.getAttribute("user"); %>
		
		<a class="nav-btn" href="userPage.jsp"><%=username %></a>
	
	<% } %>
</nav>