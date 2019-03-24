<%@ page import = "java.sql.*" %>
<%
  String name = request.getParameter("name");
  String username = request.getParameter("username");
  String email = request.getParameter("password");
  Class.forName("com.mysql.jdbc.Driver");
  try {
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbname","cs336", "thisisareallysecurepassword551");
    Statement st = con.createStatement();
    java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
    st.executeUpdate("INSERT INTO User(date, name, passwprd, email, null VALUES (created_at, full_name, password, username, email, user_id");
    session.setAttribute("user", username);
    response.sendRedirect("success.jsp");
  } catch(SQLException se) {
      se.printStackTrace();
  } catch(Exception e) {
      e.printStackTrace();
  }
%>
