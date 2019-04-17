<section>
	<div class="top-bar">
		<button class="btn-primary"> View Categories</button>
		<form name="search" action="/search.jsp">
			<span class="search-bar">
				<input class="search-form" type="text" placeholder="Search for anything...">
				<button class="search-btn" type="submit">Go</button> 
			</span>
			<select class="btn-primary" name="category-list" form="search">
				<option value="vehicles">Vehicles</option>
				<option value="electronics">Electronics</option>
			</select>
		</form>
	</div>
</section>