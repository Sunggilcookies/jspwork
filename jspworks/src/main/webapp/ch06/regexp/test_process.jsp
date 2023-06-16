<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정규 표현식 예제</title>
<script type="text/javascript">
	
	function checkMember() {

	let form = document.member;
	let id = form.id.value;
	let pw= form.passwd.value;
	let name = form.uname.value;
	let regExp = /^[a-zA-Z가-힣]/; 
		
	if(id==""){
		
		form.id.focus();
		alert("다시적어주세요")
		
	}else if(pw == ""){
		alert("비밀번호 입력해주세요");
		form.passwd.focus();
		return false;
	}else if(pw.search(id) > -1){
		alert("비밀번호는 아이디를 포함할수 없습니다.");
		form.passwd.focus();
		return false;	
	}else if(!regExp.text(uname)){
		alert("이름은 숫자로 시작할 수없습니다.");
		form.uname.select();
		return false;
		
	}else{
		form.submit();
	}
		
}
</script>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="test_process.jsp" method='post' name="member">
		<p>아이디 <input type="text" name="id"></p>
		<p>비밀번호 <input type="password" name="passwd"></p>
		<p>이름 <input type="text" name="uname"></p>
		<p>
		<button type="button" onclick="checkMember()">가입하기</button>
		</p>
	</form>
	
</body>
</html>