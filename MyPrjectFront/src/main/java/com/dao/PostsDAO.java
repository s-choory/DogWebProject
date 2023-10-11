package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.PostsDTO;

@Repository
public class PostsDAO {
	@Autowired
	SqlSessionTemplate session;

	public List<PostsDTO> selectList() {
		return session.selectList("PostsMapper.selectList");
	}

	public List<PostsDTO> selectList2(String userID) {
		return session.selectList("PostsMapper.selectList2", userID);
	}


	public List<PostsDTO> selectgetList(String userID) {
		return session.selectList("PostsMapper.selectgetList", userID);
	}

}
