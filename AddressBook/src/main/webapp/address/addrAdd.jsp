<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<title>주소 추가</title>
<link rel="stylesheet" href="../resource/css/style.css">
<jsp:useBean id="aB" class="address.AddrBook"/>
<jsp:setProperty property="username" name="aB"/>
<jsp:setProperty property="tel" name="aB"/>
<jsp:setProperty property="email" name="aB"/>
<jsp:setProperty property="gender" name="aB"/>
<jsp:useBean id="abDAO" class="address.AddrBookDAO" scope="application"/>
<%
	//ArrayList에 ab(주소) 객체 삽입(추가)
	abDAO.add(aB); //useBean에 adDAO로 접근해서 id="aB"똑같이 객체변수로 선언
%>


<div id="container">
	<h2>등록 내용</h2>
	<hr>
	<p>이름:<%= aB.getUsername() %> </p>
	<p>전화번호:<%= aB.getTel() %> </p>
	<p>이메일:<%= aB.getEmail() %> </p>
	<p>성별:<%= aB.getGender() %> </p>
	<hr>
	<a href="addrList.jsp">목록 보기</a>
</div>    