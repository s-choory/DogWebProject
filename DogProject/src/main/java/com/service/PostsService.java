package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PostsDAO;
import com.dto.PostsDTO;

@Service("Postservice")
public class PostsService {
	@Autowired
	PostsDAO dao;
	
	public List<PostsDTO> selectList() {
		return dao.selectList();
	}
	
	public List<PostsDTO> selectList2(String userID) {
		return dao.selectList2(userID);
	}
	
}// end class
