<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="buyme.Auction" %>
<%@ page import="buyme.User" %>



<%

	String item_name = request.getParameter("item_name");
	String pic_link = request.getParameter("pic_link").length()!=0 ? request.getParameter("pic_link") : "https://www.dentsinc.co.uk/wp-content/uploads/2015/11/photo-placeholder-square.png";
	double initial_price = Double.parseDouble(request.getParameter("initial_price"));
	double increment = Double.parseDouble(request.getParameter("increment"));
	double min_sell_price = Double.parseDouble(request.getParameter("min_sell_price"));
	String item_description = request.getParameter("item_description");
	String category_name = request.getParameter("category_name");
	String subcategory_name = request.getParameter("subcategory_name");
	String end_date = request.getParameter("end_date")+" 23:59:59";
	int seller_id = User.getUserIDfromUsername((String)session.getAttribute("user"));
	
	try { 
		
		int auction_id = Auction.createAuction(item_name, pic_link, initial_price, increment,
			item_description,
			category_name,
			subcategory_name,
			end_date, seller_id, min_sell_price);
	
		response.sendRedirect(request.getContextPath() + "/item.jsp?auctionID=" + Integer.toString(auction_id));
		
	} catch(Exception e){
		out.println("There was an error");
		e.printStackTrace();
	}
	
			
	
%>
	