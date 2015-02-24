<%@page import="com.DTO.HierarchicalPermissionDTO"%>
<%@page import="com.DTO.Hierarchical_Role_PermissionDTO"%>
<%@page import="com.DTO.PackagePermissionDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="includes/SessionValidation.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Create Permission</title>
<%@include file="includes/header.jsp"%>

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
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
					<h1 class="page-header">
						<i class="fa fa-pencil-square-o"></i> Create Hierarchy Permission </h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-6">
					<form id="HPermissionID" action="HPcreate" method="POST">
						<div class="form-group">
							<label for="RoleName">Hierarchical Permission ID</label> <input
								type="text" class="form-control" name="Hpermissionid"
								placeholder="Enter role">
						</div>
						<div class="form-group">
							<table id="table_jquery" border="1" width="410">
								<thead>
									<tr>
										<th>Permission List</th>
										
									</tr>
								</thead>
								<tbody>
									<tr>
										<td id="service0"><input type="text" class="form-control" name="input0">
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<input type="button" id="btnAdd" onClick="AddRows()"
								value="Add Row">
						</div>
						<button type="submit" >Save</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	var count = 12;
	$("#HPermissionID").append('<input type="hidden" id = "test" name="rowcount" value="1">' );
	function AddRows() {	
	
		var numOfRows = $("#table_jquery tbody tr").length;
		var generator = '<tr id="row__"><td id="service__"><input type=" " class="form-control" name="input__"></td></tr>'
		var generator = generator.replace(/\__/g, (numOfRows++).toString());
		$("#table_jquery tr:last").after(generator);
		$("#test").attr("value",numOfRows);
			
		}
	
	function isKeyPressed(event, cell) {
		if (event.altKey == 1) {
			document.getElementById(cell.id).style.background = "white";
		}
	}

	function changeCellColor(cell) {
		document.getElementById(cell.id).style.background = "#C1CDCD";

	}
</script>
</body>
</html>