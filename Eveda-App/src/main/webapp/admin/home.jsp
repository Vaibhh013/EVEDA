<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eveda Admin Page</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: url("book.jpg") no-repeat center center fixed;
	background-size: cover;
	color: white;
}

body::before {
	content: "";
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.6); /* dark faded overlay */
	z-index: -1;
}

.card {
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(10px);
	-webkit-backdrop-filter: blur(10px); border : none;
	/* <— remove border entirely */ border-radius : 12px; color : #fff;
	box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.2);
	transition: transform 0.3s ease;
	-webkit-backdrop-filter: blur(10px);
	border: none; /* <— remove border entirely */
	border-radius: 12px;
	color: #fff;
	border: none; /* <— remove border entirely */
	border-radius: 12px;
	color: #fff;
}

.card:hover {
	transform: scale(1.02); /* subtle zoom on hover */
	background: rgba(255, 255, 255, 0.2); /* slightly brighter on hover */
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container" style="margin-top: 10%">
		<div class="row">

			<div class="col-md-3">
				<a href="all_Books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-center">
								<i class="fa-solid fa-book-open fa-3x text-primary"></i><br>
								<br>
								<h4>All Books</h4>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="add_Book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-center">
								<i class="fa-solid fa-circle-plus fa-3x text-success"></i><br>
								<br>
								<h4>Add Books</h4>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="admin_Order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-center">
								<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
								<br>
								<h4>Orders</h4>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<div class="text-center">
							<i class="fa-solid fa-car-side fa-3x text-danger"></i><br> <br>
							<h4>Transportation</h4>
						</div>
					</div>
				</div>
			</div>

		</div>

		<div class="container" style="margin-top: 5%">
			<div class="row">

				<div class="col-md-3">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-center">
								<i class="fa-solid fa-file-invoice-dollar fa-3x text-secondary"></i><br>
								<br>
								<h4>Accounts</h4>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-3">
					<a data-bs-toggle="modal" data-bs-target="#exampleModal">
						<div class="card">
							<div class="card-body text-center">
								<div class="text-center">
									<i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
									<br>
									<h4>Logout</h4>
								</div>
							</div>
						</div>
					</a>
				</div>

			</div>

			<!-- logout modal start -->
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"></h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="text-center">
							<div class="modal-body">
								<B>Do you want to Logout?</B>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<a href="../Logout" type="button" class="btn btn-primary">Logout</a>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- logout modal start -->
</body>
</html>