<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<script type="text/javascript">
	function checkForm(){
		/* alert("testing"); */
		let form = document.loginForm;
		let userid = form.userid;
		let passwd = form.passwd;
		
		if(userid.value == ""){
			alert('아이디를 입력해 주세요');
			userid.focus();
			return false;
			
		}else if(passwd.value.length < 5){
			alert('비밀번호를 5자 이상 입력해 주세요');
			passwd.focus();
			return false;
		}else{
			form.submit(); //폼전송
		}
		
	}
</script>

</head>
<body>
	<form action="loginProcess2.jsp" method ="post" name="loginForm">
		<p>
			<label for="userid">아이디</label>
			<input type="text" id="userid" name ="userid">
		
		
		</p>
		<p>
			<label for="passwd">비밀번호</label>
			<input type="password" id="passwd" name="passwd">
		
		
		</p>
		<p><input type="submit" value="로그인" onclick="checkForm()"></p>
	
	
	
	
	
	</form>
</body>
</html>