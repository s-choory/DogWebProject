package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AccompanyingFacilitiesDAO;
import com.dto.AccompanyingFacilitiesDTO;

@Service
public class AccompanyingFacilitiesService {


	@Autowired
	AccompanyingFacilitiesDAO dao;
	
	public List<AccompanyingFacilitiesDTO> selectList(AccompanyingFacilitiesDTO dto) {
		return dao.selectList(dto);
	}

	public List<AccompanyingFacilitiesDTO> searchList(AccompanyingFacilitiesDTO dto) {
		return dao.searchList(dto);
	}

	public List<AccompanyingFacilitiesDTO> selectListChange(Map<String, Object> map) {
		return dao.selectListChange(map);
	}

}
