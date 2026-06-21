<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings</title>
<%@include file="allComponent/allCss.jsp" %>
<style type="text/css">
	a{
		text-decoration: none;
		color: black;
	}
	a hover{
		text-decoration: none;
	}
</style>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="allComponent/navbar.jsp" %>
	<div class="container">
	<h3 class="text-center">Hello, Vaibhav</h3>
		<div class="row p-5">
			<div class="col-md-6">
				<a href="sell_Book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-2x"></i>
							</div>
							<h3>Sell Old Books</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-6">
				<a href="edit_Profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-pen-to-square fa-3x"></i>
							</div>
							<h4>Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-3">
				<a href="user_Address.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-location-crosshairs fa-3x"></i>
							</div>
							<h3>Address</h3>
							<p>Edit Address</p>
						</div>
					</div>
				</a>
			</div>
			
			
			<div class="col-md-4 mt-3">
				<a href="">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h3>Track</h3>
							<p>Track your Order Details</p>
						</div>
					</div>
				</a>
			</div>
			
			
			<div class="col-md-4 mt-3">
				<a href="">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-user-circle fa-3x"></i>
							</div>
							<h3>Help Centre</h3>
							<p>Available 24/7 for customer services.</p>
						</div>
					</div>
				</a>
			</div>
			
		</div>
	</div>
	
	<br><br><br><br>
	 <%@include file="allComponent/footer.jsp" %>
</body>
</html>