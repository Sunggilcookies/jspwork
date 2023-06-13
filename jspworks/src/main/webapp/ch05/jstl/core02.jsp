<!-- 오류: 1.score.focum에 괄호 뒤에 안넣음 
ㅡ2.<script>에 타입안넣었음 3.function 처리안함-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>학점 처리</title>
<script type = text/javascript>
	function checkStore(){
		let form = document.form1;
		let score = form.score;
		
		
		//점수를 입력하지 안핬거나 , 문자인경우 처리
		if(score.value == "" || isNaN(score.value) || score.value.replaceAll(" ","") == "" ){
			alert("숫자를 입력해주세요")
			score.focus();
			return false;
		}else if(score.value< 0 || score.value > 100){
			alert("값을 넘어섰습니다.");
			score.focus();
			return false;
		}else{
			form.submit();
		}
	}
</script>	

</head>
<body>
  <h3>점수를 입력해 주세요.</h3>
  <form action="scoreTest.jsp" method="get" name="form1">
  	<p>점수: <input type="text" name="score">
  			<button type="button" onclick="checkStore()">학점출력</button>
  	</p>
  </form>
</body>
</html>