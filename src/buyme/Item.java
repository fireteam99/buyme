package buyme;
import java.sql.*;

public class Item {
	// allows you to search items while filtering by subcategory and sorting by name, price, and date
	public ResultSet search(String item_query, String category, int sortNameOption, int sortPriceOption, int sortDateOption) throws SQLException {
		String selectSQL = "SELECT * FROM Auction WHERE name LIKE ? AND Category = ?";
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
			Statement st = con.createStatement();
			
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
			preparedStatement.setString(1, "%"+item_query+"%");
			ResultSet rs = preparedStatement.executeQuery();
			return rs;
		} catch(SQLException se){
			throw se;
		} catch(Exception e){
			throw e;
		}
		// retrieves all items in a category
		public ResultSet getByCategory(String category) {
			
		}
		// retireves all items in a subcategory
		public ResultSet getBySubcategory(String subcategory) {
			
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ItemSearch itemSearch = new ItemSearch();
		try {
			ResultSet rs = itemSearch.search("phone", "electronics", 0, 0, 0);
		} catch(SQLException se){
			se.printStackTrace();
		} catch(Exception e){
			e.printStackTrace();
		}
	}

}
