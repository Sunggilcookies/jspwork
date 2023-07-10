<!--  1.문제점 함수에 괄호 안 붙임  2. form에 name 안 넣음-->
<!-- input 상자의 id속성은 스크립트에서 쓰이고 name 속성은 servent에서 사용 ex:request.getParameter -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="resources/css/style.css">

<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script type="text/javascript">
 function checkId(){
 
 	let memberId = $('#memberId').val();
 	if(memberId === ""){
 		alert("아이디를 입력해주세요");
 		return false;
 	}
 		$.ajax({
 			type: "post", //post 보안
 			url: "http://localhost:8080/checkid",
 			dataType: "text",
 			data: {id: memberId}, //서블릿으로 id를 보냄
 			success: function(data){
 			
 				if($.trim(data) == 'useable' && (memberId.length >= 4 && 15 >= memberId.length)){ //trim()은 앞뒤 공백 제거(필수)
 					$('#btnChk').attr('value','Y');
 					$('#check').text("사용가능한 id 입니다")
 					.css({"color":"blue"});
 				}else{
 					$('#check').text("사용할수없는 id 입니다")
 					.css({"color":"blue"});
 				};
 			},
 			error: function(){
 				alert("에러 발생!");
 			}
 		});
 }
 function checkMember(){
		
		let form = document.member;
		let id = form.memberId.value;
		let pw1 = form.passwd1.value;
		let pw2= form.passwd2.value;
		let name = form.name.value;
		let btnChk = form.btnChk.value; // Y or N
		//정규 표현식
		let pw_pat1 = /[0-9]+/	//숫자만
		let pw_pat2 = /[a-zA-Z]+/	//영어만
		let pw_pat3 = /[~!@#$%^&*()_+=]+/	//특수문자만
	
		if(id.length < 4 || id.length > 15){
			alert("아이디는 4~15자까지 입력 가능합니다.");
			
			return false;
		}else if(pw1.length < 8 || !pw_pat1.test(pw1) ||
				!pw_pat2.test(pw1) || !pw_pat3.test(pw1)){
			alert("비밀번호는 영문자, 숫자, 특수문자 포함 8자 이상입니다.")	
			
			return false;
		}else if(pw1 != pw2) {
			alert("비밀번호가 일치하지 않습니다.")
			form.passwd2.select();
			return false;
		
			//특수기호 숫자 제외
		}else if(name==""||pw_pat3.test(name) || pw_pat1.test(name)){
				alert("이름은 한글만 입력해주세요");
				form.name.select();
				return false;
			
		}else if(btnChk == 'N'){
			alert('아이디 중복을 확인해주세요.');
			
		
		}else{
			form.submit();
		}
	}

</script>
 <script src="../resources/js/validation.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"/>
   <div id="container">
      <section id="register">
         <h2>회원 가입</h2>
         <form action="addMember.do" method="post" name="member">
            <fieldset>
               <ul>
                  <li>
                     <label for="memberId">아이디 </label>
                     <input type="text" id="memberId" name="memberId"
                     	placeholder="아이디는 4~15자 입력 가능합니다.">
                     <button type="button" onclick="checkId()"
                     id="btnChk" value="N" class="btn_check">ID 중복</button>
                     <p id="check"></p>
                  </li>
                  <li>
                     <label for="passwd1">비밀번호</label>
                     <input type="password" id="passwd1" name="passwd1"
                      placeholder="비밀번호는 영문자, 숫자, 특수문자 포함 8자 이상입니다.">
                  </li>
                  <li>
                     <label for="passwd2">비밀번호 확인</label>
                     <input type="password" id="passwd2" name="passwd2"
                     placeholder="같은 비밀번호를 입력해주세요">
                  </li>
                  <li>
                     <label for="name">이름 </label>
                     <input type="text" id="name" name="name" 
                     placeholder="한글과 영어를 입력해주세요.">
                  </li>
                  <li>
                     <label for="gender">성별</label>
                     <label class="radio">
                        <input type="radio" name="gender" value="남" checked>남   
                     </label>
                     <label class="radio">
                        <input type="radio" name="gender" value="여">여
                     </label>               
                  </li>                  
               </ul>
            </fieldset>
            <div class="button">
               <input type="button" value="가입하기" onclick="checkMember()">
               <input type="reset" value="다시쓰기">
            </div>
         </form>
      </section>
   </div>
   <jsp:include page="../footer.jsp"/>
  
</body>
</html>