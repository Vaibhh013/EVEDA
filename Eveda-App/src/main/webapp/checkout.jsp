<%@page import="org.apache.catalina.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.DAO.cartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Details</title>
<%@include file="allComponent/allCss.jsp" %>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="allComponent/navbar.jsp" %>
	
	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">
		  ${succMsg }
		  <c:remove var="succMsg" scope="session"/>
		</div>
	</c:if>
	
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger" role="alert">
		   ${failedMsg }
		  <c:remove var="failedMsg" scope="session"/>
		</div>
	</c:if>
	
	<div class="container-fluid mt-5">
		<div class="row p-2">
			<div class="col-md-4">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<br>
						<table class="table table-striped">
							  <thead>
							    <tr>
							      <th scope="col">Book Name</th>
							      <th scope="col">Author</th>
							      <th scope="col">Price</th>
							      <th scope="col">Action</th>
							    </tr>
							  </thead>
							 <tbody class="table-group-divider">
							    <% 
							        Users user = (Users) session.getAttribute("userObj");
							        cartDAOImpl cartDaoImpl = new cartDAOImpl(DBConnect.getConnect());
							        List<Cart> cart = cartDaoImpl.getBookByUserId(user.getId());
							        
							        Double totalPrice = 0.00; // Initialize total
							        
							        for(Cart c : cart) {
							            totalPrice += c.getPrice(); // Accumulate price
							    %>
			
							        <tr>
							            <td><%=c.getBookName() %></td>
							            <td><%=c.getAuthor() %></td>
							            <td><%=c.getPrice() %></td>
							            <td>
							                <a href="remove_book?bid=<%= c.getBookId() %>&uid=<%= c.getUserId() %>" 
							                   class="btn btn-sm btn-danger">Remove</a>
							            </td>
							        </tr>
							    <% 
							        } 
							    %>
							    
							    <tr class="table-info" style="font-weight: bold;">
							        <td>Total Price</td>
							        <td></td>
							        <td></td>
							        <td>₹ <%=totalPrice %></td>
							    </tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="col-md-8">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Order Details</h3>
						<br>
						<form>
							<div class="row g-3">
								<div class="form-group col-md-6">
								    <label for="CartDetailsName" class="form-label">Name</label>
								    <input type="text" class="form-control" id="CartDetailsName" value="<%= user.getName() %>" disabled="disabled">
								</div>
								<div class="form-group col-md-6">
								    <label for="CartDetailsEmail" class="form-label">Email</label>
								    <input type="email" class="form-control" id="CartDetailsEmail" value="<%= user.getEmail() %>" disabled="disabled">
								</div>
							</div>
							
							<div class="row g-3">
								<div class="form-group col-md-6">
								    <label for="CartDetailsPhnNo" class="form-label">Phone No.</label>
								    <input type="number" class="form-control" id="CartDetailsPhnNo" value="<%= user.getPhoneno() %>" disabled="disabled">
								</div>
								<div class="form-group col-md-6">
								    <label for="CartDetailsAddress" class="form-label">Address</label>
								    <input type="text" class="form-control" id="CartDetailsAddress" value="<%= user.getAddress() %>">
								</div>
							</div>
							
							<div class="row g-3">
								<div class="form-group col-md-6">
								    <label for="CartDetailsLandmark" class="form-label">Landmark</label>
								    <input type="text" class="form-control" id="CartDetailsLandmark" value="<%= user.getLandmark() %>">
								</div>
								<div class="form-group col-md-6">
								    <label for="CartDetailsCity" class="form-label">City</label>
								    <input type="text" class="form-control" id="CartDetailsCity" value="<%= user.getCity() %>">
								</div>
							</div>
							
							
							<div class="row g-3">
								<div class="form-group col-md-6">
								    <label for="CartDetailsState" class="form-label">State</label>
								    <input type="text" class="form-control" id="CartDetailsState" value="<%= user.getState() %>">
								</div>
								<div class="form-group col-md-6">
								    <label for="CartDetailsPinCode" class="form-label">Pin Code</label>
								    <input type="number" class="form-control" id="CartDetailsPinCode" value="<%= user.getPincode() %>">
								</div>
							</div>
							
							<div class="form-group col-md-6">
								<label for="CartDetailsPayMode" class="form-label">Payment Mode</label>
								<select class="form-control">
									<option>--Select--</option>
									<option>Cash On Delivery</option>
								</select>
							</div>
							
							<br>
							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>