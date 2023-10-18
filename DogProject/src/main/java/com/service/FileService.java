package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.FileDAO;
import com.dto.FileDTO;

@Service
public class FileService {

	@Autowired
	FileDAO dao;


	public void insert(FileDTO fileDto) {
		dao.insert(fileDto);
		
	}
}
