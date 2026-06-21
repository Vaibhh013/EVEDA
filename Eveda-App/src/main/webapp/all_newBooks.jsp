<%@page import="com.entity.Users"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.*"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Books</title>
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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>

	<c:if test="${not empty addCart}">

		<div id="toast">${addCart}</div>

		<script type="text/javascript">
			showToast('${addCart}');

			function showToast(content) {
	            const toast = document.getElementById("toast");
	            if (toast) {
	                toast.classList.add("display");
	                toast.innerHTML = content;
	                
	                setTimeout(function() {
	                    toast.classList.remove("display");
	                }, 2000);
	            }
	        }
		</script>

	</c:if>


	<%@include file="allComponent/navbar.jsp"%>
	<!-- 
	Users u = (Users) session.getAttribute("userObj"); -- this is shifted to allComponent/navbar.jsp
 	-->
	<!-- start recent book -->
	<div class="container-fluid">
		<h3 class="text-center">New Books</h3>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnect());
			List<BookDtls> list = dao.getAllNewBooks();
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
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Add cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
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

			<!-- end recent book -->
			<%@include file="allComponent/footer.jsp"%>
</body>
</html>