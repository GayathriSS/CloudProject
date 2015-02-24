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
<title>Edit Hierarchy Mapping</title>
<%@include file="includes/header.jsp"%>
</head>



<body>


<div class="container">
		<div id="page-wrapper">
			<div class="row">
			
			<%
			
				if(session.getAttribute("HeirarchyMessage")!=null)
				{
			%>
				<font color="green"><%=session.getAttribute("HeirarchyMessage").toString()%></font>
			<%
				}
			%>
				<div class="col-lg-8">
				
				
				
				<h1 class="page-header">
					<i class="fa fa-file-text"></i>	Heirarchy Mapping</h1>
						
					<form id="hierarchy_table" action="editHierarchyMap" method="POST">
					
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
										Map<String,String> hierarchyMap = new HashMap<String,String>();
										Connection connection = DriverManager.getConnection("jdbc:mysql://robocodedb.cloudapp.net:3306/form?user=naren&password=naren");
										Statement statement = connection.createStatement();
										resultset = statement
												.executeQuery("SELECT HierarchicalRoleId,ParentHierarchicalRoleId from Hierarchy");
										while (resultset.next()) {
											hierarchyMap.put(resultset.getString(1), resultset.getString(2));
										}
									
									%>
					<tbody>		
					<%
									List<String> hierarchyKey = new ArrayList(hierarchyMap.keySet());
									
									for(int i=0;i<hierarchyMap.size();i++)
									{
										
						%>
					
					<tr id="row<%=i+1%>">
					<td id="hierarchy<%=i+1%>">
						<select id="hier<%=i+1%>" name="hier<%=i+1%>" class="form-control">
						<option disabled="disabled">Select Role</option>
						<%
						for(int j=0;j<hierarchyKey.size();j++)
						{
							if(i==j){
								
							
						%>
						<option selected="selected" value="<%=hierarchyKey.get(j).toString()%>"><%=hierarchyKey.get(j).toString()%></option>
						<%
						
							}else
							{
						%>	
						<option value="<%=hierarchyKey.get(j).toString()%>"><%=hierarchyKey.get(j).toString()%></option>
						<%
							}
						}
						%>			
						</select>
					</td>
					<td id="phierarchy<%=i+1%>">			
						<select id="parenthierarchy<%=i+1%>" name="parenthierarchy<%=i+1%>" class="form-control">
						<option selected="selected" disabled="disabled">Select Role</option>
						<%
									for(int j=0;j<hierarchyKey.size();j++)
									{
										if(i==j){	
									
						%>	
						<option selected="selected" value="<%=hierarchyMap.get(hierarchyKey.get(j)).toString()%>"><%=hierarchyMap.get(hierarchyKey.get(j)).toString()%></option>
						<%
										}else{
						%>
						
						<option value="<%=hierarchyKey.get(j).toString()%>"><%=hierarchyKey.get(j).toString()%></option>
						<%
									}
									}
						%>
											
					</select>
					</td>	
					<td>
					<input type="button" id="btnDelete" class="btnDel" onClick="DelRows()" value="Delete Row"/>
					</td>
					
					</tr>		
					<%
									}
					%>	
					</tbody>
					
					</table>
					
					</div>
					<input type="button" value="Update Heirarchy" onclick="submitForm()">
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


function submitForm()
{
	var numOfRows = $("#table_hierarchy tbody tr").length;
	$("#test").val(numOfRows);
	$("#hierarchy_table").submit();
}


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