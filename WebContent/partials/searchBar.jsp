<%@page import="buyme.Category"%>
<%@page import="buyme.Subcategory"%>
<%@page import="java.sql.*"%>
<section>
	<div class="top-bar">
		<a class="btn-primary" href="#categories" rel="modal:open"> View Categories</a>
		<form name="search" action=<%= request.getContextPath() +  "/partials/handleSearchBar.jsp" %> method="POST">
			<span class="search-bar">
				<input name="search-query" class="search-form search-bar-form" type="text" placeholder="Search for anything...">
				<button type="submit" class="search-btn"><i class="fas fa-search"></i></button>
			</span>
			<select name=subcategory class="btn-primary" name="category-list">
				<option value="all" selected="selected">All</option>
				<%
					Category searchBarCategory = new Category();
					Subcategory searchBarSubcategory = new Subcategory();
					ResultSet allCategories = searchBarCategory.getAll();
					while(allCategories.next()) {
						String currentCategory = allCategories.getString("category_name");
						%>
						<optgroup label="<%= currentCategory %>">
						<%
						ResultSet allSubcatsFromCat = searchBarSubcategory.getByCategory(currentCategory);
						while(allSubcatsFromCat.next()) {
							String currentSubcategory = allSubcatsFromCat.getString("subcategory_name");
							%>
							<option value=<%= currentSubcategory %>><%= currentSubcategory %></option>
							<%
						}
						%>
						</optgroup>
						<%
					}
				%>
			</select>
		</form>
	</div>
</section>
<!-- Modal for list of categories -->
<div id="categories" class="modal categories-modal">
	<div class="categories-wrapper">
		<% 
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
