package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;

@Repository
public class CartDAO {

	@Autowired
	SqlSessionTemplate session;
	
	public int addCartList(CartDTO dto) {
		return session.insert("CartMapper.addCartList", dto);
	}

	public List<CartDTO> cartList(String UserID) {
		return session.selectList("CartMapper.cartList",UserID);
	}

	public void delCart(String CartNum) {
		session.delete("CartMapper.delCart", CartNum);
	}

}
