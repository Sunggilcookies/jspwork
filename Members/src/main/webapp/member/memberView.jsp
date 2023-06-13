<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
<jsp:include page="../header.jsp"/>
   <div id="container">
      <section id="detail">
         <h2>회원 정보</h2>
         <table>
         	<tbody>
         		<tr>	
         			<td><label>아이디</label></td>
         			<td><input type="text" name="memberId" value="${member.memberId}"></td>
         		</tr>
         		<tr>	
         			<td><label>비밀번호</label></td>
         			<td><input type="password" name="passwd" value="${member.passwd}"></td>
         		</tr>
         		<tr>	
         			<td><label>이름</label></td>
         			<td><input type="text" name="name" value="${member.name}"></td>
         		</tr>
         		<tr>	
         			<td><label>성별</label></td>
         			<td>
         				<c:if test="${member.gender eq '남'}">
         				<input type="radio" name="gender" value="남" checked readonly>남
         				<input type="radio" name="gender" value="여">여
         				</c:if>
         				
         				<c:if test="${member.gender eq '여' }">
         				<input type="radio" name="gender" value="남" >남
         				<input type="radio" name="gender" value="여" checked readonly>여
         				</c:if>
         				</td>
         		</tr>
         		<tr>
         			
         			<td><label>가입일</label></td>
         			<td>
         			<fmt:formatDate value="${member.joinDate}"
         				pattern="yyyy:MM:dd HH:mm:ss a" />
         			
         			</td>
         		</tr>
         		
         		<tr>	
         			<td colspan="2">
         			<a href="/memberList.do"><button type="button">목록</button></a></td>
         		</tr>
         	</tbody>
         </table>
      </section>
      <jsp:include page="../footer.jsp"/>
   </div>
</body>
</html>