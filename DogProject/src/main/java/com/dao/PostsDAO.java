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
	
	public List<PostsDTO> popular() {
		// TODO Auto-generated method stub
		return session.selectList("PostsMapper.popular");
	}
	
	public void addPost(PostsDTO post) {
		// TODO Auto-generated method stub
		session.insert("PostsMapper.addPost",post);
	}
	
	public int updateContent(PostsDTO post) {
		int n = session.update("PostsMapper.updateContent", post);
		System.out.println("업뎃됨:========"+n);
		return n;
	}
	
	public PostsDTO read(int PostID){
		System.out.println("sss");
		return session.selectOne("PostsMapper.Posts_read", PostID);
	}
	
	public void hitadd(int PostID) {
		session.update("PostsMapper.Posts_hitadd", PostID);
		
	}
	
	//컬럼타입만 변경update -> db에 남아있음
	public int delete_column(PostsDTO DTO) {
		return session.update("PostsMapper.Posts_delete", DTO);
			
	}
}
