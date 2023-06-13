<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 쿼리 스트링 연습
    //cnt를 입력할 수 있는 코드
    // int cnt = Integer.parseInt(request.getParameter("cnt")); 오류남
    int cnt=0;
    if(request.getParameter("cnt") != null){ //객체이므로 null로 비교 //cnt이름인 값을 받아서 null이 아니면 
    	//cnt 값을 숫자로 변환하여서 cnt 에 저장
    	cnt = Integer.parseInt(request.getParameter("cnt"));
    }
    
    for(int i=1; i<=cnt; i++){
    	out.println("안녕 JSP");
    }
%>
<h3> 주소 표시줄에 ?cnt=숫자로 입력해 주세요</h3>