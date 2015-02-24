<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="includes/cachecheck.jsp"%>
<%@page import="java.sql.*"%>
<%@include file="includes/SessionValidation.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Robocode</title>
<%@include file="includes/header.jsp"%>
<script src="http://code.jquery.com/jquery.min.js"></script>
</head>
<body>
<%String message = (String) request.getAttribute("message"); 
	if(message != null) {
%>
<%=message %>
<%} %>
	<div class="img" align="center" >
		<img alt="" src="includes/robocode_logo_tanks.png">
	</div>
	
	<center>
		<h1> WELCOME TO ROBOCODE</h1>
		<h3><a href="credits.jsp">Credits</a><br></h3>
		<h3><a href="manual.jsp">User manual</a><br></h3>
		<h3><a href="adminManual.jsp">Admin Instructions</a><br></h3>
	</center>
	
</body>
<%@include file="includes/fotter.jsp"%>
</html>