<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item</title>
<%@ include file="./partials/commonCss.jsp" %>
<%@page import="buyme.Auction"%>
<%@page import="buyme.User"%>
<%@page import="buyme.Bid"%>




<link rel="stylesheet" href="css/item.css" type="text/css">
</head>
<body>
	<%@ include file="./partials/navbar.jsp" %>
	<div class="content">
		<%@ include file="./partials/searchBar.jsp"%>
		<% ResultSet rs= Auction.getAuction(Integer.parseInt(request.getParameter("auctionID")));
			rs.next();
		%>
		<section>
			<div class="item-info-container">
				<div class="item-image-container">
					<img class="item-image" src=<%="\"" + rs.getString("image")+"\"" %> alt="item image"/>
				</div>
				<div class="item-details-container">
					<div class="item-header-container">
						<p class="hdr-lrg">Item Name</p>
						<div class="item-sub-header">
							<p class="hdr-med"><%=rs.getString("item_name") %></p>
						</div>
						
					</div>
					<div class="item-status-container">
						<p class="body-lrg">Status: Open - 6 Days Left</p>
						<p class="body-sml">Open Date: <%=rs.getString("start_date") %></p>
						<p class="body-sml">Close Date: <%=rs.getString("end_date") %></p>
					</div>
					<div class="item-description-container">
						<p class="hdr-sml">Item Description:</p>
						<p class="body-sml"> <%=rs.getString("item_description")%></p>
					</div>
					<div class="item-price-container">
						<p class="hdr-med">Highest Bid: $<%=rs.getFloat("current_bid") %></p>
						<p class="body-sml">Minimum Increment: $<%=rs.getFloat("increment") %></p>
					</div>
				</div>
			</div>
		</section>
		<section>
			<div class="bidding-container">
				<div class="card make-bid-container">
					<p class="hdr-med">Make a Bid</p>
					<p id="auto-bid-incr" class="auto-bid-incr body-lrg disabled">Auto Bid Increment: $<%=rs.getFloat("increment") %></p>
					<form class="make-bid-form" action="createBidHandler.jsp" method="POST" >
						<div class="flex-container">
							<div>
								<input name="bid_amount" class="input-form" type="number" step="0.01" min="0" oninput="validity.valid||(value='');" required/>
								<label class="input-label bid-label" for="bid_amount">Bid Amount</label>
							</div>
							<div>
								<input name="auto-bid-limit" id="auto-bid-limit" class="input-form disabled" type="number" step="0.01" min="0" oninput="validity.valid||(value='');"  disabled required/>
								<label class="input-label bid-label disabled" id="auto-bid-limit-label" for="auto-bid-limit">Auto Bid Limit</label>
							</div>
								<input name="auction_id" type="hidden" value=<%="\""+request.getParameter("auctionID")+"\"" %>/>
								<input name="user_id" type="hidden" value=<%="\""+User.getUserIDfromUsername((String)session.getAttribute("user"))+"\"" %>/>
								
							<!-- <div>
								<input name="auto-bid-amount" id="auto-bid-amount" class="input-form disabled" type="number" step="0.01" min="0" oninput="validity.valid||(value='');"  disabled required/>
								<label class="input-label bid-label disabled" id="auto-bid-amount-label" for="auto-bid-amount">Auto Bid Increment</label>
							</div> -->
						</div>
						
						<div class="pretty p-switch p-slim checkbox">
						        <input type="checkbox" name="auto-bid-selector" id="auto-bid-selector"/>
						        <div class="state p-info">
						            <label>Enable Auto Bidding</label>
						        </div>
					    </div>
						<div class="btn-container">
							<button class="btn-secondary-danger" type="reset">Clear</button>
							<button class="btn-secondary" type="submit">Bid</button>
						
						</div>
					</form>
					
				</div>
			</div>
		</section>
		<section>
			<div class="past-bids-container">
				<p class="hdr-med">Bid History</p>
				<div class="past-bid table-title">
					<div>
						<p class="hdr-sml">User</p>
					</div>
					<div>
						<p class="hdr-sml">Bid Amount</p>
					</div>
					<div>
						<p class="hdr-sml">Date</p>
					</div>
				</div>
				<% rs= Bid.showBids(Integer.parseInt(request.getParameter("auctionID")));
					while(rs.next()){
				
				%>
					<div class="card past-bid">
						<div>
							<p class="body-sml"><%=rs.getString("user_id")%></p>
						</div>
						<div>
							<p class="body-sml">$<%=rs.getFloat("price")%></p>
						</div>
						<div>
							<p class="body-sml"><%=rs.getString("time_create")%></p>
						</div>
					</div>
					
				<%
					}
				%>
				
			</div>
		</section>
	</div>
	<%@ include file="./partials/footer.jsp" %>
	<%@ include file="./partials/commonScripts.jsp" %>
	<script src="js/item.js"></script>
</body>
</html>