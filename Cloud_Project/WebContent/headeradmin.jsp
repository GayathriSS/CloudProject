<link href="css/bootstrap.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="css/style_header.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery.min.js"></script>
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
		</nav>
		<!-- /.navbar-top-links -->
	</div>
	<div class="nav-side-menu">
		<div class="menu-list">
			<ul id="menu-content">

				<!-- <li><form action="Createrole" method="post" id="role">
						<i class="fa fa-pencil-square-o"></i> <a onClick="submit()">Role</a>
					</form></li>
				<li>

					<form action="Editrole" method="post" id="editrole">
						<i class="fa fa-pencil-square-o"></i> <a onClick="submit3()">Edit
							Role</a>
					</form>
				</li> -->
				<li><form action="Hierarchyrole" method="post" id="heirarchy">
						<i class="fa fa-pencil-square-o"></i> <a onClick="submit1()">Heirarchy</a>
					</form></li>
				<li><form action="Hierarchyedit" method="post" id="heirarchyEdit">
						<i class="fa fa-pencil-square-o"></i> <a onClick="submit4()">Edit
							Heirarchy</a>
					</form></li>
				<li><i class="fa fa-pencil-square-o"></i> <a
					href="HPermission.jsp">PermissionCreate</a></li>
				<li><form action="HPedit" method="post" id="heirarchyc">
						<i class="fa fa-pencil-square-o"></i> <a onClick="submit2()">PermissionEdit</a>
					</form></li>

			</ul>
		</div>
	</div>
</body>
</html>