<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
	<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eveda: Login Page</title>
<%@include file="allCss.jsp" %>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background: url("book.jpg") no-repeat center center fixed;
	background-size: cover;
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
<%@include file="navbar.jsp" %>
	<div class="conntainer mt-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                    	<h4 class="text-center mb-3">Eveda Login Page</h4>
                    	<c:if test="${not empty failedMsg}">
	                        <p class="text-center text-danger">${failedMsg}</p>
	                        <c:remove var="failedMsg" scope="session"/>
	                    </c:if>
	                    <c:if test="${not empty succMsg}">
	                        <p class="text-center text-success">${succMsg}</p>
	                        <c:remove var="succMsg" scope="session"/>
	                    </c:if>
                        <form action="login" method="post">                            
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Email:</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email" required="required" name="email">
                            </div>
                            
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Enter Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password" required="required" name="password">
                            </div>
                            
                            <div class="text-center">
	                            <button type="submit" class="btn btn-primary mb-2">Submit</button>
	                            <br>
	                            <a href="register.jsp">Create Account</a>
                            </div>
                            </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <br><br><br><br><br><br><br>
     
    <%@include file="footer.jsp" %>
</body>
</html>