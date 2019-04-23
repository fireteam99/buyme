<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<%@ include file="./partials/commonCss.jsp" %>
<link rel="stylesheet" href="css/login.css" type="text/css">

</head>
   <body>
   	<div class="content">
	   	<header>
	        <%@ include file="./partials/navbar.jsp" %>
	    </header>
	    <div class="login-card-container">
		    <div class="login-card card">
				<p class="login-title hdr-med">Login</p>	
				<form action="checkLoginDetails.jsp" method="POST">
					<div class="input-container">
						<input class="input-form" id="login" type="text" name="username" required/> <br/>
						<label class="input-label" for="login">Username/Email</label>
					</div>
					<div class="input-container">
						<input class="input-form" id="password" type="password" name="password" required/> <br/>
						<label class="input-label" for="password">Password</label>
					</div>
					<div class="login-button-container">
						<button class="btn-secondary" type="submit">Lets Go</button>
					</div>
				 </form>
				 <a class="link" href="register.jsp">Don't have an account?</a>
		    </div>
	    </div>    
   	</div>
 	<%@ include file="./partials/footer.jsp" %>
   </body>
</html>
