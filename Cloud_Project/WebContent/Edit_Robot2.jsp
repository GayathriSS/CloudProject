<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="includes/SessionValidation.jsp"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@page import="java.sql.*"%>
<script src="http://code.jquery.com/jquery.min.js"></script>
</head>
<body>
	<form action="editRobotCode" method="post" >
		<fieldset>
			<select name="selectfrom" id="select-from" multiple size="5">
				<% ArrayList<RobotDTO> name = (ArrayList<RobotDTO>)session.getAttribute("robotList"); 
				for(int i=0;i< name.size();i++) {%>
				<option value="<%=name.get(i).getRobotDescription()%>"><%=name.get(i).getRobotDescription() %></option>
				<%} %>
			</select>
		</fieldset>
		<br />
		<div id="RobotCode" style="position: absolute; top:5px; left: 200px;"></div>
	</form>
	<script>
 $("#select-from").on('click', function(event) {
	 var string1 = "";
	 $( "#select-from option:selected" ).each(function() {
	      string1 += $( this ).text() + " ";
	    });
		$.ajax({
			url : "editRobotCode",
			data: "selectfrom="+string1+"",
			type : 'POST',
			async : false,
			success : function(html) {
				$("#RobotCode").html(html);
			}
		});
		event.preventDefault();
	});
</script>


</body>

</html>