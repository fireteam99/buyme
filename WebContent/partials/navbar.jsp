<nav class="navbar">
	<a class="nav-btn" href="index.jsp">Buy Me</a>
	<a class="nav-btn" href="market.jsp">Shop</a>
	<a class="nav-btn" href="questions.jsp">Forums</a>
 	<% if(session.getAttribute("user")!=null) { 
		String username = (String)session.getAttribute("user"); %>
		
		<a class="nav-btn" href="logout.jsp">Logout</a>
		<a class="nav-btn" href="userPage.jsp">Profile</a>
		<a class="nav-btn" href="createAuctionPage.jsp">Create Auction</a>		
	<% } else { %>
		<a class="nav-btn" href="login.jsp">Login</a>
		<a class="nav-btn" href="register.jsp">Register</a>
	<% } %>
</nav>