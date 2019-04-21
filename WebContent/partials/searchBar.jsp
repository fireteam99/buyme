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
		<div class="card category-card">
			<a href="#" class="hdr-sml category-hdr">Category 1</a>
		</div>
		<div class="card category-card">
			<a href="#" class="hdr-sml category-hdr">Category 2</a>
		</div>
		<div class="card category-card">
			<a href="#" class="hdr-sml category-hdr">Category 3</a>
		</div>
		<div class="card category-card">
			<a href="#" class="hdr-sml category-hdr">Category 4</a>
		</div>
	</div>
	<a class="link" href="#" rel="modal:close">Close</a>
</div>
