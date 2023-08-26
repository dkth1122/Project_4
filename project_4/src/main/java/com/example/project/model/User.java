package com.example.project.model;

import lombok.Data;

@Data
public class User {
	//고객(유저)
	private String uId;
	private String uPw;
	private String uPhone;
	private String uName;
	private String uName2;
	private String uEmail;
	private char uEventyn;
	private int uCnt;
	private int uPoint;
	private String joindate;
	private String gArtist;
	private String bYn;
	private String bReasons;
	private String bDate;
	private String profile;
	
	
	
	//포인트 테이블
	private int point;
	private int usepoint;
	private int repoint;
	private String podata;
	private String pName;
	private String dateFormat;
	
	
	
	
	
	public String getDateFormat() {
		return dateFormat;
	}
	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
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
	public int getuCnt() {
		return uCnt;
	}
	public void setuCnt(int uCnt) {
		this.uCnt = uCnt;
	}
	public int getuPoint() {
		return uPoint;
	}
	public void setuPoint(int uPoint) {
		this.uPoint = uPoint;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getgArtist() {
		return gArtist;
	}
	public void setgArtist(String gArtist) {
		this.gArtist = gArtist;
	}
	public String getbYn() {
		return bYn;
	}
	public void setbYn(String bYn) {
		this.bYn = bYn;
	}
	public String getbReasons() {
		return bReasons;
	}
	public void setbReasons(String bReasons) {
		this.bReasons = bReasons;
	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}
	public int getRepoint() {
		return repoint;
	}
	public void setRepoint(int repoint) {
		this.repoint = repoint;
	}
	public String getPodata() {
		return podata;
	}
	public void setPodata(String podata) {
		this.podata = podata;
	}
	
	
	
	
	
}
