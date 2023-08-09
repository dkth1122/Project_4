package com.example.project.model;

public class Event {
	//응모
	private String uId;
	private String eName;
	private String eNo;
	private String pNo;
	private String eUname;
	private String eUphone;
	private char eYn;
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public String geteNo() {
		return eNo;
	}
	public void seteNo(String eNo) {
		this.eNo = eNo;
	}
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public String geteUname() {
		return eUname;
	}
	public void seteUname(String eUname) {
		this.eUname = eUname;
	}
	public String geteUphone() {
		return eUphone;
	}
	public void seteUphone(String eUphone) {
		this.eUphone = eUphone;
	}
	public char geteYn() {
		return eYn;
	}
	public void seteYn(char eYn) {
		this.eYn = eYn;
	}
	
	
}
