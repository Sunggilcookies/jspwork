<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTTP headers 정보</title>
</head>
<body>
<%
	//내 컴퓨터(로컬 컴퓨터)
	String hostValue = request.getHeader("host");

	//언어
	String alValue = request.getHeader("accept-language");

	/* out.println("호스트명 : " + hostValue + "<br>");
	out.println("설정된 언어 : " + alValue + "<br>"); */
	
	//모든 header 정보 가져오기
	// 반복자 클래스 객체 얻기(생성)
	Enumeration<String> en = request.getHeaderNames();
	while(en.hasMoreElements()){ //더많은 요소가 있다면
		String headerName = en.nextElement(); //다음 요소를 가져와서 headerName에 저장
		String headerValue = request.getHeader(headerName); //headerValue키밸류 미를 매게로 값을 가져온다.
		out.println(headerName + ":" + headerValue + "<br>");
		
	}
	
	
%>
</body>
</html>






