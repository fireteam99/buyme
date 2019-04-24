package buyme;

import java.sql.*;

public class Notification {
	// returns a message and time field
	public static ResultSet getNotificationForUser(String username) {
		String selectSQL = "SELECT * FROM buyme.Auction WHERE auction_id = ?";
		Connection con = null;
		PreparedStatement ps = null;
		return null;
	}
}
