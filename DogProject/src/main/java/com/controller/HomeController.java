package com.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.AccompanyingFacilitiesService;

@Controller
public class HomeController {

	@Autowired
	AccompanyingFacilitiesService service;
	
//	/* community */
//	//커뮤니티메인화면
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String community(Locale locale, Model model) {
//		return "community/community_main";
//	}
//	//상세보기
//	@RequestMapping(value = "/post", method = RequestMethod.GET)
//	public String post(Locale locale, Model model) {
//		return "community/community_post";
//	}
//	//등록화면
//	@RequestMapping(value = "/addPost", method = RequestMethod.GET)
//	public String addPost(Locale locale, Model model) {
//		return "community/community_addPost";
//	}
	
	
	/* mypage */
	//마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model) {
		return "mypage/mypage_white";
	}
	
	/* group */
	//모임생성
	@RequestMapping(value = "/meeting_create", method = RequestMethod.GET)
	public String meeting_create(Locale locale, Model model) {
		return "group/meeting_create";
	}
	//모임목록
	@RequestMapping(value = "/MoIm", method = RequestMethod.GET)
	public String MoIm(Locale locale, Model model) {
		return "group/MoIm";
	}
	//모임상세화면
	@RequestMapping(value = "/MoIm2", method = RequestMethod.GET)
	public String MoIm2(Locale locale, Model model) {
		return "group/MoIm2";
	}
	
	
	/* customer_center*/
	//고객센터QnA
	@RequestMapping(value = "/ContactCenter_FAQ", method = RequestMethod.GET)
	public String ContactCenter_FAQ(Locale locale, Model model) {
		return "customer_center/ContactCenter_FAQ";
	}
	//고객센터글목록(페이징)
	@RequestMapping(value = "/ContactCenter_Notice", method = RequestMethod.GET)
	public String ContactCenter_Notice(Locale locale, Model model) {
		return "customer_center/ContactCenter_Notice";
	}
	
	
	//인덱스페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		return "main";
	}
	//검색
	@RequestMapping(value = "/main_searchList", method = RequestMethod.GET)
	public String main_searchList(Locale locale, Model model) {
		return "main_searchList";
	}
	
}
