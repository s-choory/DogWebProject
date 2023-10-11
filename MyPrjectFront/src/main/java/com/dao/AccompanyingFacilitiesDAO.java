package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.AccompanyingFacilitiesDTO;

@Repository
public class AccompanyingFacilitiesDAO {

	@Autowired
	SqlSessionTemplate session;
	
	public List<AccompanyingFacilitiesDTO> selectList() {
		return session.selectList("AccompanyingFacilitiesMapper.selectList");
	}

	public List<AccompanyingFacilitiesDTO> searchList(AccompanyingFacilitiesDTO dto) {
		return session.selectList("AccompanyingFacilitiesMapper.searchList",dto);
		
	}


}
