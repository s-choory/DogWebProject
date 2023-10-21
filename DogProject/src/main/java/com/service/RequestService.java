package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.RequestDAO;
import com.dto.RequestDTO;

@Service("Requestservice")
public class RequestService {
	
	@Autowired
	RequestDAO dao;

	public void AddRequest(RequestDTO dto) {
		dao.AddRequest(dto);
	}

	public List<RequestDTO> UserOrderSelectList(RequestDTO rdto) {
		return dao.UserOrderSelectList(rdto);
	}

	
}
