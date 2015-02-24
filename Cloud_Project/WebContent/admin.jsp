<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="includes/cachecheck.jsp"%>
<%@page import="java.sql.*"%>
<%@include file="includes/SessionValidation.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN</title>
<%@include file="includes/header.jsp"%>

<script src="http://code.jquery.com/jquery.min.js"></script>
</head>
<body>
	<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
	%>
	<%=message%>
	<%
		}
	%>
	<center>
		WELCOME TO ROBOCODE
		<h3>

			<%=session.getAttribute("userx")%></h3>

		<a href="createdomain.jsp" class="btn btn-default btn-lg" role="button">CREATE
			DOMAIN</a> <br/><br/> <a href="#" class="btn btn-default btn-lg"
			role="button">USER DOMAIN MAPPING</a>
	</center>

</body>
<%@include file="includes/fotter.jsp"%>
</html>