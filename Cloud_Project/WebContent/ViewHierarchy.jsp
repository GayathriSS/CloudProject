<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
	ResultSet resultset = null;
%>
<%@include file="includes/SessionValidation.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hierarchy Mapping</title>
<%@include file="includes/header.jsp"%>
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
			<div class="row">
				<div class="col-lg-12">
					<c:if test="${not empty message4}">
						<font color="green"><c:out value="${message4}"></c:out></font>
					</c:if>
					<h1 class="page-header">
						<i class="fa fa-file-text"></i> Hierarchy Mapping Table</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<div class="row">
				<div class="col-lg-8">
					
				
				<table border="1" cellspacing="1" cellpadding="2">
				<thead>
				<tr>
						<th align="center">Role Id</th>
						<th align="center">Parent Role Id</th>
				</tr>
				</thead>
				<tbody>
				<%
				Connection connection = DriverManager.getConnection("jdbc:mysql://robocodedb.cloudapp.net:3306/form?user=naren&password=naren");
				Statement statement = connection.createStatement();
				resultset = statement
						.executeQuery("SELECT Distinct HierarchicalRoleId,ParentHierarchicalRoleId from Hierarchy");
				
				while(resultset.next())
				{
				%>
				
				<tr>
					<td align="center"><%=resultset.getString(1) %></td>
					<td align="center"><%=resultset.getString(2) %></td>
				</tr>
				<%
				}
				%>
				</tbody>
				</table>
				
				</div>
			</div>
		</div>
</div>

</body>
</html>