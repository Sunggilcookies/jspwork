<!-- 오류사항 수정 1. result 의calc.calculate() 값을 받아오는 과정에서
	getProperty 가 아닌 set으로 오타했음 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="calc" class="beans.Calculator"/>

<jsp:setProperty property="num1" name="calc"/>
<!-- num1은 setNum1()과 같음 -->
<jsp:setProperty property="num2" name="calc"/>
<jsp:setProperty property="op" name="calc"/>

<link rel="stylesheet" href="../resources\css\style.css">
<div id="container">
	<h2>계산기</h2>
	<hr>
	<%
		calc.calculate();
	%>
	<!-- result는 getResult()와 같음 -->
	<p>계산결과: <jsp:getProperty property="result" name="calc"/></p>
</div>