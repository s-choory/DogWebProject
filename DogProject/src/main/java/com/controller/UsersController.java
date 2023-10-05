package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.UsersDTO;
import com.service.UsersService;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

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
	public String loginChk(HttpSession session,  @RequestParam("UserID") String userID,
            @RequestParam("Password") String password, UsersDTO dto) {
		dto.setUserID(userID);
		dto.setUserID(password);
		System.out.println("userId: "+userID+"\tpassWord"+password);
		System.out.println(dto);
//		UsersDTO checkedDTO = service.loginChk(dto);
//		System.out.println("loginChk호출됨");
		String href = "redirect:/login";
//		if(checkedDTO != null) {
//			href = "redirect:/main";		
//			session.setAttribute("User",checkedDTO);
//		}else {
//			session.setAttribute("msg", "아이디 또는 패스워드를 잘못 입력했습니다.");
//		}
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
	//별명 체크
	@RequestMapping(value = "/aliasChk", method = RequestMethod.POST,  produces = "text/plain;charset=UTF-8")
	public @ResponseBody String UserAlias(String UserAlias) {
		int n  = service.aliasChk(UserAlias);
		System.out.println(n);
		String mesg = "사용가능 별명입니다";
		if(n == 1) {
			mesg = "사용불가 별명입니다";
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
	
	//아이디찾기
	@RequestMapping(value="/findID", method = RequestMethod.GET)
	public String findID() {
		return "member/findID";
	}

	//비밀번호찾기1
	@RequestMapping(value="/findPW", method = RequestMethod.GET)
	public String findPW() {
		return "member/findPW";
	}
	//비밀번호찾기2. 아이디 있는지 검사
	@RequestMapping(value="/findPW2", method = RequestMethod.GET)
	public String findPW2(String UserID, Model model) {
		int n = service.idChk(UserID);
		if(n == 1) {
			model.addAttribute("UserID", UserID);
			return "member/findPW2";
		}else {
			model.addAttribute("msg", "해당 아이디가 존재하지 않습니다.");
			return "redirect:/findPW";
		}
	}
	
	//휴대폰 인증번호 보내기
	@RequestMapping(value="/sendNumber", method = RequestMethod.POST)
	@ResponseBody
	public String sendNumber(String PhoneNumber){
		System.out.println(PhoneNumber);
        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<6; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
        
//		String apiKey = "NCSCTEIDBZTOQ6LU";
//		String apiSecretKey = "V99CEJPQLFJC0YV44KCXAMUMK0MTH174";
//		String domain = "https://api.coolsms.co.kr";
//		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecretKey, domain);
//
//        System.out.println("수신자 번호 : " + PhoneNumber);
//        System.out.println("인증번호 : " + numStr);
//        
//        Message message = new Message();
//        message.setFrom("01092681933");
//        message.setTo("01092681933");
//        message.setText("DogProject\n"+
//        "인증번호는["+numStr+"]입니다.");
//        
//        SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
//        System.out.println(response);
        return numStr;
	}
	
	//아이디 찾기 확인
	@RequestMapping(value="/findIDConfirm", method = RequestMethod.GET)
	public String findIDConfirm(UsersDTO uDTO, Model model) {
		//DB에는 010-1234-1234형태로 저장되어있기 때문에 하이픈을 추가한다.
		String PhoneNumber = uDTO.getPhoneNumber();
		String insertion = "-";
		
		StringBuffer stringBuffer = new StringBuffer(PhoneNumber);
		stringBuffer.insert(3, insertion);
		stringBuffer.insert(8, insertion);
		String result = stringBuffer.toString();
		uDTO.setPhoneNumber(result);
		
		UsersDTO user = service.findID(uDTO);
		if(user != null) {
			model.addAttribute("UserID", user.getUserID());
		}
		return "member/findIDConfirm";
	}
	
	//비밀번호 찾기 확인
	@RequestMapping(value = "/findPWConfirm", method = RequestMethod.POST)
	public String findPWConfirm(UsersDTO uDTO, Model model) {
		//DB에는 010-1234-1234형태로 저장되어있기 때문에 하이픈을 추가한다.
		String PhoneNumber = uDTO.getPhoneNumber();
		String insertion = "-";
		
		StringBuffer stringBuffer = new StringBuffer(PhoneNumber);
		stringBuffer.insert(3, insertion);
		stringBuffer.insert(8, insertion);
		String result = stringBuffer.toString();
		uDTO.setPhoneNumber(result);
		System.out.println(uDTO);
		
		UsersDTO user = service.findPW(uDTO);
		if(user != null) {
			model.addAttribute("user", user);
		}
		return "member/findPWConfirm";
	}
	
	//비밀번호 변경
	@RequestMapping(value="/changePW", method = RequestMethod.POST)
	public String changePW(UsersDTO uDTO, HttpSession session) {
		int n = service.updatePW(uDTO);
		session.setAttribute("msg", "비밀번호를 변경했습니다.");
		return "redirect:/login";
	}
}
