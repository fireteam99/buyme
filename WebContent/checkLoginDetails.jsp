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
       		session.setAttribute("user", username);
        	int id=rs.getInt("user_id");
        	rs = st.executeQuery("select * from Representative where user_id='"+id+"'");
        	if (rs.next()) {
            	response.sendRedirect("custRepDashboard.jsp");
        	}
        	else{
        		rs = st.executeQuery("select * from Admin where user_id='"+id+"'");
            		if (rs.next()) {
                		response.sendRedirect("adminDashboard.jsp");
            		}
            		else{
				response.sendRedirect("success.jsp");
            		}
        	}
    	} else {
        	out.println("Invalid password <a href='login.jsp'>try again</a>");
    	}
%>
