package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.InquiryMapper;
import com.example.project.model.Inquiry;


@Service
public class InquiryServiceImpl implements InquiryService{
	
	@Autowired
	InquiryMapper inquiryMapper;

	@Override
	public HashMap<String, Object> selectProductList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", inquiryMapper.selectProductList(map));
		resultMap.put("cnt", inquiryMapper.selectCnt(map));
		return resultMap;
	}

	@Override
	public Inquiry selectProductInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return inquiryMapper.selectProductInfo(map);
	}

	@Override
	public int updateInquiryAnswer(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return inquiryMapper.updateInquiryAnswer(map);
	}

	@Override
	public List<Inquiry> searchMypageInquiry(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return inquiryMapper.selectMypageInquiry(map);
	}

	@Override
	public int myPageAddBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return inquiryMapper.myPageinsertBoard(map);
	}

}
