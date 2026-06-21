<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
	<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>user home</p>
	<c:if test="${not empty userObj}">
		<p class="text-center text-danger">Username: ${userObj.name}</p>
	</c:if>
</body>
</html>