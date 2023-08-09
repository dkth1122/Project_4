package com.example.project.model;

public class Inquiry {
	//고객센터
	private int iNo;
	private String iQtitle;
	private String iQcontent;
	private String iQtime;
	private String cuser;
	private String uId;
	private String iAcontent;
	private String iTime;
	private String category;
	private int pNo;
	private int sNo;
	private String state;
	private int afNo;
	
	
	public int getiNo() {
		return iNo; 
	}
	public void setiNo(int iNo) {
		this.iNo = iNo;
	}
	public String getiQtitle() {
		return iQtitle;
	}
	public void setiQtitle(String iQtitle) {
		this.iQtitle = iQtitle;
	}
	public String getiQcontent() {
		return iQcontent;
	}
	public void setiQcontent(String iQcontent) {
		this.iQcontent = iQcontent;
	}
	public String getiQtime() {
		return iQtime;
	}
	public void setiQtime(String iQtime) {
		this.iQtime = iQtime;
	}
	public String getCuser() {
		return cuser;
	}
	public void setCuser(String cuser) {
		this.cuser = cuser;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getiAcontent() {
		return iAcontent;
	}
	public void setiAcontent(String iAcontent) {
		this.iAcontent = iAcontent;
	}
	public String getiTime() {
		return iTime;
	}
	public void setiTime(String iTime) {
		this.iTime = iTime;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getAfNo() {
		return afNo;
	}
	public void setAfNo(int afNo) {
		this.afNo = afNo;
	}	
}
