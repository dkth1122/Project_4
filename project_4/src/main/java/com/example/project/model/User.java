package com.example.project.model;

public class User {
	//고객(유저)
	private String uId;
	private String uPw;
	private String uPhone;
	private String uName;
	private String uName2;
	private String uEmail;
	private char uEventyn;
	private int Cnt;
	private String joindate;
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;	
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuName2() {
		return uName2;
	}
	public void setuName2(String uName2) {
		this.uName2 = uName2;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public char getuEventyn() {
		return uEventyn;
	}
	public void setuEventyn(char uEventyn) {
		this.uEventyn = uEventyn;
	}
	public int getCnt() {
		return Cnt;
	}
	public void setCnt(int cnt) {
		Cnt = cnt;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	

	
}
