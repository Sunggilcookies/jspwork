<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String userId = request.getParameter("userid");
	String userPw = request.getParameter("passwd");
	
	if(userId.equals("today") && userPw.equals("2023")) {
		session.setAttribute("userId", userId); //아이디 세션 발급
		session.setAttribute("userPw", userPw); //비밀번호 세션 발급
		/* out.println("로그인을 성공했습니다."); */
	}else{
		out.println("<script>");
		out.println("alert('아이디나 비밀번호를 확인해 주세요')");
		out.println("history.go(-1)"); //이전 페이지로 이동
		
		out.println("</script>");
	}


%>
<!-- 세션 이름 가져오기  -->

<p><%=session.getAttribute("userId")%>님이 접속한상태입니다.</p>