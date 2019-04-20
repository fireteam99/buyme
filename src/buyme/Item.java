package buyme;

import java.sql.*;

public class Item {
	// allows you to search items while filtering by category, subcategory and
	// sorting by name, price, and date (TESTED)
	public ResultSet search(String item_query, String category, String subcategory, int sortNameOption,
			int sortPriceOption, int sortDateOption) throws SQLException {
		try {
			String selectSQL = "SELECT * FROM buyme.Auction WHERE item_name LIKE ? AND category_name LIKE ? AND subcategory_name LIKE ?";
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336",
					"thisisareallysecurepassword551");

			if (sortNameOption != 0 || sortPriceOption != 0 || sortDateOption != 0) {
				selectSQL += " ORDER BY";
			}

			if (sortNameOption > 0) {
				selectSQL += " item_name";
			} else if (sortNameOption < 0) {
				selectSQL += " item_name DESC";
			}

			if (sortPriceOption > 0) {
				selectSQL += " buy_at_price";
			} else if (sortPriceOption < 0) {
				selectSQL += " buy_at_price DESC";
			}

			if (sortNameOption > 0) {
				selectSQL += " start_date";
			} else if (sortNameOption < 0) {
				selectSQL += " start_date DESC";
			}
			PreparedStatement preparedStatement = con.prepareStatement(selectSQL);
			preparedStatement.setString(1, "%" + item_query + "%");
			preparedStatement.setString(2, "%" + category + "%");
			preparedStatement.setString(3, "%" + subcategory + "%");
			ResultSet rs = preparedStatement.executeQuery();
			return rs;
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw e;
		}
	}

	// retrieves all items in a category (TESTED)
	public ResultSet searchByCategory(String category) throws SQLException {
		String selectSQL = "SELECT * FROM buyme.Auction WHERE category_name = ?";
		try {
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336",
					"thisisareallysecurepassword551");
			PreparedStatement preparedStatement = con.prepareStatement(selectSQL);
			preparedStatement.setString(1, category);
			ResultSet rs = preparedStatement.executeQuery();
			return rs;
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw e;
		}
	}

	// retrieves all items in a subcategory (TESTED)
	public ResultSet searchBySubcategory(String subcategory) throws SQLException {
		String selectSQL = "SELECT * FROM buyme.Auction WHERE subcategory_name = ?";
		try {
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336",
					"thisisareallysecurepassword551");
			PreparedStatement preparedStatement = con.prepareStatement(selectSQL);
			preparedStatement.setString(1, subcategory);
			ResultSet rs = preparedStatement.executeQuery();
			return rs;
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw e;
		}
	}
	
	// retrieves a single item in database by id
	public ResultSet getByID(int auctionID) throws SQLException {
		String selectSQL = "SELECT * FROM buyme.Auction WHERE auction_id = ?";
		try {
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336",
					"thisisareallysecurepassword551");
			PreparedStatement preparedStatement = con.prepareStatement(selectSQL);
			preparedStatement.setInt(1, auctionID);
			ResultSet rs = preparedStatement.executeQuery();
			return rs;
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw e;
		}
	}
	
	// creates an item(auction) in database (TESTED)
	public void create(String itemName, String seller, double buyAtPrice, double increment, String itemDescription, int userID, String subcategoryName, String image, Timestamp endDate, String categoryName) throws SQLException {
		String insertSQL = "INSERT INTO buyme.Auction" + 
				"(item_name, current_bid, seller, buy_at_price, increment, auction_id," + 
				"item_description, user_id, subcategory_name, image, end_date, start_date, category_name)" + 
				"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336",
					"thisisareallysecurepassword551");
			PreparedStatement ps = con.prepareStatement(insertSQL);
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
		
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Item item = new Item();
		try {
			// debugging
			
			// inserting an item
//			String itemName = "Test Item";
//			String seller = "a";
//			double buyAtPrice = 10.00;
//			double increment = 1.00;
//			String itemDescription = "This is a test item.";
//			int userID = 1;
//			String subcategoryName = "Phones";
//			String image = "https://img.letgo.com/images/a9/c5/6e/fa/a9c56efa672d4ccd4ac5c1e4395b544d.jpeg?impolicy=img_600";
//			Timestamp endDate = new Timestamp(System.currentTimeMillis() + 1000000000);
//			String categoryName = "Electronics";
//			item.create(itemName, seller, buyAtPrice, increment, itemDescription, userID, subcategoryName, image, endDate, categoryName);
			
			// search
//			ResultSet rs = item.search("", "Electronics", "Phones", 0, 0, 0);
//			ResultSet rs = item.searchByCategory("Electronics");
//			ResultSet rs = item.searchBySubcategory("Phones");
			ResultSet rs = item.getByID(1);
			
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()) {
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					 if (i > 1) System.out.print(",  ");
			        String columnValue = rs.getString(i);
			        System.out.print(columnValue + " " + rsmd.getColumnName(i));
				}
				System.out.println();
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
