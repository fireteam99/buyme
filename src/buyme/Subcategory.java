package buyme;

import java.sql.*;

public class Subcategory  {
	public ResultSet getAll() throws Exception {
		String selectSQL = "SELECT * FROM buyme.SubCategory";
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(
					"jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336",
					"thisisareallysecurepassword551");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(selectSQL);
			return rs;
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw e;
		}
	}
	
	// retrieves all the subcategories of a category
	public ResultSet getByCategory(String category) throws Exception {
		String selectSQL = "SELECT * FROM buyme.SubCategory WHERE category_name = ?";
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
	
	public static void main(String[] args) {
		try {
			Subcategory subcategory = new Subcategory();
			// debugging

			// inserting an item
			// String categoryName = "Clothing";


			// searching for items
			// ResultSet rs = subcategory.getAll();
			ResultSet rs = subcategory.getByCategory("Electronics");
			
			System.out.println("Subcategories found:");
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
