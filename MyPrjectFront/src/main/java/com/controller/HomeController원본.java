package com.controller;

import java.util.Base64;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.CartDTO;
import com.dto.UsersDTO;
import com.service.AccompanyingFacilitiesService;
import com.service.CartService;
import com.service.UsersService;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;


public class HomeController원본 {

	@Autowired
	AccompanyingFacilitiesService service;
	@Autowired
	CartService cartservice;
	@Autowired
	UsersService usersservice;
	
	
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
	public String mypage(HttpSession session, Model model) {
		System.out.println("mypage 호출됨");

		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/login";
		}
		List<CartDTO> list = cartservice.cartList(user.getUserID());
		model.addAttribute("list",list);
		
		return "mypage/mypage_white";
	}
	// 여기서 posts(글쓰기) list를 넘겨줘서 마이페이지에서 나열 하면 될듯 html알아서 좀 맞추고 
	
	//마이페이지 모달창 파일 db에 업로드하기 
	@RequestMapping(value = "/profil-img", method = RequestMethod.POST)
	public ResponseEntity<String> profil(HttpServletRequest request, HttpSession session) {
	    System.out.println("/test/profil-img 호출됨");

	    // 파일 업로드 처리
	    MultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
	    if (multipartResolver.isMultipart(request)) {
	        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	        MultipartFile file = multipartRequest.getFile("file");

	        if (file != null && !file.isEmpty()) {
	            String fileName = file.getOriginalFilename();
	            System.out.println("업로드된 파일 이름: " + fileName);

	            try {
	                byte[] fileBytes = file.getBytes();
	                System.out.println("업로드된 파일 크기: " + fileBytes.length);

	                // Base64 인코딩
	                String encodedFile = Base64.getEncoder().encodeToString(fileBytes);

	                UsersDTO user = (UsersDTO) session.getAttribute("User");
	                String userID = user.getUserID();

	                // db에 업데이트 코드
	                UsersDTO DTO = new UsersDTO(userID, fileBytes);
	                
	                // 세션 정보 업데이트
					user.setUSERIMG(fileBytes); // 새로운 이미지 데이터 설정
					
					session.setAttribute("User", user); // 세션에 업데이트된 User 객체 저장
	                
					int n = usersservice.ProfilImg(DTO);
	                
					if (n > 0) {
	                    return ResponseEntity.ok(encodedFile); // 성공적으로 업데이트되면 인코딩된 이미지 데이터를 응답으로 전송
					} else {
						return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("이미지 업데이트 실패");
					}
	                
	            } catch (Exception e) {
	                e.printStackTrace();
	                
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 처리 중 오류 발생");
	            }
	        }
	    }

	    return ResponseEntity.badRequest().body("파일이 없습니다.");
	}
	
	// 모달창에서 이미지 삭제 => 기본이미지로   
	@RequestMapping(value = "/delete-profil-img", method = RequestMethod.POST)
	public String profildelete(HttpSession session, Model model) {
		System.out.println("이미지 삭제 호출됨");

		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/login";
		}
		String UserID = user.getUserID();
		int n = usersservice.profilImgDelete(UserID);
		
		System.out.println("삭제 업데이트 행>>"+n);
		
		// 이미지 삭제 후에 세션의 User 객체를 업데이트해야 함
	    UsersDTO updatedUser = usersservice.userinfo(UserID);
	    session.setAttribute("User", updatedUser); // 세션에 업데이트된 User 객체 저장
	    System.out.println("userimg 삭제된  유저정보>>"+updatedUser);

		
		List<CartDTO> list = cartservice.cartList(user.getUserID());
		model.addAttribute("list",list);
		
		return "mypage/mypage_white";
	}
	
	//프로필 모달창  프로필 정보 변경 클릭시  // profil-text
	@RequestMapping(value = "/profil-text", method = RequestMethod.POST)
	public String profilupdate(HttpSession session, Model model, UsersDTO dto) {
		System.out.println("회원 정보 컨트롤러로 넘어옴");
		
		System.out.println(dto); //새로 수정한 dto 정보 찍어보기 
		
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/login";
		}
		
		usersservice.profilUpdate(dto);
		
		String UserID = user.getUserID();
		user = usersservice.userinfo(UserID);
		session.setAttribute("User", user);
		
		
		return "redirect:/mypage";
	}
	
	
	
	
	
	
	
 /*   @RequestMapping(value = "/profil-img", method = RequestMethod.POST)
    public String profil(HttpServletRequest request, HttpSession session) {
        System.out.println("/test/profil-img 호출됨");
        String nextpage = null;
        
        // 파일 업로드 처리
        MultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        if (multipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            MultipartFile file = multipartRequest.getFile("file");
            
            if (file != null && !file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                System.out.println("업로드된 파일 이름: " + fileName);

                try {
                    byte[] fileBytes = file.getBytes();
                    System.out.println("업로드된 파일 크기: " + fileBytes.length);
                    
                    // Base64 인코딩
                    String encodedFile = Base64.getEncoder().encodeToString(fileBytes);
                    
                    UsersDTO user = (UsersDTO) session.getAttribute("User");
                    String userID = user.getUserID();
                    
                    String encodedImage = Base64.getEncoder().encodeToString(user.getUSERIMG());
                    // db에 업데이트 코드
                    UsersDTO DTO = new UsersDTO(userID, encodedFile.getBytes());
                    int n = usersservice.ProfilImg(DTO);
                    System.out.println("업데이트 결과: " + n);
                    System.out.println("encode>>"+encodedFile);
                    System.out.println("encodeimg>>"+encodedImage);
                    
                    nextpage = "redirect:/mypage";
                } catch (Exception e) {
                    e.printStackTrace();
                    
                    return "<script>alert('빈 파일입니다.'); location.href='mypage/mypage_white';</script>"; 
                    // 빈 파일 경고 후 "mypage/mypage_white" 페이지로 이동
                    
                }
                return nextpage;
            }
        }
        return nextpage;
     }

 */	
	
	
	
	
	
	
	
/////// 마이페이지 끝 /////////////////////////////////	
	
	
	
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
