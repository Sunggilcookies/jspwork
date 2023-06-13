<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
	<form action="/member/login" method ="post">
	<ul>
		<li>
			<label for="userid">아이디</label>
			<input type="text" id="userid" name ="userid">
		</li>
		<li>
			<label for="passwd">비밀번호</label>
			<input type="password" id="passwd" name ="passwd">
		</li>
		<li>
			<label for="passwd2">비밀번호확인</label>
			<input type="password" id="passwd2" name ="passwd2">
		</li>
		<li>
			<label for="name">이름</label>
			<input type="text" id="name" name ="name">
		</li>
		<li>
			<label for="gender">성별</label>
			<label class="radio">
				<input type="radio" name="gender" value="남" checked>
			</label>
			<label class="radio">
				<input type="radio" name="gender" value="여" checked>
			</label>
		</li>
		
		
		
		</p>
		<p><input type="submit" value="로그인"></p>
	
	</ul>
	</form>
</body>
</html>