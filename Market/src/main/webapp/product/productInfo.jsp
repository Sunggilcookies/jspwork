<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
	function addToCart(){
		window.location.href="/addCart.do?productId=${product.productId}";
		if(confirm('상품이 추가되었습니다\n장바구니로 이동하시겠습니까?')){
			//window.location.href="/cart.do";
			
		}else{
			event.preventDefault();
			return false;
			
		}
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container my-4">
		<h3 class="text-left mx-4 my-4">상품 정보</h3>
		<div class="row mx-5" align="center">
			<div class="col-5">
				<img src="./upload/${product.productImage}" style="width:100%">
			</div>
			<div class="col-6">
				<h3>${product.pname}</h3>
				<p>${product.description}
				<p><b>상품 코드:</b> <span class="badge bg-dark">${product.productId}</span>
				<p><b>제조사:</b> ${product.manufacturer}
				<p><b>분류:</b> ${product.category}
				<p><b>재고수:</b> ${product.unitsInStock}
				<p>${product.unitPrice}원
				<p>
					<form action="/cart.do" method="post" name="addForm">
						<input type="submit" onclick="addToCart()" class="btn btn-info" value="구매">
						<!-- <a href="#" onclick="addToCart()" class="btn btn-info">상품 주문</a> -->
					<!-- 	<a href="/cart.do" class="btn btn-warning">장바구니</a> -->
						<a href="/productList.do" 
					       class="btn btn-secondary">상품 목록 &raquo; </a>
				   </form>
				</p>
			</div>
		</div>
	</div>
</body>
</html>