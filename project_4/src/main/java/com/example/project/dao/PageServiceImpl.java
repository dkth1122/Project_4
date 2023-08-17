package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.PageMapper;
import com.example.project.model.User;

@Service
		
public class PageServiceImpl implements PageService {
 
	@Autowired
	PageMapper pageMapper;

	@Override /* 제목에다가 클릭해서 자동완성 */
	public List<User> userPoint(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return pageMapper.userPoint(map);
						/* ctrl space -> sql에서 만든이름 */
	} 
	
	
}
