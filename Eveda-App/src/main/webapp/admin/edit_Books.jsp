<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
	<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Books</title>
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
</style>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="navbar.jsp"%>
	<div class="container" style="margin-top: 2%">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Book Details</h4>
						<br>
						
	                    <% 
	                    	int id = Integer.parseInt(request.getParameter("id"));
	                    	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnect());
	                    	BookDtls b=dao.getBookById(id);
	                    %>
	                    <br>
						<form action="../editBooks" method="post"  enctype="multipart/form-data" >
							<div class="form-group mb-3">
								<input type="hidden" name="bookId" value="<%=b.getBookId()%>">
									
								<label for="exampleBookName" class="form-label">Book
									Name:</label> <input type="text" class="form-control"
									id="exampleBookName" placeholder="Enter Book Name"
									required="required" name="bookName" value="<%=b.getBookName()%>">
							</div>

							<div class="form-group mb-3">
								<label for="exampleInputAuthor" class="form-label">Author:</label>
								<input type="text" class="form-control" id="exampleInputAuthor"
									placeholder="Enter Author" required="required" name="author" value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group mb-3">
								<label for="priceInput" class="form-label">Price:</label> <input
									type="number" class="form-control" id="priceInput"
									placeholder="Enter Price" name="price" required min="0"
									 value="<%=b.getPrice()%>" step="1" oninput="if(this.value < 0) this.value = ''">
							</div>


							<!--  <div class="form-group mb-3">
								<label for="bookCategory" class="form-label">Book
									Category:</label> <select type="text" class="form-control"
									id="bookCategory" placeholder="Enter Book Category"
									name="bookCategory"  value="<%=b.getBookCategory()%>" required>
									<option value="" selected>Select</option>
									<option value="New">New</option>
								</select>
							</div>-->

							
							

							<div class="form-group mb-3">
								<label for="bookStatus" class="form-label">Book Status:</label>
								<select type="text" class="form-control" id="bookCategory"
									placeholder="Enter Book Status" name="bookStatus" required>
									<option value="" <%= (b.getStatus() == null || b.getStatus().isEmpty()) ? "selected" : "" %>>Select</option>
									<option value="Active" <%= "Active".equals(b.getStatus()) ? "selected" : "" %>>Active</option>
									<option value="Inactive" <%= "Inactive".equals(b.getStatus()) ? "selected" : "" %>>Inactive</option>
								</select>
							</div>

							<!--<div class="form-group mb-3">
								<label for="photoUpload" class="form-label">Upload
									Photo:</label> <input type="file" class="form-control-file" id="photoUpload"
									name="photoUpload" required>
							</div>-->
							

							<div class="text-center">
								<button type="submit" class="btn btn-primary mb-2">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>