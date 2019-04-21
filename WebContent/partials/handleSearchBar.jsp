<%
	String searchQuery = request.getParameter("search-query");
	// dont filter by category
	String category = "";
	// if subcategory is set to all, use empty string to choose from all in db
	String subcategory = null;
	if (request.getParameter("subcategory") == null) {
		System.out.println("uh oh null");
	} else {
		System.out.println(request.getParameter("subcategory"));
	}
	if (request.getParameter("subcategory") == null || request.getParameter("subcategory").equals("all")) {
		subcategory = "";
	} else {
		subcategory = request.getParameter("subcategory");
	}
	// String subcategory = (request.getParameter("subcategory")).equals("all")) ? "" : request.getParameter("subcategory");
	String sno = "0";
	String spo = "0";
	String sdo = "0";
	response.sendRedirect(request.getContextPath() + "/search.jsp?search-query=" + searchQuery + "&category=" + category +
			"&subcategory=" + subcategory + "&sno=" + sno + "&spo=" + spo + "&sdo=" + sdo);
%>