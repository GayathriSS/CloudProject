<!DOCTYPE html>
<%@page import="com.DTO.HierarchicalPermissionDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.DTO.PackageRoleDTO"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Permission</title>
<%@include file="includes/header.jsp"%>
<%@include file="includes/SessionValidation.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container {
	width: 900px;
	margin: left:700px;
}

.bs-example {
	margin: 20px;
}
/* Fix alignment issue of label on extra small devices in Bootstrap 3.2 */
.form-horizontal .control-label {
	padding-top: 7px;
}
</style>
</head>
<body>
		<div class="container">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
				<c:if test="${not empty message6}">
						<font color="green"><c:out value="${message6}"></c:out></font>
					</c:if>
					<h1 class="page-header">
						<i class="fa fa-align-justify"></i> Edit Hierachy Permission
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="bs-example">
				<div class="row">
					<div class="col-lg-6">
						<form id="HPermissionID" action="HPedit2" method="POST">
							<div class="form-group">
								<label for="RoleName">Hierarchical Permission ID</label> <select
									name="Hpermissionid" id="package" class="form-control">
									<%
										List<HierarchicalPermissionDTO> HPermList = (List<HierarchicalPermissionDTO>)session.getAttribute("Permission");
									%><option disabled="disabled" selected="selected">Select
										Hierarchical Permission ID</option>
									<%
										for(int i=0;i<HPermList.size();i++){
									%><option
										value="<%=HPermList.get(i).getHierarchicalPermissionID()%>"><%=HPermList.get(i).getHierarchicalPermissionID()%></option>
									<%
										}
									%>
								</select>

							</div>
							<div class="form-group">
								<label for="inputEmail">Select to delete </label> <select
									id="robotNames" name="HRoleNames" multiple="5"
									onchange="getRobocode()" class="form-control">
								</select>

							</div>

							<div class="form-group">
								<label for="RoleName">Select to add</label>


								<table id="table_jquery" border="1">
									<thead>
										<tr>
											<th>Permission List</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td id="service0"><input type="text" name="input0">
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
								<input type="button" id="btnAdd" onClick="AddRows()"
									value="Add Row">
							</div>


							<div class="col-xs-offset-2 col-xs-10">
								<button type="submit" class="btn btn-primary">Save</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var count = 12;
		$("#HPermissionID").append(
				'<input type="hidden" id = "test" name="rowcount" value="1">');
		function AddRows() {

			var numOfRows = $("#table_jquery tbody tr").length;
			var generator = '<tr id="row__"><td id="service__"><input type=" "name="input__"></td></tr>'
			var generator = generator.replace(/\__/g, (numOfRows++).toString());
			$("#table_jquery tr:last").after(generator);
			$("#test").attr("value", numOfRows);

		}

		function isKeyPressed(event, cell) {
			if (event.altKey == 1) {
				document.getElementById(cell.id).style.background = "white";
			}
		}

		function changeCellColor(cell) {
			document.getElementById(cell.id).style.background = "#C1CDCD";

		}
		$("#package").on('change', function(event) {
			var str = "";
			$("#package option:selected").each(function() {
				str += $(this).text();
			});
			$.ajax({
				url : "HPedit1",
				data : "pemission=" + str + "",
				type : 'POST',
				async : false,
				success : function(html) {
					console.log("html:" + html);
					$("#robotNames").html(html);

				},
				error : function(html) {
					console.log("error html:" + html);
				}
			});

			event.preventDefault();
		});
	</script>
</body>
</html>
