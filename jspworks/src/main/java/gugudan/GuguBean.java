package gugudan;

public class GuguBean {
	//구구단 계산 각 값을 배열에 저장
	public int[] times(int dan) {
		int[] gugu = new int[19];// 배열 생성 정수형 배열 선언
		for(int i=1; i<gugu.length+1; i++) {
			gugu[i-1] = dan * i; //dan=2인경우 gugu[0] =2*1
		}
		
		return gugu; //배열로 반환(돌려줌)
		
	}
}
