<!-- jQuery .click() 에 click.()로 찍어버림 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제이 쿼리 예제</title>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('button').click(function(){ //익명함수
			$('#demo').html("<h2>jquery를 이용한 Ajax텟스트<h2>");
		
		});
		
	});

</script>
</head>
<body>
	<div id="demo">
		<h2> 버튼을 클릭하면 내용이 바뀝니다.</h2>	
	
	</div>
	<button type="button">수정</button>
</body>
</html>