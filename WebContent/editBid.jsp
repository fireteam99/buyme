<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="buyme.Bid" %>
<!DOCTYPE html>
<html>
<head>
<title>Edit Bid</title>
</head>
<body>
<%
Bid b=new Bid();
out.println(b.showEdit(Integer.parseInt(request.getParameter("bid")), Integer.parseInt(request.getParameter("aid"))));
%>

</body>
</html>