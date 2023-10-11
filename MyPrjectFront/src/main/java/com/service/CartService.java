package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CartDAO;
import com.dto.CartDTO;

@Service
public class CartService {

	@Autowired
	CartDAO dao;
	
	
	public int addCartList(CartDTO dto) {
		return dao.addCartList(dto);
	}

	public List<CartDTO> cartList(String UserID){
		return dao.cartList(UserID);
	}

	public void delCart(String CartNum) {
		dao.delCart(CartNum);
	}

}
