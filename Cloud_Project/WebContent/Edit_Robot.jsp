<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%
	ResultSet resultset = null;
%>
<%@include file="includes/SessionValidation.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Robot</title>
<%@include file="includes/header.jsp"%>
</head>
<body>

<script type="text/javascript">
		function myFunction() {

			var x = document.getElementById("domainname").value;
			//alert("x value:"+x);
			$.ajax({
				url : "editservlet",
				data : "domain_name=" + x + "",
				type : 'POST',
				async : false,
				success : function(html) {
					console.log("html:" + html);
					$("#rname").show();
					$("#robotNames").html(html);
					$("#packageName").val(x);
					
				},
				error : function(html) {
					console.log("error html:" + html);
				}
			});
		}
		
		$( document ).ready(function() {
			$('input[name="save"]').change(function()
			{
				var x = $('input[name="save"]:checked').val();
				  console.log("x:"+x);
				  if(x == "Save")
				  {
					  		
					  	  $("#saveAsdiv").hide();
						  $("#savediv").show();
						  
				  }
				  else 
				  {
					  	$("#savediv").hide();
					    $("#saveAsdiv").show();
				  }
			});
			
		});
		
		
		function getRobocode() {

			var x = document.getElementById("robotNames").value;
			//alert("x value:"+x);
			$.ajax({
				url : "editRobotCode",
				data : "robot_name=" + x + "",
				type : 'POST',
				async : false,
				success : function(html) {
						$("#robocode").show();						
						$("#editor").val(html);
						console.log("package Name:"+$("#packageName").val());
				},
				error : function(html) {
					console.log("error html:" + html);
				}
			});
		}
		
</script>
<div class="container">
		<div id="page-wrapper">
			
			
			<div class="row">
				<div class="col-lg-12">
				<c:if test="${not empty Updatedmessage}">
					<font color="green"><c:out value="${Updatedmessage}"></c:out></font>
				</c:if>
				
					<h1 class="page-header">
						<i class="fa fa-pencil-square-o"></i> Edit Robot,
						
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			
			<div class="row">
				<div class="col-lg-6">
						<div class="form-group">
						<div class="input-group">
						<form action="updateRobot" method="post">
						<input type="hidden" name="packageName" id="packageName">
						
							<%
								
								try {
									Connection connection = DriverManager
											.getConnection("jdbc:mysql://robocodedb.cloudapp.net:3306/form?user=naren&password=naren");

									Statement statement = connection.createStatement();

									resultset = statement
											.executeQuery("SELECT DomainName from domain ");
											%>
							
							<select name="domain_name" id="domainname" class="form-control" onchange="myFunction()">
								<option disabled="disabled" selected="selected">Select Domain</option>
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
					</div>
				<!-- /.col-lg-6 (nested) -->
			</div>
			</div>
			
			
			<div class="row">
				<div class="col-lg-6">
				<div class="form-group">
				<div class="input-group" id="rname" style="display: none;">
				
					<select id="robotNames" name="robotNames" class="form-control" onchange="getRobocode()">
					</select>
					
				</div>
				
			
			
			<br>
			<br>
			<div class="input-group" id="robocode" style="display: none;">
					
							<textarea style="display: block;" name="editor" id="editor" rows="16" cols="100">
							</textarea>
							<br>
							
							<fieldset>
							<input type="radio" name="save" value="SaveAs">SaveAs
							<input type="radio" name="save" value="Save">Save						
							</fieldset>
							
						<div id="savediv" style="display: none;">
						<center><button type="submit" class="btn btn-success" id="saveButton">Save</button></center>
						</div>
						
						<div id="saveAsdiv" style="display: none;">
						<center>File Name <input type="text" name="saveFileName" id="saveFileName">
						<button type="submit" class="btn btn-success" id="saveButton" formaction="SaveAsRobot">Save As</button></center>
						</div>
						
					</form>
			</div>
				</div>
			
			</div>
	</div>
		
			<!-- /.row (nested) -->
		
		<!-- /.panel-body -->
	</div>
</div>

</body>
<%@include file="includes/fotter.jsp"%>
</html>