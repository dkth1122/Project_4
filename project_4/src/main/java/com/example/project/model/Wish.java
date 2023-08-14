package com.example.project.model;

import lombok.Data;

@Data
public class Wish {

	private String uId;
	private String pNo;
	private int afNo;
	
	private int price;
	private int point;
	private int stock;
	private char membership;
	private char soldout;
	private int pLimit;
	private String pDate;
	private String category;
	private String artist;
	private String fYn;
	private String pImg;
	private String pName;
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public int getAfNo() {
		return afNo;
	}
	public void setAfNo(int afNo) {
		this.afNo = afNo;
	}
}
