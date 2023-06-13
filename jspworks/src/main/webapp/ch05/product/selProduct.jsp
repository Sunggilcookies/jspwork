<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 선택 결과</title>
<style>
	#container{width: 80%; margin: 30px auto; text-align: center;}
	select{padding: 5px;}
</style>
</head>
<!-- product패키지의 Prodcut클래스 속성을 "product" id로 사용함-->
<jsp:useBean id="product" class="product.Product"/>
<body>
	<div id="container">
		<h2>상품 선택 결과</h2>
		<hr>
		<!-- param은 post요청의 <body>에서 select의 매개변수값을 가져온다.  
			예를들면 상품목록페이지에서 action을 이페이지로 하고 post요청을 했기때문에
			select 결과값을 가져옵니다.-->
		<p>1. 선택한 상품은 ${param.select}
		<p>2. num1 + num2 = ${product.num1 + product.num2}</p>
	
	
	</div>


</body>
</html>