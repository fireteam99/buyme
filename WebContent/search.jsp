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
<%@page import="java.time.*"%>

<%
	String baseURL = request.getContextPath() + "/search.jsp?search-query=" + request.getParameter("search-query") + "&subcategory=" + request.getParameter("subcategory");
	String sortNameAURL = baseURL + "&sno=1";
	String sortNameDURL = baseURL + "&sno=-1";
	String sortPriceAURL = baseURL + "&spo=1";
	String sortPriceDURL = baseURL + "&spo=-1";
	String sortDateAURL = baseURL + "&sdo=1";
	String sortDateDURL = baseURL + "&sdo=-1";
%>

</head>
<body>
	<div class="content">
		<%@ include file="./partials/navbar.jsp"%>
		<%@ include file="./partials/searchBar.jsp"%>

		<section>
			<div class="featured-search-container">
				<p class="featured-heading hdr-med featured-search">Searching
					For: "<%= request.getParameter("search-query") %>"
				</p>
			</div>
			
			<div class="card sort-filter">
				<p class="category-heading hdr-sml">Sort</p>
				<div class="sort-filter-container">
					<div class="card sort-filter-card">
							<a href="<%= sortNameAURL %>" class="btn-secondary btn-sort"><i class="fas fa-sort-up"></i></a>
							<p class="hdr-sml sort-filter-card-header">Name</p>
							<a href="<%= sortNameDURL %>" class="btn-secondary btn-sort"><i class="fas fa-sort-down"></i></a>
					</div>
					<div class="card sort-filter-card">
							<a href="<%= sortPriceAURL %>" class="btn-secondary btn-sort"><i class="fas fa-sort-up"></i></a>
							<p class="hdr-sml sort-filter-card-header">Price</p>
							<a href="<%= sortPriceDURL %>" class="btn-secondary btn-sort"><i class="fas fa-sort-down"></i></a>
					</div>
					<div class="card sort-filter-card">
							<a href="<%= sortDateAURL %>" class="btn-secondary btn-sort"><i class="fas fa-sort-up"></i></a>
							<p class="hdr-sml sort-filter-card-header">Date</p>
							<a href="<%= sortDateDURL %>" class="btn-secondary btn-sort"><i class="fas fa-sort-down"></i></a>
					</div>
					<div class="card sort-filter-card">
						<a href="<%= baseURL %>"class="btn-secondary">Clear</a>
					</div>
				</div>
			</div>
			
			<div class="card sort-filter">
				<p class="category-heading hdr-sml">Filter</p>
					<div class="card sort-filter-card">
					<%
						boolean showExpired = false;
						if (request.getParameter("show-expired") != null) {
							showExpired = Boolean.parseBoolean(request.getParameter("show-expired"));
						}
						String currentURL = request.getRequestURL().toString().toString() + "?" + request.getQueryString().toString();
						if (showExpired) {
							// show button to hide expired
							%>
							<a href="<%= currentURL.replace("&show-expired=true","") %>"class="btn-secondary btn-expir">Hide Expired</a>
							<%
						} else {
							// show button to show expired
							%>
							<a href="<%= currentURL + "&show-expired=true" %>"class="btn-secondary btn-expir">Show Expired</a>
							<%
						}
					%>
						
					</div>
			</div>
			
			<div class="card item-container">
				<p class="category-heading hdr-sml">Results</p>
				<div class="flex-container">
					<% 
						// get list of auctions/items

					
						String sq = "";
						if (request.getParameter("search-query") != null) {
							sq = request.getParameter("search-query");
						}
						// System.out.println("Search-Query1: " + sq);
						
						// we dont care about category b/c currently not sorting by it
						String cat = "";
						
						String subcat = "";
						if (request.getParameter("subcategory") != null) {
							subcat = request.getParameter("subcategory");
						}
						
						int sno = 0;
						if (request.getParameter("sno") != null) {
							sno = Integer.parseInt(request.getParameter("sno"));
						}
						
						int spo = 0;
						if (request.getParameter("spo") != null) {
							spo = Integer.parseInt(request.getParameter("spo"));
						}
						
						int sdo = 0;
						if (request.getParameter("sdo") != null) {
							sdo = Integer.parseInt(request.getParameter("sdo"));
						}
						
						try {
							// System.out.println("Search-Query2: " + sq);
							ResultSet rsItems = Item.search(sq, cat, subcat, sno, spo, sdo, showExpired);
							// print out the items
							if (!rsItems.isBeforeFirst()) { // check to see if search is empty
					%>
							<p class="body-lrg">No items to show...</p>
					<%
								
							} else {
								while(rsItems.next()) {
									// list out the results
									
									// grays out card if expired
									Instant currentTime = Instant.now();
									Instant endTime = rsItems.getTimestamp("end_date").toInstant();
									
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
												src="<%= rsItems.getString("image") %>"
												alt="item picture">
										</div>
										<div class="item-card-info">
											<div class="item-card-title-container">
												<p class="item-card-title hdr-sml"><%= rsItems.getString("item_name") %></p>
											</div>
											<div class="item-card-details-container">
												<p class="item-card-details body-sml">
												<%= rsItems.getString("item_description") %>
												</p>
											</div>
											<div class="item-card-price-container">
												<p class="hdr-med item-card-price">$<%= rsItems.getString("initial_price") %></p>
											</div>
											<div class="item-card-btn-container">
												<a class="btn-details btn-secondary" href="<%= request.getContextPath() + "/item.jsp?auctionID=" + rsItems.getString("auction_id") %>">More Details</a>
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
		</section>
	</div>
	<%@ include file="./partials/footer.jsp"%>
	<%@ include file="./partials/commonScripts.jsp"%>
</body>
</html>