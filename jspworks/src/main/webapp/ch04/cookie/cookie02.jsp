<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠기 가죠오기
	Cookie[] cookies = request.getCookies();
	out.println("현재 설정된 쿠키으 ㅣ개수=>" + cookies.length+"<br>");
	out.print("++++++++++++++++++++++++++++++++++++++++++++++++<br>");
	
	for(int i=0; i<cookies.length;i++){
		out.println("쿠키이름:"+cookies[i].getName()+"<br>");
		out.println("쿠키 값:"+cookies[i].getValue()+"<br>");
		out.print("++++++++++++++++++++++++++++++++++++++++++++++++<br>");
	}
%>
