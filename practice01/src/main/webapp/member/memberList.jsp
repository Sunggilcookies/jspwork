<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href=resources/css/style.css>
</head>
<body>
<div id="container">
	<session id="memberlist">
	<h2>회원 목록입니다.</h2>
	<table id ="member list">
		<thead>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>가입일</th>
			</tr>				
		</thead>
		<tbody>
			<c:forEach var="member" items="${memberList}">
				<tr>
					<td><a href="/memberView.do?memberId=${member.memberId}">
					<c:out value="${member.memberId}" /></a></td>
				</tr>
				<tr>
					<td><c:out value="${nam}" /></td>
				</tr>			
			</c:forEach>		
		</tbody>
	
	</table>
	
	
	
	
	</session>
</div>
</body>
</html>