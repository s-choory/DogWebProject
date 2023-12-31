package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrdersDTO;
import com.dto.ReviewsDTO;
import com.dto.UsersDTO;
@Repository
public class GoodsDAO {

	@Autowired
	SqlSessionTemplate session; 
	
	public List<GoodsDTO> select() {
		return session.selectList("GoodsMapper.selectAll");
	}
	
	public List<GoodsDTO> random() {
		return session.selectList("GoodsMapper.random");
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
		OrdersDTO oDTO = session.selectOne("OrdersMapper.OrderSelect", map);
		return oDTO;
	}

	public int addReview(ReviewsDTO rDTO) {
		return session.insert("ReviewsMapper.addReview", rDTO);
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
	
	public List<GoodsDTO> searchList(String SearchName) {
		return session.selectList("GoodsMapper.searchList", SearchName);
	}

	public List<CartDTO> findCartOrder(HashMap<String, Object> map) {
		return session.selectList("CartMapper.findCartOrder", map);
	}

	public void ReviewFlagUpdate(int cartNum) {
		session.update("CartMapper.ReviewFlagUpdate", cartNum);
	}

	public List<UsersDTO> reviewUserImg(String userAlias) {
		return session.selectList("ReviewsMapper.reviewUserImg",userAlias);
	}
	
	public int CartCount(String userID) {
		return session.selectOne("GoodsMapper.CartCount", userID);
	}

}
