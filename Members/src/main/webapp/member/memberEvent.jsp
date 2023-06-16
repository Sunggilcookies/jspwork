<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행운의 추첨</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
<jsp:include page="../header.jsp"/>
<section id="goodluck">
	<div id="container">
		
        <h1>로또 번호 발표</h1>
        <div id="pic"><img src="../resources/images/lotto.jpg"></div>
       
        <button type="button" onclick="play()">추첨</button>
        
        <p id="display"></p>
       
      
     </div>
</section>
    <script>
    function play(){
        let name = ["강정현", "권지혜", "김민정", "김은효", "노승우", "성의석", "안재훈", "오화룡", "유성길"
            , "유세현", "윤기은", "이가은", "이경철", "이유진", "이진성", "조은별", "한주훈"]
        let numbers= new Array(5);
        
        console.log(name);

        
        for(let i=0;i < numbers.length; i++){
            let num = Math.floor(Math.random() * name.length);
            numbers[i] = num;

            //중복제거
            for(let j = 0; j<i;j++){
                if(numbers[j] == numbers[i]){
                    // console.log("중복 : " + numbers[i])
                    i--; //중복된 인덱스 삭제함
                }
            }
        }
        //numbers = [3,2,212,312,3,3]
        let winners = new Array(5);  //당첨자 이름을 저장할 배열 선언
        for(let i=0; i<winners.length; i++){
            winners[i] = name[numbers[i]];
        }
        //출력
       document.getElementById("display").innerHTML = winners;
    }
    </script>
    
    <jsp:include page="../footer.jsp"/>
</body>
</html>