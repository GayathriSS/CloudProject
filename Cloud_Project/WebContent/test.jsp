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
out.print("SAML" + session.getAttribute("SAML"));
out.print("userName" + session.getAttribute("userName"));
out.print("roleaccess" + session.getAttribute("roleaccess"));
out.print("userRole" + session.getAttribute("userRole"));
out.print("rol" +session.getAttribute("rol"));
 %>
</body>
</html>