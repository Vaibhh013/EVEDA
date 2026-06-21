<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Address</title>
<%@include file="allComponent/allCss.jsp" %>
</head>
<body style="background-color: #f7f7f7">
<%@include file="allComponent/navbar.jsp" %>
	
	<div class="container-fluid mt-5">
		<div class="row justify-content-center p-2">
			<div class="col-md-8">
				<div class="card">
					<div class="card-body">
					<br>
					<h3 class="text-center text-primary p-1">Add More Address</h3>
					<br>
						<form action="" method="post" enctype="multipart/form-data">
							<div class="row g-3">
								<div class="form-group col-md-6">
								    <label for="addUserAddress" class="form-label">Address</label>
								    <input type="text" class="form-control" id="addUserAddress" placeholder="Address">
								</div>
								<div class="form-group col-md-6">
								    <label for="addUserLandmark" class="form-label">Landmark</label>
								    <input type="text" class="form-control" id="addUserLandmark" placeholder="Landmark">
								</div>
							</div>
							<br>
							<div class="row g-3">
								<div class="form-group col-md-6">
								    <label for="addUserCity" class="form-label">City</label>
								    <input type="text" class="form-control" id="addUserCity" placeholder="City">
								</div>
								
								<div class="form-group col-md-6">
								    <label for="addUserState" class="form-label">State</label>
								    <input type="text" class="form-control" id="addUserState" placeholder="State">
								</div>
								
								
								<div class="form-group col-md-6">
								    <label for="addUserPincode" class="form-label">Pincode</label>
								    <input type="number" class="form-control" id="addUserPincode" placeholder="Pincode">
								</div>
							</div>
							<br>
							<div class="text-center">
								<button type="submit" class="btn btn-warning mb-2">Add</button>
							</div>
							
							
						</form>
					</div>
				</div>
			</div>
		</div>	
	</div>
		
</body>
</html>