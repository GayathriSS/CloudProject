<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="includes/cachecheck.jsp"%>
<%@page import="java.sql.*"%>
<%@include file="includes/SessionValidation.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Robocode</title>
<%@include file="includes/header.jsp"%>
<script src="http://code.jquery.com/jquery.min.js"></script>
</head>
<BODY>
<div style="position:absolute; left:1250px;top:60px;"><a href="welcome.jsp">back to main</a></div>
<h2 style="position:absolute; left:300px;top:50px;">User Manual</h2>
<textarea style="position:absolute; left:300px;top:120px;" rows="25" cols="130">
SAAS ON PAAS 

Description:
SaaS on PaaS system provides the robocode player and editor where these robocode SaaS system implemented MicroSoft Azure PaaS platform. RBAC1 access control to list the services and Discretinary Access control is implemented for objects.

Requirements:
To access the system, you must have windows operating system and any type of browser with Java plugins.

Special Instructions to play the robocode:

* Refer the paly battle service in this manual to play the battle.
*when you play the battle, you might get security exceptions from the browser.
* before playing, just follow the instruction to change the security exceptions.
	** Go to Control panel-->programs-->java.
	**Java Control panel dialog box appears.under security tab, change the security level to medium.	
	**Under exception site list, click edit site list and Exception site list pou-up dialog box appears.click add button. now,enter the location of the site of you system and click ok.
	**then click apply and okay.
	** Restart the browser.
	**While running, you get warning dialog box sayinng do you want to block appilication, click don't block.
	** Again,you get "are you ready running this application"warning message, click run.
*now you can enjoy the battle.


</textarea>
</BODY>
<%@include file="includes/fotter.jsp"%>
</html>