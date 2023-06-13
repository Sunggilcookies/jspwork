<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<!-- 값 불러올때는 head와 body 사이에서 java,jsp열기 -->
<jsp:useBean id="product" class="product.Product"></jsp:useBean>

<!-- [jsp:usebean을 코드로 변환할경우]
	/* request 객체로부터 "product"라는 이름의 속성을 가져옵니다. 가져올때에 
	 속성에 저장된 값은 Object 타입이기때문에 (Product)를사용해 클래스 타입 으로
	 형변환을 해줍니다.
	가져온 product 속성값을 Product 클래스 타입의 변수인 product에 할당해줍니다.*/
	Product product = (Product)request.getAttribute("product");
	// 이전에 설정된 "product" 속성이 있는지를 검사합니다
	if(product == null){
	// product를 Product클래스의 객체로 초기화합니다. (이페이지에서 쓸수있게)
		product = new Product();
	//request객체에 "product"를 product 속성으로 저장해줍니다.
		request.setAttriube("product",product);
	}
	//결론 : Product클래스의 속성값을 product의 변수에 할당하고
		setAttriube를 통해 페이지에서 "product"라는 이름으로 사용하게함
		
  -->
<style>
	#container{width: 80%; margin: 30px auto; text-align: center;}
	select{padding: 5px;}
</style>
<body>
	<div id="container">
		<h2>상품목록</h2>
		<hr>
		<!-- form에서 submit이 일어나면 action -->
		<form action="selProduct.jsp" method="post">
			<select name="select">
			<%-- product.productList -> <%=product.getProductList() %> --%>
			<!-- 포이치문으로 반복될 배열이나 섹션 items로 지정-->
			<c:forEach var="product" items="${product.productList}">
			<option><c:out value="${product}"/></option>
			</c:forEach>		
			</select>
			<button type="submit">선택</button>
		</form>
	</div>
</body>
</html>