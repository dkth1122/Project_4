package com.example.project.model;

public class DeliveryUser {
	private String uId;
	private String uDname;
	private String uDaddr;
	private String uDphone;
	private String uDmessage;
	private int duNo;
	
	public int getDuNo() {
		return duNo;
	}
	public void setDuNo(int duNo) {
		this.duNo = duNo;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuDname() {
		return uDname;
	}
	public void setuDname(String uDname) {
		this.uDname = uDname;
	}
	public String getuDaddr() {
		return uDaddr;
	}
	public void setuDaddr(String uDaddr) {
		this.uDaddr = uDaddr;
	}
	public String getuDphone() {
		return uDphone;
	}
	public void setuDphone(String uDphone) {
		this.uDphone = uDphone;
	}
	public String getuDmessage() {
		return uDmessage;
	}
	public void setuDmessage(String uDmessage) {
		this.uDmessage = uDmessage;
	}
}
