package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OrdersDAO;
import com.dto.OrdersDTO;

@Service
public class OrdersService {

	@Autowired
	OrdersDAO dao;

	public List<OrdersDTO> ordersAllList(String UserID) {
		return dao.ordersAllList(UserID);
	}

	public void orderInsert(OrdersDTO ordersdto) {
		dao.orderInsert(ordersdto);
	}

	public OrdersDTO orderSelect(int OrderID) {
		return dao.orderSelect(OrderID);
	}
	
	
}
