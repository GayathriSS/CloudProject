<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Robocode Play Battle</title>
<%@include file="includes/header.jsp"%>
<script src="http://code.jquery.com/jquery.min.js"></script>
<SCRIPT>
function getValueFromApplet(){
   var value;
	document.myForm.q.value = document.myApplet.getResult();
	value = document.myApplet.getResult();
	var RobotRankingsInfo = value.split(" "); 
	for (i = 0; i < RobotRankingsInfo.length; i++) { 
	    var each_robot_info = RobotRankingsInfo[i].split(":");
	    
	}
   if(value.length > 1)
	   {
	   
	   	document.forms[0].submit();
	   }
   else
	   {
	   
	   }
   
   }
</SCRIPT>
</head>
<body>
 <div class="container">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
					<i class="fa fa-play"></i> Play Battle,
			<%=session.getAttribute("userx")%></h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
		 <applet 
    code="robocode.Robocode"
    name="myApplet"
	codebase = "jar"
	width = 800
    height = 600
	archive="robocode.jar">	
	<param name=Robots value="<%=session.getAttribute("robots_name")%>">
	<param name=numberofrounds value="<%=session.getAttribute("numberofrounds")%>">
	
</applet>
 <FORM ACTION="scoreUpdate" 
     NAME="myForm" 
     onSubmit="return getValueFromApplet()"
     method="post">
   <INPUT TYPE="hidden" VALUE="" NAME="q">
   <INPUT TYPE="submit" VALUE="Check robots ranking" >
 </FORM>


		<br />
		<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;
		
		
								
		
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