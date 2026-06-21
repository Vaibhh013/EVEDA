<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp">Home</a></li>
				</ul>
				<form class="d-flex">
					<button class="btn btn-outline-light me-2" type="submit">
						<i class="fa-solid fa-gears"></i> Settings
					</button>
					<button class="btn btn-outline-light me-2" type="submit">
						<i class="fa-solid fa-phone"></i> Contact Us
					</button>
				</form>
			</div>
		</div>
	</nav>
	
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f;">
	<div class="container-fluid p-3">
		<div class="row align-items-center">
			<div class="col-md-3">
				<h3>Eveda Admin Page</h3>
			</div>
			<div class="col-md-6">
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-primary my-2 my-sm-0" type="submit">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
			</div>

			<!--  <div class="col-md-3 text-end">
                <a href="login.jsp" class="btn btn-success me-2"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                <a href="register.jsp" class="btn btn-primary"><i class="fa-solid fa-address-card"></i> Register</a>
            </div>-->
			<div class="col-md-3 text-end">
				<c:if test="${userObj != null && userObj.name != null}">
					<a href="" class="btn btn-success me-2"><i
						class="fa-solid fa-address-card"></i> ${ userObj.name }</a>
					<a class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#exampleModal" class="btn btn-success me-2"><i
						class="fa-solid fa-right-to-bracket"></i> Logout</a>
				</c:if>
				<c:if test="${userObj.name == null}">
					<a href="../login.jsp" class="btn btn-success me-2"><i
						class="fa-solid fa-right-to-bracket"></i> Login</a>
					<a href="../register.jsp" class="btn btn-primary"><i
						class="fa-solid fa-address-card"></i> Register</a>
				</c:if>
				<!-- <h2 class="text-center">Ved Prakash & Sons</h2> -->
			</div>
		</div>
	</div>
</div>
<br><br>
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
				<div class="text-center" style="color: black;">
					<div class="modal-body"><B>Do you want to Logout?</B></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<a href="logOut.jsp" type="button" class="btn btn-primary">Logout</a>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- logout modal start -->


	