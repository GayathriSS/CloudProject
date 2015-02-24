

<link href="css/bootstrap.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="css/style_header.css" rel="stylesheet">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="cachecheck.jsp" %>

<%
	if (session == null) {
		out.print("NOT VALID");
	} else {
	}
%>
<script>

function submit() {
	$("#role").submit();
}

function submit1() {
	$("#heirarchy").submit();
}
function submit2() {
	$("#heirarchyc").submit();
}
function submit3() {
	$("#editrole").submit();
}
function submit4() {
	$("#heirarchyEdit").submit();
}
function submit5() {
	$("#packageEdit").submit();
}
function submit6() {
	$("#maph").submit();
}
function submit8() {
	$("#Ppermissionedit").submit();
}
</script>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<a class="navbar-brand" href=""><strong>Robocode </strong></a>
			</div>
			
			<!-- /.navbar-header -->
			<ul class="nav navbar-top-links navbar-right">
				<li><a href="logout.jsp"><i class="fa fa-sign-out fa-fw"></i>&nbsp;Logout</a>
				</li>
			</ul>
			
			
			<!-- Select user roles based on user login -->
			<select name="user_role" id="userrole" class="nav navbar-top-links navbar-right" style="background-color:#E6E6FA; margin-top: 10px;!important ,width: 150px; !important ">
			<option selected="selected" disabled="disabled">Select Role</option>
			<c:forEach items="${userRole}" var="userRoles">
				<option value="${userRoles}" ${userRoles == SelectedItem ? 'selected="selected"' : ''}>${userRoles}</option>
			</c:forEach>
				
			</select>
			
			
		</nav>
		<!-- /.navbar-top-links -->
	</div>
	<div class="nav-side-menu">
		<div class="menu-list">
			<ul id="menu-content">
				<li><a href="welcome.jsp"> <i class="fa fa-home"></i> Home
				</a></li>
							<%
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("Robo_creation.jsp".toLowerCase()))
			{
			%>
				<li><a href="Robo_creation.jsp"><i class="fa fa-file-text"></i>
						Create</a></li>
						<%
			}
						%>
						
							<%
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("View_Robot.jsp".toLowerCase()))
			{
			%>
				<li><a href="View_Robot.jsp"><i class="fa fa-binoculars"></i>
						View </a></li>
						<%
			}
						%>
						<%
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("Edit_Robot.jsp".toLowerCase()))
			{
			%>
				<li><a href="Edit_Robot.jsp"><i
						class="fa fa-pencil-square-o"></i> Edit </a></li>
						<%
			}
						%>
						<%
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("PlayBattle.jsp".toLowerCase()))
			{
			%>
				<li><a href="PlayBattle.jsp"> <i class="fa fa-play"></i>
						Play Battle
				</a></li>
				<%
			}
						%>
						<%
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("MyCreateUser.jsp".toLowerCase()))
			{
			%>
				<li><a href="MyCreateUser.jsp"> <i class="fa fa-user"></i>
						Create User
				</a></li>
				<%
			}
						%>
						<%
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("CreateRole.jsp".toLowerCase()))
			{
			%>
						
					<%
					} %>
						
					<% 
					if (session.getAttribute("roleaccess").toString().toLowerCase().contains("Hierarcy.jsp".toLowerCase()))
			{
			%>
				<li><form action="Hierarchyrole" method="post" id="heirarchy">
							<i class="fa fa-align-justify"></i> <a onClick="submit1()">Create Heirarchical Role</a>
						</form>						
					</li>
					<%
					}
					 %>
				
				
				<%
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("ViewHierarchy.jsp".toLowerCase()))
			{
			%>
				<li><i class="fa fa-align-justify"></i><a href="ViewHierarchy.jsp"> 
						View Hierarchy
				</a></li>
				<%
			}
						%>
			
				
				
				
					 
						
<%
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("EditRole123.jsp".toLowerCase()))
			{
			%>
				<%
			}
						%>
						<%
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("EditPackage.jsp".toLowerCase()))
			{
			%>
				
<%
			}
						%>
						<%
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("EditRole.jsp".toLowerCase()))
			{
			%>
				<li><form action="Hierarchyedit" method="post" id="heirarchyEdit">
						<i class="fa fa-align-justify"></i> <a onClick="submit4()">Edit
							Heirarchical Role</a>
					</form></li>
					<%
			}
						%>
						
						
			<%
			
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("Hierarchy_Map.jsp".toLowerCase()))
			{
					
			%>			
					<li><i class="fa fa-align-justify"></i>
					<a href="Hierarchy_Map.jsp">Hierarchy</a></li>	
						
			<%
			}
			%>			
						
						
						
						<% 
					if (session.getAttribute("roleaccess").toString().toLowerCase().contains("HPermission.jsp".toLowerCase()))
			{
			%>
							<li><i class="fa fa-align-justify"></i> <a
					href="HPermission.jsp">Create Heirarchy Permission</a></li>
					<%
					} %>
						<%
						if (session.getAttribute("roleaccess").toString().toLowerCase().contains("HPermissionedit.jsp".toLowerCase()))
			{
			%>
				<li><form action="HPedit" method="post" id="heirarchyc">
						<i class="fa fa-align-justify"></i> <a onClick="submit2()">Edit Hierarchy Permission</a>
					</form></li>
						<%
			}
						%>
						<%
						if (session.getAttribute("roleaccess").toString().toLowerCase().contains("PPermissionCreate.jsp".toLowerCase()))
			{
			%>
						<!-- <li><i class="fa fa-pencil-square-o"></i> <a
					href="PPermissionCreate.jsp">Package PermissionCreate</a></li> -->
					<%
			}
						%>
						<%
						if (session.getAttribute("roleaccess").toString().toLowerCase().contains("PPermissionedit.jsp".toLowerCase()))
			{
			%>
			
					<%
			}
						%>
						<%
						if (session.getAttribute("roleaccess").toString().toLowerCase().contains("MapHRole.jsp".toLowerCase()))
			{
			%>
				
						<%
			}
						%>
						<%
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("tenantMap.jsp".toLowerCase()))
			{
			%>
						<li><a href="tenantMap.jsp"> <i class="fa fa-play"></i>Inter Tenant Mapping</a></li> 
					<%
					} %>
						<%
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("createpackage.jsp".toLowerCase()))
			{
			%>
						<li><a href="createpackage.jsp"> <i class="fa fa-play"></i>Create Package</a></li> 
					<%
					} %>					
					<%
			if (session.getAttribute("roleaccess").toString().toLowerCase().contains("Help.jsp".toLowerCase()))
			{
			%>
				<li><a href="Help.jsp"> <i class="fa fa-users fa-lg"></i>
						Help
				</a></li>
				<%
			}
						%>
					
			</ul>
			
		</div>
	</div>

<script>
$(document).ready(function(){
 $("#userrole").on('change', function(event) {
	 var str = "";
	 $( "select option:selected" ).each(function() {
	 	console.log("selected value b4:"+str);
	      str += $( this ).text() + "";
	      console.log("selected value:"+str);
	    });
		$.ajax({
			url : "loginServlet",
			type : "GET",
			data: "user_role="+str+"",
			async : false,
			success : function(html) {
				 console.log(html);
				 location.pathname = "/Cloud_Project_OLD/welcome.jsp";
				 
				 
				 
			}
		});
		event.preventDefault();
	});
});

</script>


</body>

</html>