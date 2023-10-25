package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SearchDAO;
import com.dto.AccompanyingFacilitiesDTO;
import com.dto.LikeDTO;
import com.dto.NoticeDTO;
import com.dto.PostsDTO;
import com.dto.ProductsDTO;
import com.dto.ReviewsDTO;

@Service
public class SearchService {
	
	@Autowired
	SearchDAO dao;


	public List<AccompanyingFacilitiesDTO> AccompanyingFacilities_search(String search) {
		return dao.AccompanyingFacilities_search(search);
	}


	public List<NoticeDTO> Notices_search(String search) {
		return dao.Notices_search(search);
	}


	public List<PostsDTO> Posts_search(String search) {
		return dao.Posts_search(search);
	}


	public List<ProductsDTO> Products_search(String search) {
		return dao.Products_search(search);
	}


	public List<LikeDTO> Like_search() {
		return dao.Like_search();
	}


	public List<ReviewsDTO> Review_search() {
		return dao.Review_search();
	}
	
	


}
