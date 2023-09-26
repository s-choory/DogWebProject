package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.UsersDTO;

@Repository
public class UsersDAO {
	
	@Autowired
	SqlSessionTemplate session;

	public UsersDTO loginChk(UsersDTO dto) {
		UsersDTO dto2 = session.selectOne("UsersMapper.loginChk", dto);
		return dto2;
	}

	public int idChk(String UserID) {
		return session.selectOne("UsersMapper.idChk", UserID);
	}

	public int memberAdd(UsersDTO user) {
		return session.insert("UsersMapper.memberAdd", user);
	}

	public int aliasChk(String UserAlias) {
		return session.selectOne("UsersMapper.aliasChk", UserAlias);
	}


	
	
}
