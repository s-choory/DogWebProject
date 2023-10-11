package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsDAO;
import com.dto.GoodsDTO;
import com.dto.OrdersDTO;
import com.dto.ReviewsDTO;

@Service
public class GoodsService {

	@Autowired
	GoodsDAO dao;

	public GoodsService() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodsService(GoodsDAO dao) {
		super();
		this.dao = dao;
	}
	
	public List<GoodsDTO> select() {
		return dao.select();
	}

	public GoodsDTO selectone(String gProductID) {
		return dao.selectone(gProductID);
	}


	public List<GoodsDTO> goodList(String gCategory1) {
		return dao.goodList(gCategory1);
	}

	public List<GoodsDTO> ASCPriceList(String gCategory) {
		return dao.ASCPriceList(gCategory);
	}

	public List<GoodsDTO> DESCPriceList(String gCategory) {
		return dao.DESCPriceList(gCategory);
	}

	public List<GoodsDTO> MostPopular(String gCategory) {
		return dao.MostPopular(gCategory);
	}

	public OrdersDTO OrderSelect(HashMap<String, Object> map) {
		return dao.OrderSelect(map);
	}

	public int addReview(ReviewsDTO rDTO) {
		return dao.addReview(rDTO);
	}

	public void orderFlagUpdate(int OrderID) {
		dao.orderFlagUpdate(OrderID);
	}

	public List<ReviewsDTO> selectReview(String gProductID) {
		return dao.selectReview(gProductID);
	}

	public List<GoodsDTO> searchList(String SearchName) {
		return dao.searchList(SearchName);
	}
	
	
	
}
