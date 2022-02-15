package member.dto;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

public class MemberVO {
	//필드
	private String name;
	private String userid;
	private String pwd;
	private String email;
	private String address;
	private String phone;
	private String birth;
	private int grade;
	//default 생성자
	public MemberVO() {}
	//전체 필드를 초기화 full 생성자
	public MemberVO(String name, String userid, String pwd, String email, String address, String phone, String birth,
			int grade) {
		super();
		this.name = name;
		this.userid = userid;
		this.pwd = pwd;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.birth = birth;
		this.grade = grade;
	}

	//Getter/setter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}





}
