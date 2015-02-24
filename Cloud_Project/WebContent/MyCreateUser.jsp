<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="includes/header_link.jsp"%>
<title>Create New User</title>
<style>
table tr {
	height: 33px;
}



.table_label {
	width: 500px;
}
.reqSymbol{
	color:red;
}
</style>
</head>
<body>
	<div class="container">
		<div id="page-wrapper">
			<div class="row">

				<div class="col-lg-12">
					<h1 class="page-header">
						<i class="fa fa-file-text"></i> Create User
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-6">


					<form action="requestHandler" method="post">
						<table>
							<tr>
								<td>User Name<span class="reqSymbol">*</span></td>
								<td><input name="DisplayName" id="DisplayName"
									style="width: 200px; height: 21px" required></td>
							</tr>
							<tr>
								<td class="table_label">Tenant ID<span class="reqSymbol">*</span></td>
								<td><input name="tenant" style="width: 200px; height: 20px"
									required></td>
							</tr>
							<tr>
								<td>Password<span class="reqSymbol">*</span></td>
								<td><input name="Password" id="Password" type="password"
									style="width: 200px;height: 25px;" required></td>
							</tr>
							<tr>
								<td>First Name</td>
								<td><input name="fn" style="width: 200px;height: 20px;"></td>
							</tr>
							<tr>
								<td>Last Name</td>
								<td><input name="ln" style="width: 200px;height: 21px;"></td>
							</tr>
							<tr>
								<td>User Principal Name<span class="reqSymbol">*</span></td>
								<td><input name="UserPrincipalName" id="UserPrincipalName"
									style="width: 200px; height: 21px" required></td>
							</tr>
							<tr>
								<td>Account Enabled<span class="reqSymbol">*</span></td>
								<td><input name="AccountEnabled" id="AccountEnabled"
									style="width: 200px; height: 21px" required></td>
							</tr>
							<tr>
								<td>ForcePasswordChangeOnNextLogon<span class="reqSymbol">*</span></td>
								<td><input name="ForcePasswordChangeOnNextLogon"
									id="ForcePasswordChangeOnNextLogon"
									style="width: 200px; height: 21px" required></td>
							</tr>
							<tr>
								<td>User Creation</td>
								<td><select id="userAction" name="userAction">
										<option value="UserCreation">User Creation</option>
										<option value="UserReplication">User Replication</option>
								</select></td>
							</tr>

						</table>
						<center>

							<br> <input type="submit" value="Create User"
								style="width: 117px;"> <br>
							<br>
							<%
								String message = (String) request.getSession().getAttribute(
										"message");
								if (message != null) {
							%>
							<font color="green"><%=message%></font><br>
							<%
								}
							%>
						</center>

					</form>
					 <h5><u><strong>NOTE:</strong></u> All fields marked with <span class="reqSymbol">*</span> are required</h5>

				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="includes/fotter.jsp"%>
</html>