
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="DTO.SettingsDTO"%>
<%@page import="DTO.SettingsDTO"%>
<%@page import="DAO.GetUsersListDAO"%>
<%@include file="includes/SessionValidation.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Ownership settings</title>


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
/* td #permissions{
	width:50px;
}

table{

table-layout: fixed;
    width: 500px !important;

} */
table {
    border: 1px solid black;
    border-collapse: collapse;
    width:100%;
}

table td {
    border: 1px solid black;
}

table td.shrink {
    white-space:nowrap
}

</style>
</head>
<body>
<div style="margin:50px 0px 0px 50px">
	<div class="container">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-8">
					<form id="kadavule" action="saveSettings" method="POST">
					
						
							<table id="table_jquery" border="1">
								<thead>
									<tr>
										<th><center>List of Roles</center></th>
										<th><center>List of Users</center></th>
										<th><center>Permissions</center></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								
									
										
							<%
								/*
								Steps:
									1. Check if the UserSettingsDTO is null or not. 
									2. If it is null then make DB call and JS function
									3. Else populate the value from the object by creating as many number of dropdown list
								*/
								//Step1 : Check If condition
								
								if(session.getAttribute("saveSettings") == null){
									
									List<String> rolesList = new ArrayList<String>();
								
								try {
									Connection connection = DriverManager
											.getConnection("jdbc:mysql://robocodedb.cloudapp.net:3306/form?user=naren&password=naren");

									Statement statement = connection.createStatement();

									ResultSet resultset = statement
											.executeQuery("SELECT DISTINCT HierarchicalRoleId FROM HRoleTable where HierarchicalRoleId <> ''");
									
									
							%>
								<tr id="row1">	
								<td id="role1"><center>
								<select class="form-control" name="select1" id="select1" onchange="generateUsers(this)" style="width: 80%; !important">
								<option selected="selected" disabled="disabled">Select Role</option>	
								<%
									while (resultset.next()) {
										rolesList.add(resultset.getString(1));
								%>
								<option value="<%=resultset.getString(1)%>"><%=resultset.getString(1)%></option>
								<%
									}
								session.setAttribute("rolesList", rolesList);
								} catch (Exception e) {
									out.println("wrong entry" + e);
								}
									
								%>
								</select></center></td>

									<td id="user1"><select class="form-control" name="listUser1" id="listUser1" multiple="multiple"> 
										
										</select></td>

										<td id="permissions1"><center>
											<input type="checkbox" name="permission1" id="permission1" value="View" >View
											<input type="checkbox"name="permission1" id="permission1" value="Edit"> Edit
											<input type="checkbox" name="permission1" id="permission1" value="Play"> Play
										 </center></td>
										<td><center><input type="button" id="btnDelete" class="btnDel"
												onClick="DelRows()" value="Delete Row"/></center></td>
									</tr>
								<%
								} // End of IF condition  UserSettingsDTO.size()
								else{ //UserSettingsDTO.size() > 0
									/*
									Steps:
										1. Create a for loop of the size of the DTO and generate dropdownlist
										2. Each dropdown list selected values must be the values in the DTO
										3. Same for checkbox
									*/
									List<SettingsDTO> UserSettingsDTO = (List<SettingsDTO>) session.getAttribute("saveSettings");
									
									System.out.println("the size of the DTO is"+ UserSettingsDTO.size());

									System.out.println("Inside the ELSE condition");
									for(int i=0; i < UserSettingsDTO.size(); i++){
										/*
										Create a tr = row+counter
										create a td = role+counter , user+counter, permissions+counter and button
										*/
										System.out.println("The DTO domain name is"+ UserSettingsDTO.get(i).getDomainName());
										System.out.println("The DTO user name is"+ UserSettingsDTO.get(i).getDomainName());
										%>
											<tr id="row<%=i+1%>">	
											<td id="role<%=i+1%>"><center>
											<select class="form-control" name="select<%=i+1%>" id="select<%=i+1%>"  onchange="generateUsers(this)" style="width: 80%; !important">
												
											
										<% 
										List<String> rolesList = (List<String>) session.getAttribute("rolesList");
										Iterator<String> iterator = rolesList.iterator();
										while (iterator.hasNext()) {
											String role_value = iterator.next();
											System.out.println("the role value is"+ role_value);
											if(!(role_value.equalsIgnoreCase(UserSettingsDTO.get(i).getDomainName()))){
											%>
											
											<option value="<%=role_value%>"><%=role_value%></option>
											
											<% 
											}
											else{
												%>
												<option selected="selected" value="<%=role_value%>"><%=role_value%></option>
												<%
											}
										}//End of while condition
										%>
										</select></center></td>
										<td id="user<%=i+1%>"><center><select class="form-control" name="listUser<%=i+1%>" id="listUser<%=i+1%>">
										
										<%
											List<String> userList = GetUsersListDAO.getUserList(UserSettingsDTO.get(i).getDomainName());
											List<String> selectedUserList = UserSettingsDTO.get(i).getUsersList(); 
											String selectedUserListString = Arrays.toString(selectedUserList.toArray());
											
											iterator = userList.iterator();
											while (iterator.hasNext()) {
												String users = iterator.next();
												if(selectedUserListString.contains(users)){
												%>
												<option value="<%=users%>" selected="selected"><%=users%></option>
												
												<% 												
											}else{
											
										%>
											<option value="<%=users%>"><%=users%></option>
										<%
											}
											}
										%>
										
										</select></center></td>
										<td id="permissions<%=i+1%>"><center>
											<input type="checkbox" name="permission<%=i+1%>" id="permission<%=i+1%>" value="View" <%=UserSettingsDTO.get(i).getPermissions().get("View") %>>View
											<input type="checkbox"name="permission<%=i+1%>" id="permission<%=i+1%>" value="Edit" <%=UserSettingsDTO.get(i).getPermissions().get("Edit") %>> Edit
											<input type="checkbox"name="permission<%=i+1%>" id="permission<%=i+1%>" value="Edit" <%=UserSettingsDTO.get(i).getPermissions().get("Play") %>> Play
										 </center></td>
										<td><center><input type="button" id="btnDelete" class="btnDel"
												onClick="DelRows()" value="Delete Row"/></center></td>
									</tr>
										
										<% 
									}
								}
								%>	
													
								</tbody>
							</table>
							<br/>
							<input type="button" id="btnAdd" onClick="AddRows()"
								value="Add Row">
						<br/><br/>
						<input type="button" onclick="save()" value="Save Settings">
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$("#kadavule").append(
'<input type="hidden" id = "test" name="rowcount" value="1">');
	
	function AddRows() {

		var numOfRows = $("#table_jquery tbody tr").length + 1;
		
		
		var generator = '<tr id="row__"><td id="role__"><center><select name="select__" id="select__" class="form-control" onchange="generateUsers(this)" style="width: 80%; !important"><option selected="selected" disabled="disabled">Select Role</option></select></center></td><td id="user__"><center><select id="listUser__" name="listUser__" class="form-control" multiple="multiple"></select></center></td><td id="permissions__"><center><input type="checkbox" name="permission__" id="permission__" value="View"> View <input type="checkbox" name="permission__" id="permission__" value="Edit"> Edit <input type="checkbox" name="permission__" id="permission__" value="Play"> Play</center> </td><td><center><input type="button" id="btnDelete" class="btnDel" onClick="DelRows()" value="Delete Row"/></center></td></tr>';
		var generator = generator.replace(/\__/g, (numOfRows).toString());
			
			
		$("#table_jquery tr:last").after(generator);
		
		
		$("#test").attr("value", numOfRows);
		$(".btnDel").bind("click", DelRows);

		var itm = document.getElementById("select1").children;
		for(i=0;i<itm.length;i++){
			$("#select"+numOfRows).append(itm[i].cloneNode(true));	
		}
		
	
		
	}
	
	
	function save()
	{
		$.ajax({
			url : "saveSettings",
			type : 'POST',
			 data: $("#kadavule").serialize(),
			async : false,
			success : function(html) {
				
				window.close();
			}
			
		});
		
	}
	
	function DelRows() {

		var par = $(this).parent().parent().parent(); //tr
		par.remove();

	}
	$(function() {
		$(".btnDel").bind("click", DelRows);
		
	});

	function generateUsers(x){
		
		var str = "";
		var rowselect = x.id;
		 var rowcount = rowselect.substring(6, rowselect.length);
		console.log("rowcountb4:"+rowcount);
		
		var str = x.value;
		
		$.ajax({
			url : "getUsers",
			data : {'rowcount':rowcount,'getRoles':str},
			type : 'POST',
			async : false,
			success : function(html) {
				$("#listUser"+rowcount).html(html);
			}
			
		});
		event.preventDefault();
	
	
	}
	
	
</script>
</body>

</html>