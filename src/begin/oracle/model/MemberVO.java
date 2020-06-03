package begin.oracle.model;

public class MemberVO {
	// VO(Value Object) == DTO(Data Transfer Object
	private String userid;	// 1
	private String passwd;
	private String name;
	private String email;
	private String gender; // char 쓰면 안됨
	private String[] interest;
	private String registerday; 
	private String introduce;
	
	public MemberVO () {}	// 3 기본생성자
	
	// 2 source에서 제너레이트
	public MemberVO(String userid, String passwd, String name, String email, String gender, String[] interest, String introduce) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.interest = interest;
		this.introduce = introduce;
	}
	
	// 3
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String[] getInterest() {
		return interest;
	}

	public void setInterest(String[] interest) {
		this.interest = interest;
	}
	
	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}
	
	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	// 겟터셋터해서 겟만하자! 읽어만올거니까!
	public String getRegisterday() {
		return registerday;
	}

	public String getSexual() {
		if("M".equalsIgnoreCase(gender)) 
			return "남자";
		else
			return "여자";
	}
	
	public String getAttention() {
		
		if(interest != null) {
			return String.join(",", interest);
		}
		else {
			return "없음";
		}
	}
	
	
}
