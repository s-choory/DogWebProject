<%@page import="com.dto.UsersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Exo:wght@300&family=Gamja+Flower&family=Gowun+Dodum&family=Hi+Melody&display=swap" rel="stylesheet">
<style type="text/css">

	.column{
		flex-direction:column;
	}
	
    .header-container{
    	height:350px;
    	background-image: url("resources/헤더배경2.jpg");
	   	background-size: 100% auto; /* 이미지 크기 조정 */
	    background-attachment: fixed; /* 배경 이미지 고정 */
    }
    
	header {
	    padding: 10px 0;
	    text-align: center;
 	  	width: 100%; 
 	  	-webkit-transform:scale(1.0);  /*  크롬 */
 	  	font-family: 'Exo', sans-serif;
 	  	text-shadow: 0px 0 #000, 0 0.2px #F0FFF0, 0 0.2px #000, 0 -0px #000;"
/* font-family: 'Gamja Flower', sans-serif; */
/* font-family: 'Gowun Dodum', sans-serif; */
/* font-family: 'Hi Melody', sans-serif; */
	}
	.header-nav {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    margin-top: 20px; /* 상단 여백 조정 */
	}

	.header-icorn{
		margin-right: 50%;
	}
	
    .header-link {
        margin: 0 15px;
        padding: 10px 15px;
        background-color: transparent; /* 배경 없음 */
        color: #97C19C; /* 글씨 색상 */
        border-radius: 5px;
        text-transform: uppercase;	/*대문자 변환*/
        font-weight: bold;
        text-decoration: none;
        transition: color 0.3s, transform 0.3s;
        font-size: 22px;
    }
	
/* 	마우스 커서 올리면 이벤트 */
    .header-link:hover {
        color: #F49551; /* 호버 시 글씨 색상 변경 */
        transform: translateY(2px);
    }
	
    .login-link {
        padding: 8px 15px;
        color: #97C19C; /* 글씨 색상 */
        text-decoration: none;
        font-size: 16px;
        margin-left: 5px;
        transition: color 0.3s, transform 0.3s, text-decoration 0.3s;
    }

    .login-link:hover {
    	color: #F49551; /* 호버 시 글씨 색상 변경 */
        text-decoration: underline; /* 밑줄 설정 */
		transform: translateY(2px);
    }
    .header-top{
    }
    .header-bottom {
        display: flex;
        justify-content: flex-end;
		font-weight: bold;
     	margin-right: 5%;
    }
</style>
<div class='header-container column'>
    <header>
		<nav class="header-nav">
			<a href="/test/main" class="header-icorn"><img src="${pageContext.request.contextPath}/resources/메인아이콘테스트1.png" id="로고" width=170 height=170></a>
			<div class="header-top">
				<a href="/test" class="header-link">Community</a>
				<a href="/test/dogshop_main" class="header-link">Store</a>
				<a href="/test/MoIm" class="header-link">Group</a>
				<a href="/test/map" class="header-link">Map</a>
			</div>

		</nav>
	    	<div class="header-bottom">
				<% 
			   UsersDTO User = (UsersDTO)session.getAttribute("User");
			   if(User == null){
			   %>
		      	
			    <a href="/test/login" class="login-link" title="로그인"><img src="${pageContext.request.contextPath}/resources/강아지로그인아이콘.png" width=60 height=60><br>Login</a>
			    <a href="/test/membership_agree" class="login-link" title="회원가입"><img src="${pageContext.request.contextPath}/resources/강아지회원가입아이콘.png" width=70 height=60><br>Membership</a>
			    <%
			   }else{
			    %>
			    <a href="/test/logout" class="login-link" style="color:red"><img src="${pageContext.request.contextPath}/resources/강아지로그아웃아이콘.png" width=60 height=60><br>Logout</a>
			    <a href="/test/mypage" class="login-link"><img src="${pageContext.request.contextPath}/resources/마이페이지아이콘.png" width=60 height=60><br>MyPage</a>
			    <a href="/test/cartList" class="login-link"><img src="${pageContext.request.contextPath}/resources/장바구니아이콘.png" width=60 height=60><br>Cart</a>
			    <%} %>
			</div>
	</header>
</div>


