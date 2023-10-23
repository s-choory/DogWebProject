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
	
	public FileDTO fileSelect(int postID) {
		return dao.fileSelect(postID);
	}
	
	public void update(FileDTO fileDto) {
		System.out.println("업데이터 됨");
		dao.update(fileDto);
		
	}
	
	
}
