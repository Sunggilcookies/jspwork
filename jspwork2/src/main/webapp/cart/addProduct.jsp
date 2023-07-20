<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//상품을 추가할 리스트(장바구니) 생성
	//리스트를 오브젝트로 다운캐스팅 형변환 
	//productList를 다른페이지에서도 get할수있게 session에 "cartList"란 이름으로 저장
	List<String> productList = (ArrayList)session.getAttribute("cartList");
	
	
	if(productList == null){
		productList = new ArrayList<>();
		session.setAttribute("cartList", productList);
	}
	String product = request.getParameter("product");
	//상품을 장바구니에 저장
	productList.add(product);


%>
<script>
	
	alert("<%=product %>가(이) 추가되었습니다.");
	history.go(-1); //뒤로가기

</script>