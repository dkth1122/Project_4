package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Inquiry;


@Mapper
public interface InquiryMapper {
	
	//미답변 문의 목록 출력
	List<Inquiry> selectInquiryList(HashMap<String, Object> map);
	// 페이징용 카운트
	int selectCnt(HashMap<String, Object> map);
	
	//문의 상세 보기
	Inquiry selectInquiryInfo(HashMap<String, Object> map);
	
	//답변
	int updateInquiryAnswer(HashMap<String, Object> map);
	
	//마이페이지 1:1문의내역 출력
	List<Inquiry> selectMypageInquiry(HashMap<String, Object> map);
	
	//마이페이지 1:1문의글 등록
	int myPageinsertBoard(HashMap<String, Object> map);
	
	//1:1문의 검색
	List<Inquiry> searchInquiryList(HashMap<String, Object> map);
	
}
