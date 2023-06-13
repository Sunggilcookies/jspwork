package product;
// 클래스 생성
public class Product {
	
	// 프로퍼티(맴버변수)에 직접 접근할수없게 private로 선언
	private String[] productList = {"수박", "참외", "포도"};
	private int num1 =10;
	private int num2 =20;
	
	//getter setter 메서드 맴버변수를 다른 페이지에서 불러올수있게함
	// 변수 수정은 하지 않을거라 set은 안넣었음 
	//	다른영역에서 getProductList()를 호출하면 productList변수 반환
	
	public String[] getProductList() {
		return productList;
	}
	
	public int getNum1( ) {
			return num1;
	}
	
	public int getNum2( ) {
		return num2;
	}
	
	
	
	
	
	
}
