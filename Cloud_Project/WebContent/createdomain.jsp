<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="includes/cachecheck.jsp"%>
<%@page import="java.sql.*"%>
<%ResultSet resultset =null;%>
<%@include file="includes/SessionValidation.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Domain</title>
</head>
<body>
	<%@include file="includes/header.jsp"%>
	<center>
		<form method="post" action="createdomain">
			<input type="text" name="domainName">
			<button type="submit" class="btn btn-success" id="create">Create
				Domain</button>
		</form>
	</center>
</body>
</html>