package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CommentsDAO;
import com.dto.CommentsDTO;
import com.dto.LikeDTO;

@Service  //component-scan 으로 빈생성 
public class CommentsService {
	
	@Autowired 
	CommentsDAO dao;
		
	public CommentsDTO replyui(int PostID) {
		return dao.replyui(PostID);
	}
	
	public int makeReply(CommentsDTO dto) {
		return dao.makeReply(dto);
	}
	
	public void reply(CommentsDTO dto) {
		dao.reply(dto);
	}

	public List<CommentsDTO> replylist(int PostID){
		return dao.replylist(PostID);
	}
	
	public int replyCount(CommentsDTO dto) {
		return dao.replyCount(dto);
	}
	
	
	public void replyinsert(CommentsDTO dto) {
		System.out.println("ss");
		dao.replyinsert(dto);
	}
	
	public int replyupdate(CommentsDTO dto) {
		return dao.replyupdate(dto);	
	}
	
	public int replydelete(CommentsDTO dto) {
		return dao.replydelete(dto);	
	}

	

	}
	
