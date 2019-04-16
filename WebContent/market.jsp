<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Marketplace</title>
<link rel="stylesheet" href="css/common.css" type="text/css">
<link rel="stylesheet" href="css/market.css" type="text/css">
<link rel="stylesheet" href="css/navbar.css" type="text/css">
<link rel="stylesheet" href="css/footer.css" type="text/css">
</head>
<body>
	<%@ include file="./partials/navbar.jsp"%>
	<div class="content">
		<section>
			<div class="top-bar">
				<p class="hdr-med">Categories</p>
				<form name="search" action="/search.jsp">
					<input type="text" placeholder="Search for anything..."> <select
						name="category-list" form="search">
						<option value="vehicles">Vehicles</option>
						<option value="electronics">Electronics</option>
					</select>
					<button type="submit">Go</button>
				</form>
			</div>
		</section>
		<section>
			<div class="card featured">
				<p class="category-heading hdr-sml">Hot</p>
				<div class="flex-container">
					<div class="item-card featured-item">
						<div class="item-card-image-container">
							<img class="item-card-image"
								src="https://img.letgo.com/images/a9/c5/6e/fa/a9c56efa672d4ccd4ac5c1e4395b544d.jpeg?impolicy=img_600"
								alt="item picture">
						</div>
						<div class="item-card-info">
							<div class="item-card-title-container">
								<p class="item-card-title hdr-sml">Used Iphone 8</p>
							</div>
							<div class="item-card-details-container">
								<p class="item-card-details body-sml">Slightly used. Cable
									not included. No refunds.</p>
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
			
			<div class="card featured">
				<p class="category-heading hdr-sml">New</p>
				<div class="flex-container">
					<div class="item-card featured-item">
						<div class="item-card-image-container">
							<img class="item-card-image"
								src="https://img.letgo.com/images/a9/c5/6e/fa/a9c56efa672d4ccd4ac5c1e4395b544d.jpeg?impolicy=img_600"
								alt="item picture">
						</div>
						<div class="item-card-info">
							<div class="item-card-title-container">
								<p class="item-card-title hdr-sml">Used Iphone 8</p>
							</div>
							<div class="item-card-details-container">
								<p class="item-card-details body-sml">Slightly used. Cable
									not included. No refunds.</p>
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
			
			<div class="card featured">
				<p class="category-heading hdr-sml">Recommended</p>
				<div class="flex-container">
					<div class="item-card featured-item">
						<div class="item-card-image-container">
							<img class="item-card-image"
								src="https://img.letgo.com/images/a9/c5/6e/fa/a9c56efa672d4ccd4ac5c1e4395b544d.jpeg?impolicy=img_600"
								alt="item picture">
						</div>
						<div class="item-card-info">
							<div class="item-card-title-container">
								<p class="item-card-title hdr-sml">Used Iphone 8</p>
							</div>
							<div class="item-card-details-container">
								<p class="item-card-details body-sml">Slightly used. Cable
									not included. No refunds.</p>
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
			
			<div class="card featured">
				<p class="category-heading hdr-sml">Recent</p>
				<div class="flex-container">
					<div class="item-card featured-item">
						<div class="item-card-image-container">
							<img class="item-card-image"
								src="https://img.letgo.com/images/a9/c5/6e/fa/a9c56efa672d4ccd4ac5c1e4395b544d.jpeg?impolicy=img_600"
								alt="item picture">
						</div>
						<div class="item-card-info">
							<div class="item-card-title-container">
								<p class="item-card-title hdr-sml">Used Iphone 8</p>
							</div>
							<div class="item-card-details-container">
								<p class="item-card-details body-sml">Slightly used. Cable
									not included. No refunds.</p>
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
			
		</section>
	</div>
	<%@ include file="./partials/footer.jsp"%>
</body>
</html>