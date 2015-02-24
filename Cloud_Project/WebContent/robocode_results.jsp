<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Robocode Results</title>
<%@include file="includes/header.jsp"%>
<%@page import="java.util.*"%>
<script src="http://code.jquery.com/jquery.min.js"></script>
</head>
<body>
<div class="container">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
					<i class="fa fa-play"></i> Robots Ranking</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<%  
					// retrieve your list from the request, with casting 
					
					ArrayList<String> list = (ArrayList<String>) request.getAttribute("servletName");

					// print the information about every category of the list

				%>



		
		
								
		
</div>
				<!-- /.col-lg-6 (nested) -->
			</div>
			<!-- /.row (nested) -->
		</div>
		<!-- /.panel-body -->
	</div>
</body>
<%@include file="includes/fotter.jsp"%>
</html>