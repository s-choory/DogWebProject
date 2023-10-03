package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UsersDAO;
import com.dto.UsersDTO;

@Service
public class UsersService {
	
	@Autowired
	UsersDAO dao;

	public UsersDTO loginChk(UsersDTO dto) {
		return dao.loginChk(dto);
	}

	public int idChk(String UserID) {
		return dao.idChk(UserID);
	}

	public int memberAdd(UsersDTO user) {
		return dao.memberAdd(user);
	}

	public int aliasChk(String UserAlias) {
		return dao.aliasChk(UserAlias);
	}

	public UsersDTO findID(UsersDTO uDTO) {
		return dao.findID(uDTO);
	}

	public UsersDTO findPW(UsersDTO uDTO) {
		return dao.findPW(uDTO);
	}

	public int updatePW(UsersDTO uDTO) {
		return dao.updatePW(uDTO);
	}
	
}
