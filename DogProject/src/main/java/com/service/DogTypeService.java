package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.DogTypeDAO;
import com.dto.DogTypeDTO;

@Service
public class DogTypeService {

	@Autowired
	DogTypeDAO dao;
	
	public List<DogTypeDTO> dogsList(Map<String, String> map) {
		return dao.dogsList(map);
	}

	public List<DogTypeDTO> dogSearch(String dogSearch) {
		return dao.dogSearch(dogSearch);
	}
}
