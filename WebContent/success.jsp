<%
    if ((session.getAttribute("user") == null)) {
%>
    You are not logged in<br/>
    <a href="login.jsp">Please Login</a>
<%
    } else {
%>
     Welcome <%=session.getAttribute("user")%>
     <a href="userPage.jsp">Go To User Page</a>
    <a href='logout.jsp'>Log out</a>
<%
    }
%>
