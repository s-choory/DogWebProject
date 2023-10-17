package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.FileDTO;

@Repository
public class FileDAO {
	@Autowired
	SqlSessionTemplate session;


	public void insert(FileDTO fileDto) {
		session.insert("FileMapper.insert",fileDto);
		
	}


}
