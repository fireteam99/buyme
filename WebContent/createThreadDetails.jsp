<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%
  	String user = (String)session.getAttribute("user");//request.getParameter("user"); 
	//String threadid = request.getParameter(threadid);//SQL does this automatically??...
    //String title = request.getParameter("title");
	//String desc = request.getParameter("description");
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme";
	Connection con = DriverManager.getConnection(url, "cs336", "thisisareallysecurepassword551");
    Statement st = con.createStatement();

    	//just incase, a double check
		if(user == null || user.equals("null")){//all the post data will be lost, they weren't logged in :/, this case shouldn't happen
			response.sendRedirect("login.jsp");
		}
	
    	String title = request.getParameter("title");
    	String body = request.getParameter("body");
    
    	String user_id = "";
    	//TO DO: get userID from username
    	ResultSet rs;
    	rs = st.executeQuery("SELECT u.user_id FROM User u WHERE u.username = '" + user + "'");
    	if (rs.next()) {
    		user_id = rs.getString("u.user_id");
    	} else {
    		//they're logged in but not registered??, this is not a case (no username changes)
    	}
    	
	 	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		String topost = String.format("INSERT INTO `Thread` (threadid, user_id, timecreated, title, description, solved) VALUES (null, '%s', '%s', '%s', '%s', '0');", user_id, date.toString(), title, body);//insert 0 (its BIT type, only 0,1,or null)
		out.println(topost);
		st.executeUpdate(topost);

		response.sendRedirect("questions.jsp");
		con.close();
	}
	catch (Exception ex){
		out.println(ex);
	}
    
    
    
%>
