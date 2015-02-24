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
						<i class="fa fa-file-text"></i>	Hierarchy Mapping</h1>	</div>
				<!-- /.col-lg-12 -->
			</div>
			<div class="row">
				<div class="col-lg-8">
					
						
					<form id="hierarchy_table" action="saveHierarchy" method="POST">
					
					<div class="form-group">
					
					<table id="table_hierarchy" border="1">
					
					<thead>
									<tr>
										<th>Role</th>
										<th>Parent Role</th>
										<th></th>
									</tr>
					</thead>			
									<%
										List<String> parentRole = new ArrayList<String>();
										Connection connection = DriverManager.getConnection("jdbc:mysql://robocodedb.cloudapp.net:3306/form?user=naren&password=naren");
										Statement statement = connection.createStatement();
										resultset = statement
												.executeQuery("SELECT Distinct HierarchicalRoleId from HRoleTable");
										while (resultset.next()) {
											parentRole.add(resultset.getString(1));
										}
									
									%>
					<tbody>		
					<tr id="row1">
					<td id="hierarchy1">
						<select id="hier1" name="hier1" class="form-control">
						<option selected="selected" disabled="disabled">Select Role</option>
						<%
									
									for(int i=0;i<parentRole.size();i++)
									{
										
						%>
						<option value="<%=parentRole.get(i).toString()%>"><%=parentRole.get(i).toString()%></option>
						<%
						
									}
						%>				
						</select>
					</td>
					<td id="phierarchy1">			
						<select id="parenthierarchy1" name="parenthierarchy1" class="form-control">
						<option selected="selected" disabled="disabled">Select Role</option>
						<%
									for(int i=0;i<parentRole.size();i++)
									{
						%>	
					
						<option value="<%=parentRole.get(i)%>"><%=parentRole.get(i)%></option>
						<%
									}
						%>
					
					</select>
					</td>	
					<td>
					<input type="button" id="btnDelete" class="btnDel" onClick="DelRows()" value="Delete Row"/>
					</td>
					
					</tr>			
					</tbody>
					
					</table>
					<input type="button" id="btnAdd" onClick="AddRows()" value="Add Heirarchy">
					</div>
					<input type="submit" value="Save Heirarchy">
					</form>
				</div>
			</div>
			
			
			<!-- /.row (nested) -->
		
		<!-- /.panel-body -->
	</div>
</div>

<script>

$("#hierarchy_table").append(
'<input type="hidden" id = "test" name="rowcount" value="1">');


function AddRows() {
	
	var numOfRows = $("#table_hierarchy tbody tr").length + 1;
	console.log(numOfRows);
	
	var generator = '<tr id="row__"><td id="hierarchy__"><select name="hier__" id="hier__" class="form-control"></select></td><td id="phierarchy__"><select id="parenthierarchy__" name="parenthierarchy__" class="form-control"></select></td><td><input type="button" id="btnDelete" class="btnDel" onClick="DelRows()" value="Delete Row"/></td></tr>';
	var generator = generator.replace(/\__/g, (numOfRows).toString());
		
		
	$("#table_hierarchy tr:last").after(generator);
	
	
	$("#test").attr("value", numOfRows);
	$(".btnDel").bind("click", DelRows);

	var itm = document.getElementById("hier1").children;
	console.log("itm length:"+itm.length);
	for(i=0;i<itm.length;i++){
		$("#hier"+numOfRows).append(itm[i].cloneNode(true));	
		$("#parenthierarchy"+numOfRows).append(itm[i].cloneNode(true));
	} 


	
}


function DelRows() {

	var par = $(this).parent().parent(); //tr
	par.remove();

}
$(function() {
	$(".btnDel").bind("click", DelRows);
	
});

</script>


</body>
<%@include file="includes/fotter.jsp"%>
</html>