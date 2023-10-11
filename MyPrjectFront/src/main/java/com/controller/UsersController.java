package com.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.UsersDTO;
import com.service.UsersService;

@Controller
public class UsersController {
	
	@Autowired
	UsersService service;
	
	/* member */
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "member/login";
	}
	
	@RequestMapping(value = "/loginChk", method = RequestMethod.POST)
	public String loginChk(Model model, HttpSession session, UsersDTO dto) {
		UsersDTO checkedDTO = service.loginChk(dto);
		String href = "redirect:/login";
		if(checkedDTO != null) {
			href = "redirect:/main";		
			session.setAttribute("User",checkedDTO);
		}else {
			model.addAttribute("msg", "아이디 또는 패스워드를 잘못 입력했습니다.");
		}
		return href;
	}
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("User");
		return "redirect:/main";
	}
	
	
	//회원가입 동의
	@RequestMapping(value = "/membership_agree", method = RequestMethod.GET)
	public String membership_agree(Locale locale, Model model) {
		return "member/membership_agree";
	}
	//회원가입 정보입력
	@RequestMapping(value = "/membership_sign", method = RequestMethod.GET)
	public String membership_sign(Locale locale, Model model) {
		return "member/membership_sign";
	}
	//아이디 체크
	@RequestMapping(value = "/idChk", method = RequestMethod.POST,  produces = "text/plain;charset=UTF-8")
	public @ResponseBody String idChk(String UserID) {
		int n  = service.idChk(UserID);
		String mesg = "사용가능 아이디입니다";
		if(n == 1 || UserID.length() < 4 || UserID.length() > 12) {
			mesg = "사용불가 아이디입니다";
		}
		return mesg;
	}
	//회원등록
	@RequestMapping(value = "/memberAdd", method = RequestMethod.POST)
	public String memberAdd(HttpSession session, Model model, UsersDTO user) {
		String str = "redirect:/membership_sign";
		String s = idChk(user.getUserID());
		if(s.equals("사용불가 아이디입니다")) {	//UserID 중복일때
			model.addAttribute("msg", "회원가입 실패");
			return str;
		}
		
		int n = service.memberAdd(user);
		
		if(n == 1) {
			UsersDTO checkedDTO = service.loginChk(user);
			session.setAttribute("User",checkedDTO);
			str = "redirect:/main";
		}
		return str;
	}
	
}
