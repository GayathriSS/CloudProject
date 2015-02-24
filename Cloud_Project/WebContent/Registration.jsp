<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/Login.css" rel="stylesheet">
<title>Login Application</title>
</head>
<body>
	<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
	%>
	<%=message%>
	<%
		}
	%>
<center>
	<div class="container" >
</center>
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<h1 class="text-center login-title">Welcome to ROBOCODE</h1>
				<div class="account-wall" align="center">
					NEW USER
					<form class="form-signin" action="registrationservlet"
						method="POST">
						<input type="text" name="username" class="form-control"
							placeholder="Email" required autofocus><input
							type="password" name="userpass" class="form-control"
							placeholder="Password" required><br />
						<button class="btn btn-lg btn-primary btn-block" type="submit"
							value="Login">REGISTER</button>

					</form>
				</div>
			</div>
		</div>
</body>
</html>