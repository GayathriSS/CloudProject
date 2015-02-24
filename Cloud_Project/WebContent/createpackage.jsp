<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="includes/SessionValidation.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Create Package</title>
<%@include file="includes/header.jsp"%>

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.map"></script>
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
<style type="text/css">
.container {
	width: 900px;
	margin: left:700px;
}

#p0,#add,#remove {
	display: inline;
}
</style>
</head>
<body>
	<div class="container">
		<div id="page-wrapper">
		
		<c:if test="${not empty domainMessage}">
					<font color="red"><c:out value="${domainMessage}"></c:out></font>
				</c:if>
		
		
			<div class="col-lg-12">
				<h1 class="page-header">
						<i class="fa fa-sitemap"></i> Create Package
						</h1>
				</div>
				<div class="row">
				<div class="col-lg-8">
				<form method="post" action="createpackage">
				<input type="text" placeholder="Package name" name="packageName" id="packageName" required>
				<input type="submit" value="Create Package">
				</form>
				</div>
				</div>
		</div>
		</div>