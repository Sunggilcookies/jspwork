<!-- 따움표 잘 확인할것 . -->
<%@ page import="beans.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="login" class="beans.LoginBean"></jsp:useBean>
<jsp:setProperty property="userid" name="login"/>
<jsp:setProperty property="passwd" name="login"/> --%>
<%
	// 폼에 입력된 데이터 가져오기
	String uid = request.getParameter("userid");
	String pwd = request.getParameter("passwd");

	//logiin 객체 생성
  	LoginBean login= new LoginBean();
	login.setUserid(uid);
	login.setPasswd(pwd);
	//chwckUswe() 호출
	boolean result = login.checkUser();

	if(result){
		out.println(login.getUserid()+"환영합니다.");
	
	}else{
		out.println("아이디나 비밀번호를 확인해주세요");
	}
%>


<p>아이디:</p>
<p>비밀번호: </p>

