<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 출력</title>
</head>
<body>
	<h2>구구단 출력</h2>
	
	<%
		int dan = Integer.parseInt(request.getParameter("dan")) ;
	
		for(int i=2;i<10;i++){
			out.println(dan+"x"+i+"="+(dan*i)+"<br>");
		}
	
	%>
</body>
</html>