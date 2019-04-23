<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item</title>
<%@ include file="./partials/commonCss.jsp" %>
<link rel="stylesheet" href="css/item.css" type="text/css">
</head>
<body>
	<%@ include file="./partials/navbar.jsp" %>
	<div class="content">
		<%@ include file="./partials/searchBar.jsp"%>
		<section>
			<div class="item-info-container">
				<div class="item-image-container">
					<img class="item-image" src="https://www.bhphotovideo.com/images/images1500x1500/nikon_d5600_dslr_camera_with_1308820.jpg" alt="item image"/>
				</div>
				<div class="item-details-container">
					<div class="item-header-container">
						<p class="hdr-lrg">Item Name</p>
						<div class="item-sub-header">
							<p class="hdr-med">User123</p>
						</div>
						
					</div>
					<div class="item-status-container">
						<p class="body-lrg">Status: Open - 6 Days Left</p>
						<p class="body-sml">Started: 1/3/19</p>
						<p class="body-sml">Ends: 1/5/19</p>
					</div>
					<div class="item-description-container">
						<p class="hdr-sml">Item Description:</p>
						<p class="body-sml"> blah blah blah blah blah.</p>
					</div>
					<div class="item-price-container">
						<p class="hdr-med">Highest Bid: $675</p>
						<p class="hdr-sml">Minimum Price: $500</p>
						<p class="body-sml">Auto Bid Increment: $5</p>
					</div>
				</div>
			</div>
		</section>
		<section>
			<div class="bidding-container">
				<div class="card make-bid-container">
					<p class="hdr-med"">Make a Bid</p>
					<p id="auto-bid-incr" class="auto-bid-incr body-lrg disabled">Auto Bid Increment: $5</p>
					<form class="make-bid-form">
						<div class="flex-container">
							<div>
								<input name="bid-amount" class="input-form" type="number" step="0.01" min="0" oninput="validity.valid||(value='');" required/>
								<label class="input-label bid-label" for="bid-amount">Initial Bid</label>
							</div>
							<div>
								<input name="auto-bid-limit" id="auto-bid-limit" class="input-form disabled" type="number" step="0.01" min="0" oninput="validity.valid||(value='');"  disabled required/>
								<label class="input-label bid-label disabled" id="auto-bid-limit-label" for="auto-bid-limit">Auto Bid Limit</label>
							</div>
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
				<div class="card past-bid">
					<div>
						<p class="body-sml">Big Boi</p>
					</div>
					<div>
						<p class="body-sml">$46</p>
					</div>
					<div>
						<p class="body-sml">3 Days Ago</p>
					</div>
				</div>
				<div class="card past-bid">
					<div>
						<p class="body-sml">Big Boi</p>
					</div>
					<div>
						<p class="body-sml">$46</p>
					</div>
					<div>
						<p class="body-sml">3 Days Ago</p>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@ include file="./partials/footer.jsp" %>
	<%@ include file="./partials/commonScripts.jsp" %>
	<script src="js/item.js"></script>
</body>
</html>