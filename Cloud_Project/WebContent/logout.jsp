<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
session.invalidate();
//FederatedAuthentication.SessionAuthenticationModule.SignOut();
response.sendRedirect("https://login.windows.net/2bf02736-ae70-4b1f-81d4-4beda2568d70/wsfederation/logout?post_logout_redirect_uri=http://gd3cloud.cloudapp.net/Cloud_Project_OLD");
//out.print("You have signed out of the application successfully");
 %>
</body>
</html>