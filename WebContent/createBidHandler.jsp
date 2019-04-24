<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="buyme.Auction" %>
<%@ page import="buyme.Bid" %>



<%

	double price = Double.parseDouble(request.getParameter("bid_amount"));
	int auction_id = Integer.parseInt(request.getParameter("auction_id"));
	int user_id = Integer.parseInt(request.getParameter("user_id"));
	
	
	try { 
		
		Bid.createBid(auction_id, user_id, price);
		response.sendRedirect(request.getContextPath() + "/item.jsp?auctionID=" + Integer.toString(auction_id));

		
		
	
		
	} catch(Exception e){
		System.out.println(e);
		out.println(e);
		//out.println("There was an error. Your bid must be at least greater than the previous bid by the increment specified. Please go back and try again.");
		
	}
	
			
	
%>