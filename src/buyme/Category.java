package buyme;

import java.sql.*;

public class Category {
	// retrieves all of the categories
	public ResultSet getAll() throws Exception {
		String selectSQL = "SELECT * FROM buyme.Category";
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
	
	public static void main(String[] args) {
		Category category = new Category();
		try {
			// debugging

			// inserting an item
			// String categoryName = "Clothing";


			// searching for items
			ResultSet rs = category.getAll();
			
			System.out.println("Categories found:");
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
