<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//request.setCharacterEncoding("utf-8"); //한글 인코디
	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");
	
	

%>
<p>입력된 id 값 : <%=id %></p>
<p>입력된 passwd 값 : <%=pw %></p>