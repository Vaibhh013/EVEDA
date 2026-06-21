<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Old Books</title>
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
					<h3 class="text-center text-primary p-1">Sell Old Books</h3>
					<br>
						<form action="" method="post" enctype="multipart/form-data">
								<div class="form-group">
								    <label for="SellBookName" class="form-label">Book Name</label>
								    <input type="text" class="form-control" id="SellBookName" placeholder="Book Name" required>
								</div>
								<br>
								<div class="form-group">
								    <label for="SellAuthorName" class="form-label">Author Name</label>
								    <input type="text" class="form-control" id="SellAuthorName" placeholder="Author Name" required>
								</div>							
								<br>
							<div class="form-group">
								<label for="SellBookPrice" class="form-label">Selling Price</label>
								<input type="Number" class="form-control" id="SellBookPrice" placeholder="Selling Price" required>
							</div>
							<br>
							<div class="form-group">
								<label for="SellPhotoUpload" class="form-label">Upload
									Photo:</label> <input type="file" class="form-control-file" id="SellPhotoUpload"
									name="SellPhotoUpload" required>
							</div>
							<br>

							<div class="text-center">
								<button type="submit" class="btn btn-primary mb-2">Sell</button>
							</div>
							
							
						</form>
					</div>
				</div>
			</div>
		</div>	
	</div>
		
</body>
</html>