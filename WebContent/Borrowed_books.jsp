<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page
	import="java.io.*,java.util.*,java.util.Enumeration,java.text.*"%>
<!DOCTYPE html >

<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>E-Book Finder</title>
<!-- Favicon -->
<link href="./assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link href="./assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link
	href="./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link href="./assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
</head>

<body class="">
<%
		
			response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate" );
		
			response.setHeader("Progma", "no-cahce");
			
			response.setHeader("Expires", "0");
			
			if(session.getAttribute("enroll_id") == null)
			{
				response.sendRedirect("login.jsp");
			}
		
		%>
	<nav
		class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white"
		id="sidenav-main">
		<div class="container-fluid">
			<!-- Toggler -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#sidenav-collapse-main" aria-controls="sidenav-main"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Brand -->
			<a class="navbar-brand pt-0" href="UserHome.jsp"> <img
				src="./assets/img/brand/blue.png" class="navbar-brand-img" alt="...">
			</a>
			<!-- User -->
			<ul class="nav align-items-center d-md-none">
				<!-- this is drop down for notification in mobile view -->
				<li class="nav-item dropdown"><a class="nav-link nav-link-icon"
					href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="ni ni-bell-55"></i>
				</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right"
						aria-labelledby="navbar-default_dropdown_1">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<!--the profile image and contents-->
				<li class="nav-item dropdown"><a class="nav-link" href="#"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">
						<div class="media align-items-center">
							<span class="avatar avatar-sm rounded-circle"> <img
								alt="Image placeholder"
								src="./assets/img/theme/team-1-800x800.jpg">
							</span>
						</div>
				</a></li>
			</ul>
			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Collapse header -->
				<div class="navbar-collapse-header d-md-none">
					<div class="row">
						<div class="col-6 collapse-brand">
							<a href="#"> <img src="./assets/img/brand/blue.png">
							</a>
						</div>
						<div class="col-6 collapse-close">
							<button type="button" class="navbar-toggler"
								data-toggle="collapse" data-target="#sidenav-collapse-main"
								aria-controls="sidenav-main" aria-expanded="false"
								aria-label="Toggle sidenav">
								<span></span> <span></span>
							</button>
						</div>
					</div>
				</div>
				<!-- Form -->
				<form class="mt-4 mb-3 d-md-none">
					<div class="input-group input-group-rounded input-group-merge">
						<input type="search"
							class="form-control form-control-rounded form-control-prepended"
							placeholder="Search" aria-label="Search">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<span class="fa fa-search"></span>
							</div>
						</div>
					</div>
				</form>
				<!-- Navigation -->
				<ul class="navbar-nav">
					<li class="nav-item  active"><a class=" nav-link active "
						href="UserHome.jsp"> <i class="ni ni-tv-2 text-primary"></i>
							Dashboard
					</a></li>
					<li class="nav-item"><a class="nav-link " href=""> <i
							class="ni ni-planet text-blue"></i> Books Borrowed
					</a></li>

					<li class="nav-item"><a class="nav-link " href="profile.jsp">
							<i class="ni ni-single-02 text-yellow"></i> User profile
					</a></li>
					<li class="nav-item"><a href="Logout" class="nav-link "> <i
							class="ni ni-user-run"></i> Logout
					</a></li>
				</ul>
				<!-- Divider -->

			</div>
	</nav>
	<div class="main-content">
		<!-- Navbar -->
		<nav class="navbar navbar-top navbar-expand-md navbar-dark"
			id="navbar-main">
			<div class="container-fluid">
				<!-- Brand -->
				<a
					class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block"
					href="#">Books Borrowed </a>

				<!-- User -->
				<ul class="navbar-nav align-items-center d-none d-md-flex">
					<li class="nav-item dropdown"><a class="nav-link pr-0"
						href="profile.jsp" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
							<div class="media align-items-center">
								<span class="avatar avatar-sm rounded-circle"> <img
									alt="Image placeholder"
									src="./assets/img/theme/team-4-800x800.jpg">
								</span>
								<div class="media-body ml-2 d-none d-lg-block">
									<span class="mb-0 text-sm  font-weight-bold"> ${name} </span>
								</div>
							</div>
					</a></li>
				</ul>
			</div>
		</nav>
		<!-- End Navbar -->
		<!-- Header -->
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
			<div class="container-fluid">
				<div class="header-body">
					<!-- Card stats -->
				</div>
			</div>
		</div>
		<div class="container-fluid mt--7">
			<!-- Table -->

			<!-- Dark table -->
			<div class="row mt-5">
				<div class="col">
					<div class="card bg-default shadow">
						<div class="card-header bg-transparent border-0">
							<h3 class="text-white mb-0">Books Borrowed</h3>
						</div>
						<div class="table-responsive">
							<table class="table align-items-center table-dark table-flush">
								<%
									try {
										Class.forName("com.mysql.jdbc.Driver");
										Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3307/sl1_mini",
												"root", "12345678");
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery(
												"select b.book_name,bb.issue_date,bb.return_date,bb.quantity from books as b,books_borrowed as bb where b.book_id = bb.book_id;");
								%>
								<thead class="thead-dark">
									<tr>
										<th scope="col">Book Name</th>
										<th scope="col">Issue Date</th>
										<th scope="col">Return Date</th>
										<th scope="col">Quantity</th>
										<th scope="col">Fine</th>
									</tr>
								</thead>
								<tbody>
									<%
										while (rs.next()) {
									%>
									<tr>
										<td><%=rs.getString(1)%></td>
										<td><%=rs.getString(2)%></td>
										<td><%=rs.getString(3)%></td>
										<td><%=rs.getInt(4)%></td>
										<td>
											<%
												Date date = new Date();
														String d = rs.getString(3);
														Date d1 = new SimpleDateFormat("yyy-MM-dd").parse(d);
														long diff = date.getTime() - d1.getTime();
														long diffDays = diff / (24 * 60 * 60 * 1000);
														diffDays = diffDays * 10;
														if (diffDays < 0) {
															diffDays = 0;
														}
											%> <%=diffDays%>
										</td>

									</tr>
									<%
										}
									%>
								</tbody>
							</table>
							<%
								} catch (Exception e) {
									out.print(e.getMessage());
								}
							%>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<footer class="footer"> </footer>
		</div>
	</div>
	<!--   Core   -->
	<script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script
		src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<!--   Argon JS   -->
	<script src="./assets/js/argon-dashboard.min.js?v=1.1.0"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
</body>

</html>