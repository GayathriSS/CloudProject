<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@include file="includes/SessionValidation.jsp"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit</title>
<%@include file="includes/header.jsp"%>
<%@page import="java.sql.*"%>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	function showDiv1() {
		document.getElementById('welcomeDiv1').style.display = "block";
	}
</script>
</head>

<body>
	<center>
		<div class="container">
			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							<i class="fa fa-binoculars"></i> View Robot,
							<%=session.getAttribute("userx")%></h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-6">

						<form action="editRobotCode" method="post">
							<fieldset>

								<select name="selectfrom" id="select-from" multiple size="5">
									<%
										ArrayList<RobotDTO> name = (ArrayList<RobotDTO>) session
												.getAttribute("robotList");
										for (int i = 0; i < name.size(); i++) {
									%>
									<option value="<%=name.get(i).getRobotDescription()%>"><%=name.get(i).getRobotDescription()%></option>

									<%
										}
									%>
								</select>
							</fieldset>


							<br />
						</form>
					</div>
					<!-- /.col-lg-6 (nested) -->
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
	</center>
</body>
<%@include file="includes/fotter.jsp"%>
</html>