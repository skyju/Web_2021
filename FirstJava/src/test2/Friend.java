package test2;

public class Friend {
	String name;
	String phoneNumber;
	String address;
	
	public Friend(String name, String phoneNumber, String address) {
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.address = address;
	}
	
	public void showData() {
		System.out.println("이   름: "+this.name);
		System.out.println("전화 번호: "+this.phoneNumber);
		System.out.println("주   소: "+this.address);
	}
	
	public void showBasicInfo() {}
}
