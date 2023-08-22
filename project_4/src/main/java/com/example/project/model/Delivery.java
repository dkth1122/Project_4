package com.example.project.model;

public class Delivery {
	
	private String oNo;
	private String uId;
	private String dDate;
	private String dState;
	private int afNo;
	private char exchange;
	private int buyNo;
	private String path;
	private int oCount;
	private String uName;
	
	
	
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public int getoCount() {
		return oCount;
	}
	public void setoCount(int oCount) {
		this.oCount = oCount;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}
	public String getoNo() {
		return oNo;
	}
	public char getExchange() {
		return exchange;
	}
	public void setExchange(char exchange) {
		this.exchange = exchange;
	}
	public void setoNo(String oNo) {
		this.oNo = oNo;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getdDate() {
		return dDate;
	}
	public void setdDate(String dDate) {
		this.dDate = dDate;
	}
	public String getdState() {
		return dState;
	}
	public void setdState(String dState) {
		this.dState = dState;
	}
	public int getAfNo() {
		return afNo;
	}
	public void setAfNo(int afNo) {
		this.afNo = afNo;
	}
	
	
	

	
}
