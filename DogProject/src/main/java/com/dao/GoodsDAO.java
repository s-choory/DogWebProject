package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.GoodsDTO;
import com.dto.OrdersDTO;
import com.dto.ReviewsDTO;
@Repository
public class GoodsDAO {

	@Autowired
	SqlSessionTemplate session; 
	
	public List<GoodsDTO> select() {
		return session.selectList("GoodsMapper.selectAll");
	}

	public GoodsDTO selectone(String gProductID) {
		return session.selectOne("GoodsMapper.selectOne", gProductID);
	}

	public List<GoodsDTO> goodList(String gCategory1) {
		return session.selectList("GoodsMapper.goodsList", gCategory1);
	}

	public List<GoodsDTO> ASCPriceList(String gCategory) {
		return session.selectList("GoodsMapper.ASCPriceList", gCategory);
	}
	
	public List<GoodsDTO> DESCPriceList(String gCategory) { 
		return session.selectList("GoodsMapper.DESCPriceList", gCategory);
	}
	  
	public List<GoodsDTO> MostPopular(String gCategory) {
		return session.selectList("GoodsMapper.MostPopular", gCategory);
	}

	public OrdersDTO OrderSelect(HashMap<String, Object> map) {
		System.out.println("map이올시다"+map);
		OrdersDTO oDTO = session.selectOne("OrdersMapper.OrderSelect", map);
		System.out.println("DAO의 ODTO: "+oDTO);
		return oDTO;
	}

	public int addReview(ReviewsDTO rDTO) {
		return session.insert("ReviewsMapper.addReview", rDTO);
	}

	public void orderFlagUpdate(int OrderID) {
		session.update("OrdersMapper.orderFlagUpdate", OrderID);
	}

	public List<ReviewsDTO> selectReview(String ProductID) {
		return session.selectList("ReviewsMapper.selectReview", ProductID);
	}

	public int delReview(int ReviewID) {
		return session.update("ReviewsMapper.delReview", ReviewID);
	}

	public int reviewUpdate(ReviewsDTO rDTO) {
		return session.update("ReviewsMapper.reviewUpdate", rDTO);
	}

}
