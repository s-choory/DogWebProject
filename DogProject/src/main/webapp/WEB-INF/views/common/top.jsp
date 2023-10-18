<%@page import="com.dto.UsersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">

	header {
	    padding: 10px 0;
	    text-align: center;
	}
	.header-nav {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    margin-top: 20px; /* 상단 여백 조정 */
	}

    .header-link {
        margin: 0 15px;
        padding: 10px 15px;
        background-color: transparent; /* 배경 없음 */
        color: #35424a; /* 글씨 색상 */
        border-radius: 5px;
        text-transform: uppercase;
        font-weight: bold;
        text-decoration: none;
        transition: color 0.3s, transform 0.2s;
        font-size: 22px;
    }
	
/* 	마우스 커서 올리면 이벤트 */
    .header-link:hover {
        color: #f8bd24; /* 호버 시 글씨 색상 변경 */
        transform: translateY(-2px);
    }
	
    .login-container {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        margin-right: 20px;
		font-weight: bold;
    }

    .login-link {
        padding: 8px 15px;
        color: black; /* 글씨 색상 */
        text-decoration: none;
        font-size: 18px;
        margin-left: 5px;
        transition: font-weight 0.3s, text-decoration 0.3s;
    }

    .login-link:hover {
        font-weight: bold; /* 글씨 굵게 설정 */
        text-decoration: underline; /* 밑줄 설정 */
    }
</style>
    <header>
      <nav class="header-nav">
    	<%-- <img src="${pageContext.request.contextPath}/resources/a.jpg" id="로고" width=60 height="60"> --%>
    	<a href="main"><img width="64" height="64" src="https://img.icons8.com/cotton/64/dog-sit--v2.png" alt="dog-sit--v2"/></a>
        <a href="/test" class="header-link">커뮤니티</a>
        <a href="/test/dogshop_main" class="header-link">스토어</a>
        <a href="/test/MoIm" class="header-link">모임찾기</a>
        <a href="/test/map" class="header-link">반려맵</a>
    </nav>
    </header>

	<div class="login-container">
	<% 
   UsersDTO User = (UsersDTO)session.getAttribute("User");
   if(User == null){
   %>
    <a href="/test/login" class="login-link">로그인</a>
    <a href="/test/membership_agree" class="login-link">회원가입</a>
    <%
   }else{
    %>
    <a href="/test/logout" class="login-link">로그아웃</a>
    <a href="/test/mypage" class="login-link">마이페이지</a>
    <a href="/test/cartList" class="login-link">장바구니</a>
    <%} %>
</div>
<!-- <hr style="border: solid 1px #F9D182; "> -->
