<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="gugudan" class="gugudan.GuguBean"/>
<!--  xml 방식 -->
<h3>구구단 출력하기</h3>
<%

	int dan = Integer.parseInt(request.getParameter("dan"));

	//자바 클래스의 메서드 호출
	int[] result = gugudan.times(dan);
	
	for(int i=2;i<10;i++){
		out.println(dan+"x"+i+"="+result[i-1]+"<br>");
	}
%>