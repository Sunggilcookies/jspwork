<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 인코딩
	request.setCharacterEncoding("utf-8");
	
	String realFolder = "C:/green_project/jspworks/jspworks/src/main/webapp/upload";
	//MultipartRequest 개게 생성
	MultipartRequest multi = new MultipartRequest(request, realFolder,
			5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	
	// 요청 파라미터중에 name 속성 처리(Enumeration 클래스 사용)
	Enumeration<String> params= multi.getParameterNames();
	while(params.hasMoreElements()){
			String name=params.nextElement();// 다음 name 속성이 있으면 가져와서 할당
			String value = multi.getParameter(name);// name이 속성이 있다면 배개로 값을 할당
			out.println(name+"="+value+"<br>");
	}
	
	
	// 요청 파라미터 fileName 속성 처리(Enumeratio 클래스 사용))
	//Enumeration<String> params= multi.getParameteNames;
	Enumeration<String> files= multi.getFileNames();
	while(files.hasMoreElements()){
			String name = files.nextElement();// 다음 name 속성이 있으면 가져와서 할당
			String fileName = multi.getFilesystemName(name);// 서버에 업로드할 파일 
			String originFile = multi.getOriginalFileName(name); //원본 파일이름
			
			out.println("요청 파라미터 이름: " + name + "<br>");
			out.println("저장 (업로드) 파일이름: " + fileName + "<br>");
			out.println("실제 원본 이름: " + originFile + "<br>");
			
			
	
	
	
	
%>
<p>이미지보기</p>
<img src="../upload/<%= fileName %>">
<% } %>



