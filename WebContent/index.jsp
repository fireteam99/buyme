<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy Me</title>
<%@ include file="./partials/commonCss.jsp" %>
<link rel="stylesheet" href="css/index.css" type="text/css">

</head>
<body>
	<%@ include file="./partials/navbar.jsp" %>
	<div class="content">
		<%@ include file="./partials/searchBar.jsp"%>
		<header>
		<div class ="heading">
				<p class="hdr-lrg title">Welcome To Buy Me</p>
				<p class="hdr-med subtitle">Please buy our shit.</p>
		</div>
		<div class="reg-login">
			<a class="btn-primary" href="login.jsp">Login</a>
			<a class="btn-primary" href="register.jsp">Register</a>
						<a class="btn-primary" href="market.jsp">Let's Shop</a>
		</div>
	</header>
		<section>
			<div class="featured-search-container">
				<p class="featured-heading hdr-med featured-search">Today's Featured Items <i class="fas fa-fire"></i></p>
			</div>
			
			<div class="card item-container">
				<p class="category-heading hdr-sml">Phones</p>
				<div class="flex-container">
					<div class="item-card featured-item">
						<div class="item-card-image-container">
							<img class="item-card-image" src="https://img.letgo.com/images/a9/c5/6e/fa/a9c56efa672d4ccd4ac5c1e4395b544d.jpeg?impolicy=img_600" alt="item picture">
						</div>
						<div class="item-card-info">
							<div class="item-card-title-container">
								<p class="item-card-title hdr-sml">Used Iphone 8</p>
							</div>
							<div class="item-card-details-container">
								<p class="item-card-details body-sml">Slightly used. Cable not included. No refunds.</p>
							</div>
							<div class="item-card-price-container">
								<p class="hdr-med item-card-price">$299</p>
							</div>
							<div class="item-card-btn-container">
								<a class="btn-details btn-secondary" href="#">More Details</a>
							</div>
						</div>
					</div>
					<div class="item-card featured-item">
						<p>Item2</p>
					</div>
					<div class="item-card featured-item">
						<p>Item3</p>
					</div>
					<div class="item-card featured-item">
						<p>Item3</p>
					</div>
					<div class="item-card featured-item">
						<p>Item3</p>
					</div>				
				</div>
			</div>
			
			<div class="card item-container">
				<p class="category-heading hdr-sml">Cars</p>
				<div class="flex-container">
					<div class="item-card featured-item">
						<div class="item-card-image-container">
							<img class="item-card-image" src="https://img.letgo.com/images/a9/c5/6e/fa/a9c56efa672d4ccd4ac5c1e4395b544d.jpeg?impolicy=img_600" alt="item picture">
						</div>
						<div class="item-card-info">
							<div class="item-card-title-container">
								<p class="item-card-title hdr-sml">Used Iphone 8</p>
							</div>
							<div class="item-card-details-container">
								<p class="item-card-details body-sml">Slightly used. Cable not included. No refunds.</p>
							</div>
							<div class="item-card-price-container">
								<p class="hdr-med item-card-price">$299</p>
							</div>
							<div class="item-card-btn-container">
								<a class="btn-details btn-secondary" href="#">More Details</a>
							</div>
						</div>
					</div>
					<div class="item-card featured-item">
						<p>Item2</p>
					</div>
					<div class="item-card featured-item">
						<p>Item3</p>
					</div>				
				</div>
			</div>
			
			<div class="card item-container">
				<p class="category-heading hdr-sml">Computers</p>
				<div class="flex-container">
					<div class="item-card featured-item">
						<div class="item-card-image-container">
							<img class="item-card-image" src="https://img.letgo.com/images/a9/c5/6e/fa/a9c56efa672d4ccd4ac5c1e4395b544d.jpeg?impolicy=img_600" alt="item picture">
						</div>
						<div class="item-card-info">
							<div class="item-card-title-container">
								<p class="item-card-title hdr-sml">Used Iphone 8</p>
							</div>
							<div class="item-card-details-container">
								<p class="item-card-details body-sml">Slightly used. Cable not included. No refunds.</p>
							</div>
							<div class="item-card-price-container">
								<p class="hdr-med item-card-price">$299</p>
							</div>
							<div class="item-card-btn-container">
								<a class="btn-details btn-secondary" href="#">More Details</a>
							</div>
						</div>
					</div>
					<div class="item-card featured-item">
						<p>Item2</p>
					</div>
					<div class="item-card featured-item">
						<p>Item3</p>
					</div>				
				</div>
			</div>
		</section>
	</div>
	<%@ include file="./partials/footer.jsp" %>
	<%@ include file="./partials/commonScripts.jsp" %>
</body>
</html>