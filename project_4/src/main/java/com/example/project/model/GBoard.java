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

    // 유저 테이블 join
    private String gArtist;
    private String uName;
    private String uName2;
    private String uMembership;

    //좋아요 테이블 join
    private int likeNo;
    private String likeDate;
    
}
