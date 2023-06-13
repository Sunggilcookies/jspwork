<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//아이디와 비밀번호를 받아와서 인증 처리 및 세션 발급
	String id = request.getParameter("userid");
	String pw = request.getParameter("passwd");
	
	if(id.equals("admin") && pw.equals("admin1234")){
		//세션발급 후에 welcome.jsp로 포워딩
		session.setAttribute("userid", id); //세션이름, 세션 값
	
		response.sendRedirect("welcome.jsp"); //welocme.jsp로 이동
		
	}else{
		out.println("아이디와 비밀번호가 일치하지 않습니다.");
	}
	


%>