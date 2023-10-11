package com.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dto.PageDTO;
import com.dto.PostsDTO;
import com.service.PageService;
import com.service.PostsService;

@Controller
public class PostController {
	
	@Autowired
	PostsService Postsservice;	
	@Autowired 
	PageService Pageservice;
	
	/* community */
	//커뮤니티메인화면
	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)
	public String community(Locale locale, Model model) {
		List<PostsDTO> list = Postsservice.selectList();
		model.addAttribute("list",list);
		System.out.println(list); // list 확인
		
		return "community/community_main";
	}
	
	/* 페이징 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String page(String curPage, Model model, PageDTO pDTO ,HttpServletRequest request, HttpServletResponse response) {
	
		if(curPage == null) curPage = "1";
		String search= request.getParameter("search");
		String order= request.getParameter("order");
		System.out.println(search);
		
		pDTO = Pageservice.selectAll(Integer.parseInt(curPage), search, pDTO, order);
		System.out.println("curPage>>>>>>"+curPage);
		System.out.println(pDTO.getTotalCount());
		System.out.println(pDTO.getList());
		model.addAttribute("pDTO",pDTO);
		model.addAttribute("search", search);
		model.addAttribute("order", order);
		return "community/community_main";
	}
	
	//상세보기
	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public String post(Locale locale, Model model) {
		return "community/community_post";
	}
	//등록화면
	@RequestMapping(value = "/addPost", method = RequestMethod.GET)
	public String addPost(Locale locale, Model model) {
		return "community/community_addPost";
	}
}
