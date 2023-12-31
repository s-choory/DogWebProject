package com.service;

import java.util.List;
import java.util.Map;

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

	public void delAllCart(String UserID) {
		dao.delAllCart(UserID);
	}
	public int cartAmountUpdate(Map<Object, Object> map) {
		return dao.cartAmountUpdate(map);
	}

	public List<CartDTO> cartOneList(Map<Object, Object> map) {
		return dao.cartOneList(map);
	}

	public List<CartDTO> cartNumList(List<Integer> checklist) {
		return dao.cartNumList(checklist);
	}

	public void cartDelCheckedList(List<Integer> checklist) {
		dao.cartDelCheckedList(checklist);
	}

	public CartDTO dupleSelect(CartDTO cDTO) {
		return dao.dupleSelect(cDTO);
	}

	public int dupleUpdate(Map<String, Integer> map) {
		return dao.dupleUpdate(map);
	}
	
	public int addAfterList(CartDTO CartDTO, String UserID, int OrderID) {
		CartDTO.setUserID(UserID);
		CartDTO.setOrderNumber(OrderID);
		CartDTO.setOrderState("after");
		return dao.addAfterList(CartDTO);
	}
	public List<CartDTO> selectAfterList(CartDTO cdto) {
		return dao.selectAfterList(cdto);
	}

	public List<CartDTO> selectOrderAllList(String userid) {
		return dao.selectOrderAllList(userid);
	}
}
