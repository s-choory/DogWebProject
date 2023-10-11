package com.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrdersDTO;
import com.dto.ReviewsDTO;
import com.dto.UsersDTO;
import com.service.GoodsService;
import com.utils.UploadFileUtils;

@Controller
public class StoreController {

	@Autowired
	GoodsService service;
	@Resource(name="uploadPath")
	private String uploadPath;
	
	/* store */
	//스토어메인
	@RequestMapping(value = "/dogshop_main", method = RequestMethod.GET)
	public String dogshop_main(@RequestParam( required = false, value = "gCategory" ) String gCategory,Model m) {
		
		String Category=gCategory;
		String gCategory1="장난감";
		if (Category != null) {
			gCategory1 = Category;
		}
		List<GoodsDTO>list = service.goodList(gCategory1);
		
		//여기서 메인 응답이 찍히면 list를 가져와서 goodsretrieve에 보내줘야함
		//전체 list
			//System.out.println("list 받아오기");
			//List<GoodsDTO> list = service.select();
			//System.out.println(list);
			m.addAttribute("list", list);
		return "store/dogshop_main";
	}
	
	
	//상품상세
	@RequestMapping(value = "/goodsRetrieve", method = RequestMethod.GET)
	
	public String goodsRetrieve(@RequestParam("gProductID") String gProductID, @RequestParam("gCategory") String gCategory, Model m) {
	    
		 // 상품 정보 조회 및 모델에 추가
	    GoodsDTO list2 = service.selectone(gProductID);
	    m.addAttribute("selectlist", list2);
	    // 상품 리스트 조회 및 모델에 추가
	   // List<GoodsDTO>list = service.goodList(gCategory);
	   // m.addAttribute("list", list);


	    return "store/dogshop_main";
	}
	
	
	//결제확인
	@RequestMapping(value = "/orderConfirm", method = RequestMethod.GET)
	public String orderConfirm(Model model,HttpSession session) {
		CartDTO cDTO = (CartDTO)session.getAttribute("cDTO");
		return "store/orderConfirm";
	}
	
	//카테고리 클릭시 
	@RequestMapping(value = "/goodslist", method = RequestMethod.GET)
	public String goodslist(@RequestParam("gCategory") String gCategory, Model m) {
		
		String Category=gCategory;
		String gCategory1="장난감";
		if (Category != null) {
			gCategory1 = Category;
		}
		System.out.println(gCategory1);
		List<GoodsDTO>list = service.goodList(gCategory1);
		
		return "forward:store/dogshop_main";
	}
	
	
	//상세보기 창에서 구매 버튼을 클릭했을때
	@RequestMapping(value = "/goodsRetrieve", method = RequestMethod.POST)
	public String goodsRetrieve(@RequestParam("gProductID") String gProductID, Model m) {
		//url에 담아온 num파싱해서 그 num에 맞는  dto 모든 정보들을 goodsRetrieve로 넘겨줘야함	
		//특정 list
		GoodsDTO list = service.selectone(gProductID);
		m.addAttribute("list", list);
		
	    List<ReviewsDTO> rList = service.selectReview(gProductID);
	    m.addAttribute("ReviewList", rList);
		return "store/goodsRetrieve"; 
	}
	
	//스토어 메인에서  인기순 가격높은순 가격낮은순 클릭시 
	@RequestMapping(value = "/dogshop_ASCPriceList", method = RequestMethod.GET)
	public String dogshop_main2(@RequestParam( value = "gCategory" ) String gCategory,Model m) {
		
		// 가격  오름차순 
		List<GoodsDTO>list = service.ASCPriceList(gCategory);
		
		m.addAttribute("list", list);
		return "store/dogshop_main";
	}
	//dogshop_DESCPriceList
	@RequestMapping(value = "/dogshop_DESCPriceList", method = RequestMethod.GET)
	public String dogshop_main3(@RequestParam( value = "gCategory" ) String gCategory,Model m) {
		
		// 가격  내림차순 
		List<GoodsDTO>list = service.DESCPriceList(gCategory);
		
		m.addAttribute("list", list);
		return "store/dogshop_main";
	}
	//dogshop_MostPopular 인기순 클릭시 
	@RequestMapping(value = "/dogshop_MostPopular", method = RequestMethod.GET)
	public String dogshop_main4(@RequestParam( value = "gCategory" ) String gCategory,Model m) {
		
		// 가격  내림차순 
		List<GoodsDTO>list = service.MostPopular(gCategory);
		
		System.out.println("=====MostPopular========>>>>>>"+list);
		System.out.println("=====MostPopular========>>>>>>"+list.size());
		
		
		System.out.println(list);
		
		m.addAttribute("list", list);
		return "store/dogshop_main";
	}
	
	//주문완료
	@RequestMapping(value = "/orderConfirm", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String orderConfirm2(CartDTO cDTO, HttpSession session) {
		session.setAttribute("cDTO", cDTO);
		return "redirect:/orderConfirm";
	}
	
	//리뷰등록
	@RequestMapping(value = "/reviewAdd", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String reviewAdd(MultipartFile file,HttpSession session, ReviewsDTO rDTO, Model model) throws Exception{
		//이미지 처리, 매개변수 MultipartFile도 추가했다.
		String ymdPath = null;
		String fileName = null;
		if(file != null) {
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		}
		int ProductID = rDTO.getProductID();
		
		UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
		//로그인 체크
		if(uDTO == null) {
			model.addAttribute("msg", "로그인이 필요한 기능입니다.");
			return "forward:/goodsRetrieve?gProductID="+ProductID;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("UserID",uDTO.getUserID());
		map.put("ProductID",ProductID);
		
		OrdersDTO oDTO = service.OrderSelect(map);
		System.out.println("oDTO이올시다"+oDTO);
		//해당 상품이 주문정보가 있는지 체크
		if(oDTO == null) {
			model.addAttribute("msg", "상품 구매 후 리뷰 등록이 가능합니다.");
			return "forward:/goodsRetrieve?gProductID="+ProductID;
		}
		//orderFlag가 true라면 리뷰등록 안함. false라면 이미 리뷰등록함.
		if(oDTO.getReviewFlag().equals("false")) {
			model.addAttribute("msg", "이미 리뷰를 등록한 상품입니다.");
			return "forward:/goodsRetrieve?gProductID="+ProductID;
		}
		rDTO.setOrderID(oDTO.getOrderID());
		rDTO.setUserAlias(uDTO.getUserAlias());
		//파일이 없을 때 fileName이 null이기 때문에 조건문추가
		if(fileName != null) {
			rDTO.setrImg(ymdPath + File.separator + fileName);
			rDTO.setrThumbImg(ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		}
		int n = service.addReview(rDTO);
		//리뷰등록에 성공했다면 orderFlag를 true로 바꿔주고 등록 성공 메시지.
		if(n == 1) {
			service.orderFlagUpdate(oDTO.getOrderID());
			model.addAttribute("msg", "리뷰를 등록했습니다");
		}
		return "forward:/goodsRetrieve?gProductID="+ProductID;
	}
	
	
		// 검색기능  
		@RequestMapping(value = "/search", method = RequestMethod.GET)
		public String storeSearch(@RequestParam("SearchName") String SearchName,Model model) {
			List<GoodsDTO>list  = service.searchList(SearchName);
			model.addAttribute("list",list);
			
			return "store/dogshop_main";
		}
	
	
	
	
	
	
}
