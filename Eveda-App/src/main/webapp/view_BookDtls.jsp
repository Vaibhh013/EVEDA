<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.*"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Book Details</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: url("img/book.jpg") no-repeat center center fixed;
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
	-webkit-backdrop-filter: blur(10px);
	border: none;
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
	border-radius: 12px;
	color: #fff;
}

.card:hover {
	transform: scale(1.02); /* subtle zoom on hover */
	background: rgba(255, 255, 255, 0.2); /* slightly brighter on hover */
}
</style>
</head>
<body>
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container-fluid">
		<h3 class="text-center">Book Details</h3>
		<br>
		<div class="row">
			<%
			int bid=Integer.parseInt(request.getParameter("bid"));
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnect());
			BookDtls b= dao.getBookById(bid);
			%>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body text-center">
						<img src="book/<%=b.getPhoto() %>" alt=""
							style="width: 150px; height: 200px;" class="img-thumblin"><br>
						<br>
						<p>Book Name: <%=b.getBookName() %></p>
						<p>Author: <%=b.getAuthor() %></p>
						<p>Categories: <%=b.getBookCategory() %></p>
					</div>
				</div>
			</div>


			<div class="col-md-6">
				<div class="card">
					<br>
					<h2 class="text-center">
						<U><%=b.getBookName() %></U>
					</h2>
					<div class="card-body text-center row">
						<br>
						<div class="col-md-4 text-success text-success p-2">
							<i class="fa-solid fa-money-bill-wave fa-2x"></i> <br>
							<br>
							<p style="color: white">
								<B>Cash on Delivery</B>
							</p>
						</div>
						<div class="col-md-4 text-success text-success p-2">
							<i class="fa-solid fa-rotate-left fa-2x"></i> <br>
							<br>
							<p style="color: white">
								<B>Return Available</B>
							</p>
						</div>
						<div class="col-md-4 text-success text-success p-2">
							<i class="fa-solid fa-truck-moving fa-2x"></i> <br>
							<br>
							<p style="color: white">
								<B>Free Delivery</B>
							</p>
						</div>
					</div>
					<div class="text-center">
						<a href="" class="btn btn-danger btn-sm ml-2"><i
							class="fa-solid fa-cart-shopping"></i> Add to cart</a> <a href=""
							class="btn btn-success btn-sm ml-1"><i
							class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice() %></a>
					</div>
					<br><br><br><br><br>
				</div>
			</div>
		</div>
		<br> <br> <br> <br>
		<%@include file="allComponent/footer.jsp"%>
</body>
</html>