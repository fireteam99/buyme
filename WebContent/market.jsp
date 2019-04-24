<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Marketplace</title>
<%@ include file="./partials/commonCss.jsp" %>
<link rel="stylesheet" href="css/market.css" type="text/css">
<%@page import="buyme.Item"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.*"%>
</head>
<body>
	<div class="content">
		<%@ include file="./partials/navbar.jsp"%>
		<%@ include file="./partials/searchBar.jsp"%>
		<div class="section-header">
			<p class="hdr-lrg">Marketplace</p>
		</div>
		<section>
		
			<%-- <%
				// display personalized section only if user is logged in
				if (session.getAttribute("user") != null) {
					%>
					<div class="featured-search-container">
						<p class="featured-heading hdr-med featured-search">Personalized For You <i class="fas fa-hand-holding-heart"></i></p>
					</div>
					<div class="card item-container">
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
					
					<div class="card item-container">
						<p class="category-heading hdr-sml">Saved</p>
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
					<%
				}
			%> --%>
			
			<div class="featured-search-container">
				<p class="featured-heading hdr-med featured-search">Curated <i class="fab fa-get-pocket"></i></p>
			</div>
			<div class="card item-container">
				<p class="category-heading hdr-sml">Hot <i class="fas fa-fire"></i></p>
				<div class="flex-container">
				
					<% 
						// get list of auctions/items sorted by number of bids
						try {
							// System.out.println("Search-Query2: " + sq);
							ResultSet rsHotItems = Item.getHotItems();
							// print out the items
							if (!rsHotItems.isBeforeFirst()) { // check to see if search is empty
					%>
							<p class="body-lrg">No items to show...</p>
					<%
								
							} else {
								while(rsHotItems.next()) {
									// list out the results
									
									// grays out card if expired
									Instant currentTime = Instant.now();
									Instant endTime = rsHotItems.getTimestamp("end_date").toInstant();
									
									if (currentTime.compareTo(endTime) > 1) { // expired
										%>
									<div class="item-card featured-item expired-item">
										<%
									} else {
										%>
									<div class="item-card featured-item">
										<%
									}
					%>
										<div class="item-card-image-container">
											<img class="item-card-image"
												src="<%= rsHotItems.getString("image") %>"
												alt="item picture">
										</div>
										<div class="item-card-info">
											<div class="item-card-title-container">
												<p class="item-card-title hdr-sml"><%= rsHotItems.getString("item_name") %></p>
											</div>
											<div class="item-card-details-container">
												<p class="item-card-details body-sml">
												<%= rsHotItems.getString("item_description") %>
												</p>
											</div>
											<div class="item-card-price-container">
												<p class="hdr-med item-card-price">$<%= rsHotItems.getString("current_bid") %></p>
											</div>
											<div class="item-card-btn-container">
												<a class="btn-details btn-secondary" href="<%= request.getContextPath() + "/item.jsp?auctionID=" + rsHotItems.getString("auction_id") %>">More Details</a>
											</div>
										</div>
									</div>
						<%
								}
							}
							
						} catch (SQLException se) {
							se.printStackTrace();
							//response.sendRedirect("../500.jsp");
						} catch (Exception e) {
							e.printStackTrace();
							//response.sendRedirect("../500.jsp");
						}
					%>
					
					</div>
				</div>
			</div>
			
			<div class="card item-container">
				<p class="category-heading hdr-sml">New <i class="fas fa-haykal"></i></p>
				<div class="flex-container">
					
					<% 
						try {
							// System.out.println("Search-Query2: " + sq);
							ResultSet rsNewItems = Item.search("", "", "", 0, 0, 1, false);
							// print out the items
							if (!rsNewItems.isBeforeFirst()) { // check to see if search is empty
					%>
							<p class="body-lrg">No items to show...</p>
					<%
								
							} else {
								while(rsNewItems.next()) {
									// list out the results
									
									// grays out card if expired
									Instant currentTime = Instant.now();
									Instant endTime = rsNewItems.getTimestamp("end_date").toInstant();
									
									if (currentTime.compareTo(endTime) > 1) { // expired
										%>
									<div class="item-card featured-item expired-item">
										<%
									} else {
										%>
									<div class="item-card featured-item">
										<%
									}
					%>
										<div class="item-card-image-container">
											<img class="item-card-image"
												src="<%= rsNewItems.getString("image") %>"
												alt="item picture">
										</div>
										<div class="item-card-info">
											<div class="item-card-title-container">
												<p class="item-card-title hdr-sml"><%= rsNewItems.getString("item_name") %></p>
											</div>
											<div class="item-card-details-container">
												<p class="item-card-details body-sml">
												<%= rsNewItems.getString("item_description") %>
												</p>
											</div>
											<div class="item-card-price-container">
												<p class="hdr-med item-card-price">$<%= rsNewItems.getString("current_bid") %></p>
											</div>
											<div class="item-card-btn-container">
												<a class="btn-details btn-secondary" href="<%= request.getContextPath() + "/item.jsp?auctionID=" + rsNewItems.getString("auction_id") %>">More Details</a>
											</div>
										</div>
									</div>
						<%
								}
							}
							
						} catch (SQLException se) {
							se.printStackTrace();
							//response.sendRedirect("../500.jsp");
						} catch (Exception e) {
							e.printStackTrace();
							//response.sendRedirect("../500.jsp");
						}
					%>
					
					</div>
				</div>
			</div>
			
			<div class="card item-container">
				<p class="category-heading hdr-sml">Last Chance <i class="far fa-clock"></i></p>
				<div class="flex-container">
					
					<% 
						try {
							// System.out.println("Search-Query2: " + sq);
							ResultSet rsExpiringItems = Item.search("", "", "", 0, 0, -1, false);
							// print out the items
							if (!rsExpiringItems.isBeforeFirst()) { // check to see if search is empty
					%>
							<p class="body-lrg">No items to show...</p>
					<%
								
							} else {
								while(rsExpiringItems.next()) {
									// list out the results
									
									// grays out card if expired
									Instant currentTime = Instant.now();
									Instant endTime = rsExpiringItems.getTimestamp("end_date").toInstant();
									
									if (currentTime.compareTo(endTime) > 1) { // expired
										%>
									<div class="item-card featured-item expired-item">
										<%
									} else {
										%>
									<div class="item-card featured-item">
										<%
									}
					%>
										<div class="item-card-image-container">
											<img class="item-card-image"
												src="<%= rsExpiringItems.getString("image") %>"
												alt="item picture">
										</div>
										<div class="item-card-info">
											<div class="item-card-title-container">
												<p class="item-card-title hdr-sml"><%= rsExpiringItems.getString("item_name") %></p>
											</div>
											<div class="item-card-details-container">
												<p class="item-card-details body-sml">
												<%= rsExpiringItems.getString("item_description") %>
												</p>
											</div>
											<div class="item-card-price-container">
												<p class="hdr-med item-card-price">$<%= rsExpiringItems.getString("current_bid") %></p>
											</div>
											<div class="item-card-btn-container">
												<a class="btn-details btn-secondary" href="<%= request.getContextPath() + "/item.jsp?auctionID=" + rsExpiringItems.getString("auction_id") %>">More Details</a>
											</div>
										</div>
									</div>
						<%
								}
							}
							
						} catch (SQLException se) {
							se.printStackTrace();
							//response.sendRedirect("../500.jsp");
						} catch (Exception e) {
							e.printStackTrace();
							//response.sendRedirect("../500.jsp");
						}
					%>
					</div>
				</div>
			</div>
			
		</section>
	</div>
	<%@ include file="./partials/footer.jsp"%>
	<%@ include file="./partials/commonScripts.jsp" %>
</body>
</html>