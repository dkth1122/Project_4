package com.example.project.model;

import lombok.Data;

@Data
public class Order {
	
	private String oNo;
	private String pNo;
	private String uId;
	private String payment;
	private String oDate;
	private int oCount;
	private char exchange;
	private int oPoint;
	private String oMessage;
	private int afNo;
	private int orderCnt;
	
	
//	상품 JOIN 	
	private String pName;
	private String price;
	private String artist;
	private String pImg;
	
	
	
	
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getoNo() {
		return oNo;
	}
	public void setoNo(String oNo) {
		this.oNo = oNo;
	}
	
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	public int getoCount() {
		return oCount;
	}
	public void setoCount(int oCount) {
		this.oCount = oCount;
	}
	public char getExchange() {
		return exchange;
	}
	public void setExchange(char exchange) {
		this.exchange = exchange;
	}
	public int getoPoint() {
		return oPoint;
	}
	public void setoPoint(int oPoint) {
		this.oPoint = oPoint;
	}
	public String getoMessage() {
		return oMessage;
	}
	public void setoMessage(String oMessage) {
		this.oMessage = oMessage;
	}
	public int getAfNo() {
		return afNo;
	}
	public void setAfNo(int afNo) {
		this.afNo = afNo;
	}
	public int getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}
	
	
	
	
	
}
