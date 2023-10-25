package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.AccompanyingFacilitiesDTO;
import com.dto.LikeDTO;
import com.dto.NoticeDTO;
import com.dto.PostsDTO;
import com.dto.ProductsDTO;
import com.dto.ReviewsDTO;

@Repository
public class SearchDAO {

	@Autowired
	SqlSessionTemplate session;

	public List<AccompanyingFacilitiesDTO> AccompanyingFacilities_search(String search) {
		return session.selectList("SearchMapper.AccompanyingFacilities_search", search);
	}

	public List<NoticeDTO> Notices_search(String search) {
		return session.selectList("SearchMapper.Notices_search", search);
	}

	public List<PostsDTO> Posts_search(String search) {
		return session.selectList("SearchMapper.Posts_search", search);
	}

	public List<ProductsDTO> Products_search(String search) {
		return session.selectList("SearchMapper.Products_search", search);
	}

	public List<LikeDTO> Like_search() {
		return session.selectList("SearchMapper.Like_search");
	}

	public List<ReviewsDTO> Review_search() {
		return session.selectList("SearchMapper.Review_search");
	}

	
}
