<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//request.setCharacterEncoding("utf-8"); //한글 인코디
	String username = request.getParameter("username");

%>
<p>입력된 이름 : <%=username %></p>