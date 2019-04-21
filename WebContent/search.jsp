<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<%@ include file="./partials/commonCss.jsp"%>
<link rel="stylesheet" href="css/search.css" type="text/css">

<%@page import="buyme.Item"%>
<%@page import="java.sql.*"%>

</head>
<body>
	<div class="content">
		<%@ include file="./partials/navbar.jsp"%>
		<%@ include file="./partials/searchBar.jsp"%>

		<section>
			<div class="featured-search-container">
				<p class="featured-heading hdr-med featured-search">Searching
					For: ${param.search-query}
				</p>
			</div>
			<div class="card sort-filter">
				<p class="category-heading hdr-sml">Sort</p>
				<div class="sort-filter-container">
					<div class="card sort-filter-card">
						<p class="hdr-sml sort-filter-card-header">Name</p>
						<div class="sort-buttons-container">
							<a class="btn-secondary btn-sort"><i class="fas fa-sort-up"></i></a>
							<a class="btn-secondary btn-sort"><i class="fas fa-sort-down"></i></a>
						</div>
					</div>
					<div class="card sort-filter-card">
						<p class="hdr-sml sort-filter-card-header">Price</p>
						<div class="sort-buttons-container">
							<a class="btn-secondary btn-sort"><i class="fas fa-sort-up"></i></a>
							<a class="btn-secondary btn-sort"><i class="fas fa-sort-down"></i></a>
						</div>
					</div>
					<div class="card sort-filter-card">
						<p class="hdr-sml sort-filter-card-header">Date</p>
						<div class="sort-buttons-container">
							<a class="btn-secondary btn-sort"><i class="fas fa-sort-up"></i></a>
							<a class="btn-secondary btn-sort"><i class="fas fa-sort-down"></i></a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="card item-container">
				<p class="category-heading hdr-sml">Results</p>
				<div class="flex-container">
					<% 
						// get list of auctions/items
						Item item = new Item();
							String sq = request.getParameter("search-query");
							String cat = request.getParameter("category");
							String subcat = request.getParameter("subcategory");
							int sno = Integer.parseInt(request.getParameter("sno"));
							int spo = Integer.parseInt(request.getParameter("spo"));
							int sdo = Integer.parseInt(request.getParameter("sdo"));
						try {
							ResultSet rs = item.search(sq, cat, subcat, sno, spo, sdo);
							
							// print out the items
							if (!rs.isBeforeFirst()) { // check to see if search is empty
					%>
								<p class="body-lrg">No items to show...</p>
					<%
								
							} else {
								while(rs.next()) {
									// list out the results
					%>
									<div class="item-card featured-item">
										<div class="item-card-image-container">
											<img class="item-card-image"
												src="<%= rs.getString("image") %>"
												alt="item picture">
										</div>
										<div class="item-card-info">
											<div class="item-card-title-container">
												<p class="item-card-title hdr-sml"><%= rs.getString("item_name") %></p>
											</div>
											<div class="item-card-details-container">
												<p class="item-card-details body-sml">
												<%= rs.getString("item_description") %>
												</p>
											</div>
											<div class="item-card-price-container">
												<p class="hdr-med item-card-price"><%= rs.getString("buy_at_price") %></p>
											</div>
											<div class="item-card-btn-container">
												<a class="btn-details btn-secondary" href="<%= "/item.jsp?auctionID=" + rs.getString("auction_id") %>">More Details</a>
											</div>
										</div>
									</div>
					<%
								}
							}
							
						} catch (SQLException se) {
							response.sendRedirect("../500.jsp");
						} catch (Exception e) {
							response.sendRedirect("../500.jsp");
						}
					%>
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
	<%@ include file="./partials/commonScripts.jsp"%>
</body>
</html>