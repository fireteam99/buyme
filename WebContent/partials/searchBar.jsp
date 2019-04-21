<%@page import="buyme.Category"%>
<%@page import="java.sql.*"%>
<section>
	<div class="top-bar">
		<a class="btn-primary" href="#categories" rel="modal:open"> View Categories</a>
		<form name="search" action=<%= request.getContextPath() +  "/partials/handleSearchBar.jsp" %> method="POST">
			<span class="search-bar">
				<input name="search-query" class="search-form" type="text" placeholder="Search for anything...">
				<button type="submit" class="search-btn"><i class="fas fa-search"></i></button>
			</span>
			<select name=subcategory class="btn-primary" name="category-list">
				<option value="all" selected="selected">All</option>
				<option value="vehicles">Vehicles</option>
				<option value="electronics">Electronics</option>
			</select>
		</form>
	</div>
</section>
<!-- Modal for list of categories -->
<div id="categories" class="modal categories-modal">
	<div class="categories-wrapper">
		<% 
			Category searchBarCategory = new Category(); 
			try {
				ResultSet rsSearchBarCats = searchBarCategory.getAll();
				
				while(rsSearchBarCats.next()) {
			%>
				<div class="card category-card">
					<a href="#" class="hdr-sml category-hdr"><%= rsSearchBarCats.getString("category_name") %></a>
				</div>
			<%
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
	<a class="link" href="#" rel="modal:close">Close</a>
</div>
