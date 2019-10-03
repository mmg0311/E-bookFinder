<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<!DOCTYPE html >

<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>E-book Finder</title>
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
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<body class="">
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
			<a class="navbar-brand pt-0" href=""> <img
				src="./assets/img/brand/blue.png" class="navbar-brand-img" alt="...">
			</a>

			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Collapse header -->
				<div class="navbar-collapse-header d-md-none">
					<div class="row">
						<div class="col-6 collapse-brand">
							<a href=""> <img src="./assets/img/brand/blue.png">
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

				<!-- Navigation -->
				<ul class="navbar-nav">
					<li class="nav-item  active"><a class=" nav-link active "
						href=""> <i class="ni ni-tv-2 text-primary"></i> Dashboard
					</a></li>

					<li class="nav-item"><a class="nav-link" href="login.jsp">
							<i class="ni ni-key-25 text-info"></i> Login
					</a></li>
				</ul>

			</div>
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
					href="">Dashboard</a>

			</div>
		</nav>
		<!-- End Navbar -->
		<!-- Header -->
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
			<div class="container-fluid">
				<div class="header-body"></div>
			</div>
		</div>
		<div class="container-fluid mt--7">

			<div class="row mt-3">
				<div class="col-xl-12 mb-3 mb-xl-0">
					<div class="card shadow">
						<div class="card-header border-0">
							<div class="row align-items-center">
								<div class="col">
									<h3 class="mb-0">Books present</h3>
								</div>
								<div class="col text-right">
									<form
										class="navbar-search  form-inline mr-3 d-none d-md-flex ml-lg-auto">
										<div class="form-group mb-0">
											<div class="input-group input-group-alternative">
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class="fas fa-search"></i></span>
												</div>
												<input class="form-control" id="myInput"
													placeholder="Search" type="text">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<!-- Projects table -->
							<%
								try {
									Class.forName("com.mysql.jdbc.Driver");
									Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3307/sl1_mini",
											"root", "12345678");
									Statement st = con.createStatement();
									ResultSet rs = st.executeQuery("select * from books;");
							%>
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th scope="col">Book Name</th>
										<th scope="col">Author</th>
										<th scope="col">Edition</th>
										<th scope="col">Available peices</th>
									</tr>
								</thead>
								<tbody id="myTable">
									<%
										while (rs.next()) {
									%>
									<tr>
										<td><%=rs.getString(2)%></td>
										<td><%=rs.getString(3)%></td>
										<td><%=rs.getInt(5)%></td>
										<td><%=rs.getInt(6)%></td>

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

	<!-- for searching books from table -->
	<script>
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myTable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>



	<!--   Core   -->
	<script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script
		src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<script src="./assets/js/plugins/chart.js/dist/Chart.min.js"></script>
	<script src="./assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
	<!--   Argon JS   -->
	<script src="./assets/js/argon-dashboard.min.js?v=1.1.0"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>

</body>
</html>