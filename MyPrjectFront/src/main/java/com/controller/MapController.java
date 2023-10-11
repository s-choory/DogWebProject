package com.controller;

import java.util.List;
import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dto.AccompanyingFacilitiesDTO;
import com.service.AccompanyingFacilitiesService;

@Controller
public class MapController {

	@Autowired
	AccompanyingFacilitiesService service;
	
	/* guide */
	//맵 메인
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map(Model model) {
		List<AccompanyingFacilitiesDTO> list = service.selectList();
		model.addAttribute("list",list);
		return "guide/map";
	}
	
	@RequestMapping(value = "/map/search", method = RequestMethod.GET)
	public String mapSearch(Model model, AccompanyingFacilitiesDTO dto) {
		List<AccompanyingFacilitiesDTO> list2 = service.searchList(dto);
		model.addAttribute("RodeAddress", dto.getRodeAddress());
		model.addAttribute("list2",list2);
		return "forward:/map";
	}
	
	
	//동물병원 찾기
	@RequestMapping(value = "/gmap", method = RequestMethod.GET)
	public String gmap(Locale locale, Model model) {
		return "guide/gmap";
	}
	//동반가능업소 목록 - 문화시설
	@RequestMapping(value = "/dogdiv", method = RequestMethod.GET)
	public String dogdiv(Locale locale, Model model) {
		return "guide/dogdiv";
	}
	//동반가능업소 상세화면 - 문화시설
	@RequestMapping(value = "/savedogdiv", method = RequestMethod.GET)
	public String savedogdiv(Locale locale, Model model) {
		return "guide/savedogdiv";
	}
	
}
