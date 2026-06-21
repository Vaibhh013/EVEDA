<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="allComponent/allCss.jsp" %>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="allComponent/navbar.jsp" %>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<br>
					<h3 class="text-center text-primary p-1">Edit Profile Details</h3>
					<br>
						<form action="" method="post" enctype="multipart/form-data">
								<div class="form-group">
								    <label for="editName" class="form-label">Name</label>
								    <input type="text" class="form-control" id="editName" placeholder="Name" disabled>
								</div>
								<br>
								<div class="form-group">
								    <label for="editEmail" class="form-label">Email</label>
								    <input type="email" class="form-control" id="editEmail" placeholder="Email" disabled>
								</div>							
								<br>
							<div class="form-group">
								<label for="editPhnNo" class="form-label">Phone No.</label>
								<input type="Number" class="form-control" id="editPhnNo" placeholder="Phone No." disabled>
							</div>
							<br>
							
							<div class="form-group">
								<label for="editPassword" class="form-label">Password</label>
								<input type="text" class="form-control" id="editPassword" placeholder="Password" required>
							</div>
							
							<br>

							<div class="text-center">
								<button type="submit" class="btn btn-primary mb-2">Update</button>
							</div>
							
							
						</form>
					</div>
				</div>
			</div>
		</div>	
	</div>
		
	
</body>
</html>