package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.AccompanyingFacilitiesDTO;

@Repository
public class AccompanyingFacilitiesDAO {

	@Autowired
	SqlSessionTemplate session;
	
	public List<AccompanyingFacilitiesDTO> selectList(AccompanyingFacilitiesDTO dto) {
		return session.selectList("AccompanyingFacilitiesMapper.selectList", dto);
	}

	public List<AccompanyingFacilitiesDTO> searchList(AccompanyingFacilitiesDTO dto) {
		return session.selectList("AccompanyingFacilitiesMapper.searchList",dto);
		
	}

	public List<AccompanyingFacilitiesDTO> selectListChange(Map<String, Object> map) {
		System.out.println(map.get("RodeAddress"));
		System.out.println(map.get("Category2"));
		System.out.println(map.get("Latitude1"));
		System.out.println(map.get("Latitude2"));
		System.out.println(map.get("Longitude1"));
		System.out.println(map.get("Longitude2"));
		return session.selectList("AccompanyingFacilitiesMapper.selectListChange", map);
	}


}
