package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AccompanyingFacilitiesDAO;
import com.dto.AccompanyingFacilitiesDTO;

@Service
public class AccompanyingFacilitiesService {


	@Autowired
	AccompanyingFacilitiesDAO dao;
	
	public List<AccompanyingFacilitiesDTO> selectList() {
		return dao.selectList();
	}

	public List<AccompanyingFacilitiesDTO> searchList(AccompanyingFacilitiesDTO dto) {
		return dao.searchList(dto);
	}


}
