package beans;

import java.io.Serializable;


//인터페이스 Serializble(직렬화 - 현재 객체의 상태를 자체를 저장)
public class MemberBean implements Serializable{

	/**
	 * 
	 */
	//버전 id
	private static final long serialVersionUID = 1L;
	// 1L = long 1 버전
	
	//필드
	private int id =  2023101;
	private String name = "장그레"; 
		
	//생성자 생성
	public MemberBean() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	} 
	

}
