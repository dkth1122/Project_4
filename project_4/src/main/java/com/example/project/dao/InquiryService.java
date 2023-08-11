package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.Inquiry;


public interface InquiryService {

	List<Inquiry>selectProductList(HashMap<String, Object> map);
	
	Inquiry selectProductInfo(HashMap<String, Object> map);
	
	int updateInquiryAnswer(HashMap<String, Object> map);

}
