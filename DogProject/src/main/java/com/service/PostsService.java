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
	
	public List<PostsDTO> popular(){
		return dao.popular();
	}
	
	public int addPost(PostsDTO post) {
		dao.addPost(post);
		return post.getPostID();
	}
	
	public int updateContent(PostsDTO post) {
		dao.updateContent(post);
		return post.getPostID();
		
	}
	
	public PostsDTO read(int PostID) {
		System.out.println("ss");
		return dao.read(PostID);
	}
	
	public void hitadd(int PostID) {
		dao.hitadd(PostID);
	}
	
	public int delete_column(PostsDTO DTO) {
		return dao.delete_column(DTO);
	}
}// end class
