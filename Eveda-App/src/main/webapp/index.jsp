<%@page import="com.entity.Users"%>
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
<title>Eveda</title>
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
	/* <— remove border entirely */
	border-radius: 12px;
	color: #fff;
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
<body>

	<%
		Users userObj = (Users) session.getAttribute("userObj");
	%>
	<%@include file="allComponent/navbar.jsp"%>

	<!-- 
	Users u = (Users) session.getAttribute("userObj"); -- this is shifted to allComponent/navbar.jsp
 	-->

	<div class="container-fluid text-white text-center py-5">
		<h1 class="display-4 fw-bold">Eveda Knowledge Centre</h1>
		<p class="lead">Find New, Old & Recent Books with Ease</p>
	</div>

	<!-- start recent book -->
	<div class="container-fluid">
		<h3 class="text-center">Recent Books</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConnect());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3 mb-4">
				<div class="card h-100">
					<div class="card-body text-center">
						<img src="book/<%=b.getPhoto()%>" alt="Book Image"
							style="width: 150px; height: 200px;" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="text-center" style="width: auto;">

							<%
							if (userObj == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Add cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Add cart</a>
							<%
							}
							%>

							<a href="view_BookDtls.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
			<div class="text-center mt-1">
				<a href="all_recentBooks.jsp"
					class="btn btn-danger btn-sm text-white">View All</a>
			</div>

			<!-- end recent book -->

			<!-- start new book -->
			<br> <br>
			<div class="container-fluid">
				<h3 class="text-center">New Books</h3>
				<div class="row">
					<%
					BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnect());
					List<BookDtls> list = dao.getNewBooks();
					for (BookDtls b : list) {
					%>
					<div class="col-md-3 mb-4">
						<div class="card h-100">
							<div class="card-body text-center">
								<img src="book/<%=b.getPhoto()%>" alt="Book Image"
									style="width: 150px; height: 200px;" class="img-thumbnail">
								<p><%=b.getBookName()%></p>
								<p><%=b.getAuthor()%></p>
								<p>
									Categories:
									<%=b.getBookCategory()%></p>
								<div class="text-center" style="width: auto;">
									<%
									if (userObj == null) {
									%>
									<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
										class="fa-solid fa-cart-shopping"></i> Add cart</a>
									<%
									} else {
									%>
									<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i
										class="fa-solid fa-cart-shopping"></i> Add cart</a>
									<%
									}
									%>
									<a href="view_BookDtls.jsp?bid=<%=b.getBookId()%>"
										class="btn btn-success btn-sm ml-1">View Details</a> <a
										href="" class="btn btn-danger btn-sm ml-1"><i
										class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
				<!-- end of .row -->
			</div>
			<div class="text-center mt-1">
				<a href="all_newBooks.jsp" class="btn btn-danger btn-sm text-white">View
					All</a>
			</div>

			<!-- end new book -->

			<!-- start Old book -->
			<br> <br>
			<div class="container-fluid">
				<h3 class="text-center">Old Books</h3>
				<div class="row">
					<%
					BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConnect());
					List<BookDtls> list3 = dao3.getOldBooks();
					for (BookDtls b : list3) {
					%>
					<div class="col-md-3 mb-4">
						<div class="card h-100">
							<div class="card-body text-center">
								<img src="book/<%=b.getPhoto()%>" alt="Book Image"
									style="width: 150px; height: 200px;" class="img-thumbnail">
								<p><%=b.getBookName()%></p>
								<p><%=b.getAuthor()%></p>
								<p>
									Categories:
									<%=b.getBookCategory()%></p>
								<div class="text-center" style="width: auto;">
									<%
									if (userObj == null) {
									%>
									<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
										class="fa-solid fa-cart-shopping"></i> Add cart</a>
									<%
									} else {
									%>
									<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2"><i
										class="fa-solid fa-cart-shopping"></i> Add cart</a>
									<%
									}
									%>
									<a href="view_BookDtls.jsp?bid=<%=b.getBookId()%>"
										class="btn btn-success btn-sm ml-1">View Details</a> <a
										href="" class="btn btn-danger btn-sm ml-1"><i
										class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
				<div class="text-center mt-1">
					<a href="all_oldBooks.jsp" class="btn btn-danger btn-sm text-white">View
						All</a>
				</div>
				<br>
				<!-- end old book -->
				<%@include file="allComponent/footer.jsp"%>
</body>
</html>