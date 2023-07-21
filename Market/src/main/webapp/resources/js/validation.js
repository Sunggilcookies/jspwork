/**로그인
 * 
 */function checkAddProduct(){
		let id = document.getElementById("productId");
		let name = document.getElementById("pname")
		let price = document.getElementById("unitPrice")
		let stock = document.getElementById("unitsInStock")
		//상품아이디 - 예)"p1234" P와 숫자를 조합하여 5~12자 입력함
		//정규 표현식
		//재고수
		let regExpId = /^P[0-9]{4,11}/
		if(!regExpId.test(id.value)) { //정규식에 부합하지 않으면
			alert("[상품코드]\대문자P와 숫자를 조합하여 5~12자 입력\n첫글자는 반드시 P로 시작하세요");
			id.focus();
			id.select();
			return false;
		}else if(name.value.length < 4 || name.value.length > 20){
			alert("[상품명]\n최소 4~20자까지 입력하세요");
			name.focus();
			name.select();
			return false;
		}else if(price.value.length == 0 || isNaN(price.value)){
			alert("[상품가격]\n숫자만 입력하세요");
			price.focus();
			price.select();
			return false;
		}else if(price.value<0){
			alert("[상품가격]\n음수는 입력불가입니다.");
			price.focus();
			price.select();
			return false;
		
			
		}else if(stock.value.length == 0 || isNaN(price.value)){
			alert("[재고수량]]\n숫자만 입력하세요");
			stock.focus();
			stock.select();
			return false;
		}else if(stock.value<0){
			alert("[재고수량]\n음수는 입력불가입니다.");
			stock.focus();
			stock.select();
			return false;
		
			
		}else{
			document.newProduct.submit();
		} 
			
	}