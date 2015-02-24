<%@page import="com.DTO.HierarchicalPermissionDTO"%>
<%@page import="com.DTO.PackagePermissionDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="includes/SessionValidation.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Create Hierarchy</title>
<%@include file="includes/header.jsp"%>

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
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
<div class="container">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<c:if test="${not empty message4}">
						<font color="green"><c:out value="${message4}"></c:out></font>
					</c:if>
					<h1 class="page-header">
						<i class="fa fa-align-justify "></i> Create Hierarchy
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<div class="row">
				<div class="col-lg-8">
					<form action="Hrole" id="Hierarchy" method="POST">
						<div class="form-group"><!-- 
							<label for="RoleName">Role Name </label> --><abbr title="Enter the Role Name">Role Name</abbr> <input type="text"
								class="form-control" name="Hroleid" placeholder="Enter Hierarchy">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Description</label> <input
								type="text" class="form-control" name="Hroledesc"
								id="Description" placeholder="Description">
						</div>
						<div class="form-group">
							<table id="table_jquery" border="" width="570">
								<thead>
									<tr>
										<th>Permission List</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td id="permission1"><select name="select0" class="form-control">
										<option selected="selected"  disabled="disabled">Select Permission</option>
												<%List <HierarchicalPermissionDTO> permission1 = (List<HierarchicalPermissionDTO>)session.getAttribute("permissionDescription");
											for(int i=0;i<permission1.size();i++){ %>
												<option
													value="<%=permission1.get(i).getHierarchicalPermissionID()%>"><%=permission1.get(i).getHierarchicalPermissionID()%></option>
												<%} %>
										</select></td>
										</tr>
								</tbody>
							</table>
							<br/>
							<input type="button" id="btnAdd" onClick="AddRows()"
								value="Add Row">
						</div>
						<button type="submit">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	var count = 12;
	$("#Hierarchy").append('<input type="hidden" id = "test" name="rowcount" value="1">' );
	function AddRows() {
		
	
		var numOfRows = $("#table_jquery tbody tr").length;
		var generator = '<tr id="row__"><td id="permission__"><select name="select__"  class="form-control"><option selected="selected"  disabled="disabled">Select Permission</option><%List <HierarchicalPermissionDTO> permission2 = (List<HierarchicalPermissionDTO>)session.getAttribute("permissionDescription");for(int i=0;i<permission2.size();i++){%><option value="<%=permission1.get(i).getHierarchicalPermissionID()%>"><%=permission2.get(i).getHierarchicalPermissionID()%></option><%}%></select></td></tr>'
		var generator = generator.replace(/\__/g, (numOfRows++).toString());
		$("#table_jquery tr:last").after(generator);
		$("#test").attr("value", numOfRows);

	}
	function DelRows() {

		var par = $(this).parent().parent(); //tr
		par.remove();

	}
	$(function() {

		$(".btnDel").bind("click", DelRows);
	});

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