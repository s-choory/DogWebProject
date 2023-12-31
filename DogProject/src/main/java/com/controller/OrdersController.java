package com.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.CartDTO;
import com.dto.OrdersDTO;
import com.dto.RequestDTO;
import com.dto.UsersDTO;
import com.service.CartService;
import com.service.OrdersService;
import com.service.RequestService;

@Controller
public class OrdersController {
	
	@Autowired
	CartService service;
	@Autowired
	OrdersService oService;
	@Autowired
	RequestService rService;
			
	//주문확인 페이지
			@RequestMapping(value = "/orderConfirmation", method = RequestMethod.POST)
		    public String orderConfirmation(String cardname, String cardnumber, OrdersDTO ordersdto, HttpSession session) {
				int postnum = ordersdto.getPostNumber();
				//UserID 값 넣기
				UsersDTO usersdto = (UsersDTO) session.getAttribute("User");
				String UserID = usersdto.getUserID();
				int OrderID = ordersdto.getOrderID();
				ordersdto.setUserID(UserID);
				//OrderName 값 넣기 & list의 state 'before' -> 'after'로 변경 
				List<CartDTO> CartDTO_list = (List<CartDTO>)session.getAttribute("orderList");
				String OrderName = "";
		        int total = 0;
		        for (int i = 0; i < CartDTO_list.size(); i++) { 
		        	int n = service.addAfterList(CartDTO_list.get(i), UserID, OrderID);
					total += n;
					OrderName = CartDTO_list.get(0).getProductName();
				}
		        if(total == 1) {
		        	ordersdto.setOrderName(OrderName);
		        } else {
		        	ordersdto.setOrderName(OrderName+"..외 "+total+"개");
		        }
		        //OrderState, paymethodcard, paymethodnumber 값 넣기
		        String paymethod = ordersdto.getPayMethod();
		        if(paymethod.equals("무통장입금")) { // 입금대기 결제완료 배송중 배송완료 배송확정 취소요청 취소완료
		        	ordersdto.setOrderState("입금대기");
		        	ordersdto.setPaymethodcard("없음");
				    ordersdto.setPaymethodnumber("없음");
		        } else {
		        	ordersdto.setOrderState("결제완료"); //입
			        ordersdto.setPaymethodcard(cardname);
			        ordersdto.setPaymethodnumber(cardnumber);
		        }
		        oService.orderInsert(ordersdto);
		        //orderid와 동일한 장바구니 정보 select
		        CartDTO cdto = new CartDTO();
		        cdto.setUserID(UserID);
		        cdto.setOrderNumber(OrderID);
		        List<CartDTO> CartDTO_AfterList = service.selectAfterList(cdto);
		        //OrderTime 값 가져오기 위한 select
		        OrdersDTO odto = oService.orderSelect(OrderID);
		        session.setAttribute("orderDate", odto);
		        session.setAttribute("orderAfterList", CartDTO_AfterList);
		        return "redirect:/orderConfirmation";
		    }

			@RequestMapping(value = "/orderConfirmation", method = RequestMethod.GET)
			public String orderConfirmation2() {
				return "store/orderConfirmation";
			}
			
	//주문리스트
			@RequestMapping(value = "/orderList", method = RequestMethod.GET)
			public String orderList(HttpSession session) {
				UsersDTO udto = (UsersDTO)session.getAttribute("User");
			    	if(udto == null) {
			        return "redirect:/login";
			        }
				String userid = udto.getUserID();
				List<OrdersDTO> olist = oService.ordersAllList(userid);
				List<CartDTO> clist = service.selectOrderAllList(userid);
				session.setAttribute("olist", olist);
				session.setAttribute("clist", clist);
				return "store/orderList";
			}
			
	//고객센터 문의하기  구분
			@RequestMapping(value = "/requestPage", method = RequestMethod.GET)
			public String requestPage(HttpSession session, String userid, @RequestParam("orderid") int requestid) {
				RequestDTO rdto = new RequestDTO();
				if(userid == null) {
					userid = (String) session.getAttribute("request_userid");
				}
				if(requestid == 0) {
					requestid = (int) session.getAttribute("request_requestid");
				}
				rdto.setUserid(userid);
				rdto.setRequestid(requestid);
				List<RequestDTO> rlist = rService.UserOrderSelectList(rdto);
				session.setAttribute("request_userid", userid);
				session.setAttribute("request_requestid", requestid);
				session.setAttribute("request_category", "상품주문");
				session.setAttribute("request_UserOrderSelectList", rlist);
				session.setAttribute("request_PageSee", rlist);
				session.setAttribute("request_num", 1);
				if(rlist.size() == 0) {
					return "request/requestForm";
				} else {
				return "request/requestList";
				}
			}
			@RequestMapping(value = "/requestSave")
			public String requestSave(HttpSession session, RequestDTO dto) {
				rService.AddRequest(dto);
				RequestDTO rdto = new RequestDTO();
				rdto.setUserid(dto.getUserid());
				rdto.setRequestid(dto.getRequestid());
				List<RequestDTO> rlist = rService.UserOrderSelectList(rdto);
				session.setAttribute("request_UserOrderSelectList", rlist);
				return "request/requestList";
			}
			@RequestMapping(value = "/requestPost")
			public String requestPost(HttpSession session, String userid, int requestid, int count) {
				RequestDTO rdto = new RequestDTO();
				rdto.setUserid(userid);
				rdto.setRequestid(requestid);
				rdto.setCount(count);
				session.setAttribute("request_selectone", rdto);
				return "request/requestPost";
			}
			@RequestMapping(value = "/requestList")
			public String requestList(HttpSession session) {
				return "request/requestForm";
			}
			@RequestMapping(value = "/requestRerequest")
			public String requestRerequest(HttpSession session) {
				return "request/requestForm";
			}
			@RequestMapping(value = "/requestPageChange")
			public String requestRerequest(HttpSession session, int num) {
				System.out.println("requestRerequest" + num);
				List<RequestDTO> pageChangList = new ArrayList<RequestDTO>();
 				List<RequestDTO> rlist = (List<RequestDTO>)session.getAttribute("request_UserOrderSelectList");
				int rlistMax = rlist.size();
 				for (int i = rlistMax-(num*9); i < rlistMax-((num-1)*9); i++) {
 					if(i >= 0) {
 					pageChangList.add(rlist.get(i));
 					System.out.println(rlist.get(i));
 					}
				}
				session.setAttribute("request_PageSee", pageChangList);
				session.setAttribute("request_num", num);
				return "request/requestList";
			}
			
}