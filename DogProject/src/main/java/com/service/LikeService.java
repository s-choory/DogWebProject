package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.LikeDAO;
import com.dto.LikeDTO;

@Service("LikeService")
public class LikeService {
	@Autowired
	LikeDAO dao;
	

	public void likeinsert(LikeDTO ldto) {
		dao.likeinsert(ldto);
	}
	
	public int like_likeCount(LikeDTO ldto) {
		return dao.like_likeCount(ldto);
	}
	
	public int like_likeTotalCount(LikeDTO ldto) {
		return dao.like_likeTotalCount(ldto);
	}
	
	public int likedelete(LikeDTO dto) {
		return dao.likedelete(dto);
	}

	public List<LikeDTO> selectLikeList() {
		return dao.selectLikeList();
	}
	
	
}// end class
