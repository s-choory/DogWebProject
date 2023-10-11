package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dto.CartDTO;
import com.dto.UsersDTO;
import com.service.CartService;
import com.service.GoodsService;

@Controller
public class CartController {
	
	@Autowired
	CartService service;
	@Autowired
	GoodsService gService;
	
	//장바구니 리스트
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public String cartList(HttpSession session, Model model) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/login";
		}
		List<CartDTO> list = service.cartList(user.getUserID());
		model.addAttribute("list",list);
		return "store/cartList";
	}
	
	//장바구니 담기
	@RequestMapping(value = "/addCartList", method = RequestMethod.POST)
	public String addCartList(CartDTO cDTO, HttpSession session, Model model) {
		UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
		if(uDTO == null) {
			return "redirect:/login";
		}
		cDTO.setUserID(uDTO.getUserID());
		int n = service.addCartList(cDTO);
		if(n == 1) {
			model.addAttribute("msg", "장바구니에 넣었습니다.");
		}else {
			model.addAttribute("msg", "장바구니에 넣을 수 없습니다.");
		}
		
		return "forward:/goodsRetrieve?gProductID="+cDTO.getProductID();
	}
	
	//장바구니 항목 삭제
	@RequestMapping(value = "/delCartList")
	public String delCartList(String CartNum) {
		service.delCart(CartNum);
		return "redirect:/cartList";
	}
	
}
