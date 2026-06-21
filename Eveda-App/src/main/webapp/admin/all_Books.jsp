<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
	<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
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

td, th{
	color: white;
	
}
</style>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="navbar.jsp"%><br>
	<h3 class="text-center mb-3x">Hello Sanjeev....</h3>
	<br>
	<c:if test="${not empty succMsg}">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg}">
		<p class="text-center text-danger">${failedMsg}</p>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<table class="table table-striped">
		<thead class="bg-primary text-white text-center">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Book Name</th>
				<th scope="col">Book Reference</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Reported By</th>
				<th scope="col">Book Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody class="text-center">
			<%
                    BookDAOImpl bookDAO = new BookDAOImpl(DBConnect.getConnect());
                    List<BookDtls> list = bookDAO.getAllBooks();

                    if (list != null && !list.isEmpty()) {
                        for (BookDtls b : list) {
                %>
			<tr>
				<td><%= b.getBookId() %></td>
				<td><%= b.getBookName() %></td>
				<td><img src="../book/<%= b.getPhoto() %>"
					style="width: 50px; height: 50px"></td>
				<td><%= b.getAuthor() %></td>
				<td><%= b.getPrice() %></td>
				<td><%= b.getUserEmail() %></td>
				<td><%= b.getBookCategory() %></td>
				<td><%= b.getStatus() %></td>
				<td><a href="edit_Books.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-warning"><i class="fa-solid fa-pen-to-square"></i> Edit</a> 
					<a href="../delete?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a></td>
			</tr>
			<%
                        }
                    } else {
                %>
			<tr>
				<td colspan="9" class="text-center text-danger">No books found.</td>
			</tr>
			<%
                    }
                %>
		</tbody>
	</table>

</body>
</html>