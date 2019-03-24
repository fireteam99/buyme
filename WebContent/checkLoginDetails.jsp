<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");   
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme", "cs336", "thisisareallysecurepassword551");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from User where username='" + username + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", username); // the username will be stored in the session
        out.println("welcome " + username);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>
