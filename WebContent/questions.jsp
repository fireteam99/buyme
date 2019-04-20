<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
   <head>
      <title>Questions Forum - Threads:</title>
   </head>
   <body>
     		<%    
     		  String url = "jdbc:mysql://cs336.c7mvfesixgy7.us-east-2.rds.amazonaws.com:3306/buyme";
     		  Class.forName("com.mysql.jdbc.Driver");
     		  try {
     			Connection con = DriverManager.getConnection(url, "cs336", "thisisareallysecurepassword551");
     		    
     			
     			Statement st = con.createStatement();
     		    
     		    java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
     		    /*
     		    //String insertStatement = String.format("INSERT INTO User (created_at, full_name, password, username, email, user_id) VALUES ('%s', '%s', '%s', '%s', '%s', null);", date.toString(), name, password, username, email);
     		    st.executeUpdate(insertStatement);
     		    session.setAttribute("user", username);
     		    //response.sendRedirect("success.jsp");
				*/
				
			//TO DO:
			//put a search bar at the top of the page, and use it to change the "threads_query" and redisplay the threads accordingly
			
			
				
			String search_input = "";
     		    
     		String search_query = "SELECT * FROM Thread WHERE title LIKE %" + search_input + "%";
				
     		
     		
			String crea = "createThread.jsp?";
			out.print("<li><a href='" + crea + "'><span class='keyword'>Create a new thread</span></a></li>");  
     		
			String threads_query = "SELECT * FROM Thread ORDER BY timecreated ASC";
			
			//go through all the threads and print them out
			//st = con.createStatement();
			ResultSet result_threads = st.executeQuery(threads_query);	
			while(result_threads.next()){

				int threadid = result_threads.getInt("threadid");
				int user_id = result_threads.getInt("user_id");//the poster
				Timestamp timecreated = result_threads.getTimestamp("timecreated");
				String th_title = result_threads.getString("title");
				String th_description = result_threads.getString("description");
				String solved = result_threads.getString("solved");//solved is a BIT type, which is either 0, 1 or null, solved is 1, unsolved is 0, null means who cares if its solved or not
				
			    //if ((session.getAttribute("user") == null)) {
			    	//they're not logged in
			    	
			    //}

				//get the username from the user_id to show who posted the thread
				String get_username = "SELECT u.username FROM User u WHERE u.user_id = " + user_id + " ";
				st = con.createStatement();
				ResultSet result_username = st.executeQuery(get_username);
				String th_username = "";
				if(result_username.next()){
					th_username = result_username.getString("u.username");
				}
				//TO DO:
				//for solved need to get the value from the databse and convert the value to a string ie. 'true'/'false'
				
				out.print("<ul class='thread'>");
				out.print("<li><span class='keyword'>Title:</span> " + th_title + "</li>");
				//out.print("<li><span class='keyword'>Solved?:</span> " + th_title + "</li>");
				out.print("<li><span class='keyword'>Description:</span> " + th_description + "</li>");
				out.print("<li><span class='keyword'> by </span> " + th_username + "</a></li>");
				out.print("<li><span class='keyword'> on </span> " + timecreated.toString() + "</li>");
				
				//in an ideal world I would only show these options to the poster, but...
				String href1 = "editThread.jsp?threadid=" + threadid + "&user_id=" + user_id;
				out.print("<li><a href='" + href1 + "'><span class='keyword'>edit</span></a></li>");
				
				//for another day
				//String href2 = "deleteThread.jsp?threadid=" + threadid + "&user_id=" +  user_id;
				//out.print("<li><a href='" + href2 + "'><span class='keyword'>delete</span></a></li>");
				
				//create post
				String post = "createPost.jsp?threadid=" + threadid;
				out.print("<li><a href='" + post + "'><span class='keyword'>new post</span></a></li>");

				//put the posts for the threads (the comments)
				String posts_query = "SELECT * FROM Post WHERE Post.threadid = " + threadid + "";
				st = con.createStatement();
				ResultSet result_posts = st.executeQuery(posts_query);
				while(result_posts.next()){
					int postid = result_posts.getInt("postid");
					int po_user_id = result_posts.getInt("user_id");
					Timestamp po_timecreated = result_posts.getTimestamp("timecreated");
					String po_body = result_posts.getString("body");

					//get the username of the poster
					String po_username = "";
					String get_username2 = "SELECT u.username FROM User u WHERE u.user_id = " + po_user_id + " ";
					st = con.createStatement();
					ResultSet result_username2 = st.executeQuery(get_username2);
					if(result_username2.next()){
						po_username = result_username2.getString("u.username");
					}
					
					
					out.print("<ul class='posts'>");
					out.print("<li>" + po_username + "</a> <span class='keyword'> posted:</span> </li>");
					out.print("<li>" + po_body + "</li>");
					out.print("<li><span class='keyword'>on</span>" + po_timecreated.toString() + "</li>");
					//should I insert some sort of divider?
					
					
					out.print("</ul>");
					
				}//for the posts' while

				out.print("</ul>");

			}//for the post's while 
			
				/*
			out.print("</ul>");
			out.print("</div>");
		}//the get threads' while
		*/

				//close connection, right?
				con.close();
		} catch (Exception ex) {//I did not evenly space out/format this code
			out.println(ex);
		}

		%>
     
     
   </body>
   
   
</html>