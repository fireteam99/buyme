<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%
  	String user = session.getAttribute("user");//request.getParameter("user"); 
	//String threadid = request.getParameter(threadid);//SQL does this automatically??...
    	//String title = request.getParameter("title");
	//String desc = request.getParameter("description");
    	Class.forName("com.mysql.jdbc.Driver");
    	String url = "jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme";
	Connection con = DriverManager.getConnection(url, "cs336", "thisisareallysecurepassword551");
    //Statement st = con.createStatement();

    	//just incase, a double check
		if(user == null || user.equals("null")){//all the post data will be lost, they weren't logged in :/, this case shouldn't happen
			response.sendRedirect("login.jsp");
		}
    
    	String threadid = request.getParameter("threadid");
    
    	//check if the user posting is either a customer rep or the poster of the thread
		String user_id = "";//this is the attempting poster
		//get the username from the user_id to show who posted the thread
		String get_userid = "SELECT u.user_id FROM User u WHERE u.username = " + user + " ";
		Statement st = con.createStatement();
		ResultSet result_userid = st.executeQuery(get_userid);
		if(result_userid.next()){
			user_id = result_userid.getString("u.user_id");
		}
	
		String tuserid = "";//the poster of the thread
		String get_posterid = "SELECT t.user_id FROM Thread t WHERE t.threadid = " + threadid + " ";
		result_userid = st.executeQuery(get_posterid);
		if(result_userid.next()){
			tuserid = result_userid.getString("t.user_id");	
		}
		
		boolean isCustomerRep = false;
		boolean isAdmin = false;//check the databases now and update these values
		
		
		result_userid = st.executeQuery("select * from Representative where user_id='" + user_id + "'");
	    if (result_userid.next()) {
	    	isCustomerRep = true;
	    } else {
	    	//they're not a customer rep
	    }
	    
		result_userid = st.executeQuery("select * from Admin where user_id='" + user_id + "'");
	    if (result_userid.next()) {
	    	isAdmin = true;
	    } else {
	    	//they're not an admin
	    }

		
		
		if((!tuserid.equals(user_id)) && isAdmin == false && isCustomerRep == false){
			out.print("You may not post in a thread that you haven't created if your not a customer rep or admin");
		}
		if(tuserid.equals(user_id) || isAdmin==true || isCustomerRep==true){
			//continue :)
			
			String body = request.getParameter("body");
    			String title = request.getParameter("title");

			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			String topost = String.format("INSERT INTO `Post` (threadid, post_id, user_id, body, timecreated) VALUES ('%s', null, '%s', '%s', '%s', '%s');", user_id, date.toString(), title, body);
			out.println(topost);
			st.executeUpdate(topost);

			response.sendRedirect("questions.jsp");
			con.close();
			
		
		}else{
			//get outta here attempting poster	
			
		}
		
	}
	catch (Exception ex){
		out.println(ex);
	}
    
    
    
%>
