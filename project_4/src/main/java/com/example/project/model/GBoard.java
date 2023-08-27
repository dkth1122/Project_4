package com.example.project.model;

import lombok.Data;

@Data
public class GBoard {
    private int gNo;
    private String gDate;
    private String uId;
    private String gLike;
    private String artist;
    private String gContent;
    private String gPhoto;
    private String gDelYN;
    
    //댓글 수 출력 
    private int gcCnt;

    // 유저 테이블 join
    private String gArtist;
    private String uName;
    private String uName2;
    private String uMembership;

    //좋아요 테이블 join
    private int likeNo;
    private String likeDate;
    
    //댓글 테이블 join
    private int gcNo;
    private String gcContent;
    private String gcDelYN;
    private String gcDate;
    private int gcLike;
    private int gcGroup;
    
    
    //좋아요 댓글 테이블 join
    private int gcLikeNo;
    private String gcLikeDate;
    
    //신고 
    private int gBanYN;
    private int gcBanYN;

    
    //이미지 테이블 join
    private int gfNo;
    private String fileName;
    private String path;
    
    //멤버쉽 테이블 join
    private int mNo;
    private String mStatus;
    private String mRegDate;
    private String mExpDate;
    private String kitYN;
    
    //프로필 테이블
    private int gpNo;
    private String nickName;
    private String gpPath;
    private String gpFileName;
    
    //알람 기능 테이블
    private int noNo;
    private String noRead;
    private String noType;
    private String noMessage;
    private String noTime;
    private String noCheck;
    
    
	public String getGpPath() {
		return gpPath;
	}
	public void setGpPath(String gpPath) {
		this.gpPath = gpPath;
	}
	public String getGpFileName() {
		return gpFileName;
	}
	public void setGpFileName(String gpFileName) {
		this.gpFileName = gpFileName;
	}
	public int getNoNo() {
		return noNo;
	}
	public void setNoNo(int noNo) {
		this.noNo = noNo;
	}
	public String getNoRead() {
		return noRead;
	}
	public void setNoRead(String noRead) {
		this.noRead = noRead;
	}
	public String getNoType() {
		return noType;
	}
	public void setNoType(String noType) {
		this.noType = noType;
	}
	public String getNoMessage() {
		return noMessage;
	}
	public void setNoMessage(String noMessage) {
		this.noMessage = noMessage;
	}
	public String getNoTime() {
		return noTime;
	}
	public void setNoTime(String noTime) {
		this.noTime = noTime;
	}
	public String getNoCheck() {
		return noCheck;
	}
	public void setNoCheck(String noCheck) {
		this.noCheck = noCheck;
	}
	public int getgNo() {
		return gNo;
	}
	public void setgNo(int gNo) {
		this.gNo = gNo;
	}
	public String getgDate() {
		return gDate;
	}
	public void setgDate(String gDate) {
		this.gDate = gDate;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getgLike() {
		return gLike;
	}
	public void setgLike(String gLike) {
		this.gLike = gLike;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getgContent() {
		return gContent;
	}
	public void setgContent(String gContent) {
		this.gContent = gContent;
	}
	public String getgPhoto() {
		return gPhoto;
	}
	public void setgPhoto(String gPhoto) {
		this.gPhoto = gPhoto;
	}
	public String getgDelYN() {
		return gDelYN;
	}
	public void setgDelYN(String gDelYN) {
		this.gDelYN = gDelYN;
	}
	public String getgArtist() {
		return gArtist;
	}
	public void setgArtist(String gArtist) {
		this.gArtist = gArtist;
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
	public String getuMembership() {
		return uMembership;
	}
	public void setuMembership(String uMembership) {
		this.uMembership = uMembership;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public String getLikeDate() {
		return likeDate;
	}
	public void setLikeDate(String likeDate) {
		this.likeDate = likeDate;
	}
	public int getGcNo() {
		return gcNo;
	}
	public void setGcNo(int gcNo) {
		this.gcNo = gcNo;
	}
	public String getGcContent() {
		return gcContent;
	}
	public void setGcContent(String gcContent) {
		this.gcContent = gcContent;
	}
	public String getGcDelYN() {
		return gcDelYN;
	}
	public void setGcDelYN(String gcDelYN) {
		this.gcDelYN = gcDelYN;
	}
	public int getGcLike() {
		return gcLike;
	}
	public void setGcLike(int gcLike) {
		this.gcLike = gcLike;
	}
	public int getGcGroup() {
		return gcGroup;
	}
	public void setGcGroup(int gcGroup) {
		this.gcGroup = gcGroup;
	}
	public int getGcLikeNo() {
		return gcLikeNo;
	}
	public void setGcLikeNo(int gcLikeNo) {
		this.gcLikeNo = gcLikeNo;
	}
	public String getGcLikeDate() {
		return gcLikeDate;
	}
	public void setGcLikeDate(String gcLikeDate) {
		this.gcLikeDate = gcLikeDate;
	}
	public int getgBanYN() {
		return gBanYN;
	}
	public void setgBanYN(int gBanYN) {
		this.gBanYN = gBanYN;
	}
	public int getGcBanYN() {
		return gcBanYN;
	}
	public void setGcBanYN(int gcBanYN) {
		this.gcBanYN = gcBanYN;
	}
	public int getGcCnt() {
		return gcCnt;
	}
	public void setGcCnt(int gcCnt) {
		this.gcCnt = gcCnt;
	}
	public String getGcDate() {
		return gcDate;
	}
	public void setGcDate(String gcDate) {
		this.gcDate = gcDate;
	}
	public int getGfNo() {
		return gfNo;
	}
	public void setGfNo(int gfNo) {
		this.gfNo = gfNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getmStatus() {
		return mStatus;
	}
	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}
	public String getmRegDate() {
		return mRegDate;
	}
	public void setmRegDate(String mRegDate) {
		this.mRegDate = mRegDate;
	}
	public String getmExpDate() {
		return mExpDate;
	}
	public void setmExpDate(String mExpDate) {
		this.mExpDate = mExpDate;
	}
	public String getKitYN() {
		return kitYN;
	}
	public void setKitYN(String kitYN) {
		this.kitYN = kitYN;
	}
	public int getGpNo() {
		return gpNo;
	}
	public void setGpNo(int gpNo) {
		this.gpNo = gpNo;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
    
	
}
