<%@ page import = "java.sql.*" %>
<%
  String name = request.getParameter("name");
  String username = request.getParameter("username");
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  Class.forName("com.mysql.jdbc.Driver");
  try {
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
    	Statement st = con.createStatement();
    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
    	String insertStatement = String.format("INSERT INTO User (created_at, full_name, password, username, email, user_id) VALUES ('%s', '%s', '%s', '%s', '%s', null);", date.toString(), name, password, username, email);
    	st.executeUpdate(insertStatement);
    	ResultSet rs;
    	rs=st.executeQuery("SELECT * FROM User WHERE username='"+username+"'");
    	if(rs.next()){
    		int id=rs.getInt("user_id");
    		insertStatement="INSERT INTO Representative(user_id) VALUES("+id+")";
    		st.executeUpdate(insertStatement);
    		response.sendRedirect("success2.jsp");
    	}
  } catch(SQLException se) {
	  out.println("Error creating customer representative.");
	  out.println("Please try again: <a href='createCustRep.jsp'>Create</a>");
      se.printStackTrace();
  } catch(Exception e) {
      e.printStackTrace();
  }
%>
