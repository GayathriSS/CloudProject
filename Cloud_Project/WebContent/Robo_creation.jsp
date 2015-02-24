<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@include file="includes/header_link.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ResultSet resultset = null;
%>
<%@include file="includes/SessionValidation.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Robot</title>

</head>
<body>
<script type="text/javascript">
function nextButton() {
var x = document.getElementById("robo_name").value;
var y = document.getElementById("package_name").value;
var data= {roboName : x,
		package1 : y};
//alert("x value:"+x);
$.ajax({
	url : "newRobot",
	data : data,
	type : 'POST',
	async : false,
	success : function(html) {
		<% if((session.getAttribute("msg")) == null) {%>
			$("#roboCode").show();	
			$("#editor").html(html);
			<% } 
		else
		{
			%>
			$("#roboCode").hide();
			alert("Filename already exists");
		    session.setAttribute("msg",null);
			<%
		}
		%>
	},
	error : function(html) {
		console.log("error html:" + html);
	}
});
}

function permissionSettings()
{
	window.open("OwnerShipSettings.jsp", "_blank", "toolbar=yes, scrollbars=yes, resizable=yes width=1000, height=300");	
}

</script>

	<div class="container">
		<div id="page-wrapper">
			<div class="row">
			
			<p id="message"></p>
			
				<div class="col-lg-12">
					<h1 class="page-header">
					<i class="fa fa-file-text"></i>	Create a New Robot,
						<%=session.getAttribute("userx")%></h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-6">
					<form method="post" action="saveRobot">
						<div class="form-group">
							<label>Package Name:</label>

							<%
								String name = (String) session.getAttribute("userx");
								String tenantId = (String) session.getAttribute("tenantId");
								try {
									Connection connection = DriverManager
											.getConnection("jdbc:mysql://robocodedb.cloudapp.net:3306/form?user=naren&password=naren");

									Statement statement = connection.createStatement();

									resultset = statement
											.executeQuery("SELECT DISTINCT d.DomainName FROM domain d where d.TenantId = '"+tenantId+"'");
							%>

							<select id="package_name" name="package" class="form-control">
								<%
									while (resultset.next()) {
								%>
								<option value="<%=resultset.getString(1)%>"><%=resultset.getString(1)%></option>
								<%
									}
								%>
							</select>


							<%
								} catch (Exception e) {
									out.println("wrong entry" + e);
								}
							%>

						</div>
						<div class="form-group">
							<label> Robot Name:</label> <input name="roboName" id="robo_name"
								type="text" class="form-control" value="" />
						</div>
						<br />
						<br />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" onclick="nextButton()" class="btn btn-success" id="create" value="Next"/>
						<hr width="1" size="500">
						<div id="roboCode" style="display: none; float:right; position: absolute; top:20px;left:480px;">
						<textarea style="display: block;" name="editor" rows="20" id="editor"
								cols="80">

</textarea>
					 		<button type="submit" class="btn btn-success" id="saveButton">Save</button>
							<a onclick="permissionSettings()">Permission Settings</a>
						
						</div>
					</form>
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