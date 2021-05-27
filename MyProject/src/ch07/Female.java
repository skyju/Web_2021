package ch07;

public class Female extends Person {
	
	private String hobby;
	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	
	public Female() {}
	public Female(String name, String idNum, String hobby) {
		super(name, idNum);
		this.hobby = hobby;
	}
	public Female(String name, String idNum) {
		super(name,idNum);
	}
	
	void hello() {
		super.hello();
		if(isSex()) {
			System.out.println("성별은 여성입니다.");
		}
		if(hobby != null) {
			System.out.println("취미는 "+getHobby()+"입니다.");
		}
	}
	
}
