package buyme;

import java.sql.*;

public class Item {
	// allows you to search items while filtering by category, subcategory and
	// sorting by name, price, and date (TESTED)
	public static ResultSet search(String item_query, String category, String subcategory, int sortNameOption,
			int sortPriceOption, int sortDateOption, boolean showExpired) throws Exception {
		String selectSQL = "SELECT * FROM buyme.Auction WHERE item_name LIKE ? AND category_name LIKE ? AND subcategory_name LIKE ?";
		if (!showExpired) {
			selectSQL += " AND end_date >= NOW()";
		}
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		// System.out.println("sq: item_query" + " sno: " + sortNameOption + " spo: " + sortPriceOption + " sdo:" + sortDateOption);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme",
					"cs336", "thisisareallysecurepassword551");
						
			if (sortNameOption != 0 || sortPriceOption != 0 || sortDateOption != 0) {
				selectSQL += " ORDER BY";
			}

			if (sortNameOption != 0) {
				if (sortNameOption > 0) {
					selectSQL += " item_name ASC";
				} else if (sortNameOption < 0) {
					selectSQL += " item_name DESC";
				}
			} else if (sortPriceOption != 0) {
				if (sortPriceOption > 0) {
					selectSQL += " current_bid ASC";
				} else if (sortPriceOption < 0) {
					selectSQL += " current_bid DESC";
				}
			} else if (sortDateOption != 0) {
				if (sortDateOption > 0) {
					selectSQL += " start_date ASC";
				} else if (sortDateOption < 0) {
					selectSQL += " start_date DESC";
				}
			}
			
			ps = con.prepareStatement(selectSQL);
			ps.setString(1, "%" + item_query + "%");
			ps.setString(2, "%" + category + "%");
			ps.setString(3, "%" + subcategory + "%");
			rs = ps.executeQuery();
			return rs;
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw e;
		}
	}

	// retrieves all items in a category (TESTED)
	public static ResultSet searchByCategory(String category) throws Exception {
		String selectSQL = "SELECT * FROM buyme.Auction WHERE category_name = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(
					"jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336",
					"thisisareallysecurepassword551");
			ps = con.prepareStatement(selectSQL);
			ps.setString(1, category);
			rs = ps.executeQuery();
			return rs;
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw e;
		}
	}

	// retrieves all items in a subcategory (TESTED)
	public static ResultSet searchBySubcategory(String subcategory) throws Exception {
		String selectSQL = "SELECT * FROM buyme.Auction WHERE subcategory_name = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(
					"jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336",
					"thisisareallysecurepassword551");
			ps = con.prepareStatement(selectSQL);
			ps.setString(1, subcategory);
			rs = ps.executeQuery();
			return rs;
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw e;
		}
	}

	// retrieves a single item in database by id (TESTED)
	public static ResultSet getByID(int itemID) throws Exception {
		String selectSQL = "SELECT * FROM buyme.Auction WHERE auction_id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(
					"jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336",
					"thisisareallysecurepassword551");
			ps = con.prepareStatement(selectSQL);
			ps.setInt(1, itemID);
			rs = ps.executeQuery();
			return rs;
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw e;
		}
	}
	
	// retrieves items sorted by number of bids
	
	// retrieves items sorted by newness
	
	// retrieves items sorted by oldness

	// creates an item(auction) in database (TESTED)
	public static void create(String itemName, String seller, double buyAtPrice, double increment, String itemDescription,
			int userID, String subcategoryName, String image, Timestamp endDate, String categoryName)
			throws Exception {
		String insertSQL = "INSERT INTO buyme.Auction"
				+ "(item_name, current_bid, seller, buy_at_price, increment, auction_id,"
				+ "item_description, user_id, subcategory_name, image, end_date, start_date, category_name)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection con = null;
		PreparedStatement ps = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(
					"jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336",
					"thisisareallysecurepassword551");
			ps = con.prepareStatement(insertSQL);
			ps.setString(1, itemName);
			ps.setDouble(2, buyAtPrice);
			ps.setString(3, seller);
			ps.setDouble(4, buyAtPrice);
			ps.setDouble(5, increment);
			ps.setInt(6, 0);
			ps.setString(7, itemDescription);
			ps.setInt(8, userID);
			ps.setString(9, subcategoryName);
			ps.setString(10, image);
			ps.setTimestamp(11, endDate);
			ps.setTimestamp(12, new Timestamp(System.currentTimeMillis()));
			ps.setString(13, categoryName);
			ps.executeUpdate();
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw e;
		}
	}

	// deletes an item by id
	public static void deleteByID(int itemID) throws Exception {
		String deleteSQL = "DELETE FROM buyme.Auction WHERE auction_id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(
					"jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336",
					"thisisareallysecurepassword551");
			ps = con.prepareStatement(deleteSQL);
			ps.setInt(1, itemID);
			ps.executeUpdate();
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw e;
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		try {
			// debugging

			// inserting an item
//			String itemName = "Macbook Pro 2018 15in";
//			String seller = "r";
//			double buyAtPrice = 499.00;
//			double increment = 5.00;
//			String itemDescription = "Lightly used. Comes with charger and other accessories.";
//			int userID = 6;
//			String subcategoryName = "Laptops";
//			String image = "https://img.letgo.com/images/6c/3d/e5/20/6c3de52082a1845cfcb74db0b8b3ee4e.png?impolicy=img_600";
//			Timestamp endDate = new Timestamp(System.currentTimeMillis() + 1000000000);
//			String categoryName = "Electronics";
//			item.create(itemName, seller, buyAtPrice, increment, itemDescription, userID, subcategoryName, image,
//					endDate, categoryName);

			// searching for items
			ResultSet rs = Item.search("", "", "", 0, 0, -1, true);
//			ResultSet rs = item.searchByCategory("Electronics");
//			ResultSet rs = item.searchBySubcategory("Phones");
//			ResultSet rs = item.getByID(1);
			
			System.out.println("Items found:");
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()) {
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					 if (i > 1) System.out.print(",  ");
			        String columnValue = rs.getString(i);
			        System.out.print(columnValue + " " + rsmd.getColumnName(i));
				}
				System.out.println();
			}

			// deleting an item
//			int auctionID = 1;
//			item.deleteByID(auctionID);

		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
