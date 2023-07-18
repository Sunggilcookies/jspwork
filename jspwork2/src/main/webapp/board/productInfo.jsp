<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세페이지</title>
</head>
<body>
	<h3>상품 정보</h3>
	<hr>
	<ul>
		<li>${product.pid}</li>
		<li>${product.pname}</li>
		<li>${product.maker}</li>
		<li>${product.price}</li>
		<li>${product.date}</li>
	</ul>
</body>
</html>