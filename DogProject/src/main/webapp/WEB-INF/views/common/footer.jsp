<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
    .footer {
        padding: 10px;
        background-color: #E4E4E4;
        color: #54595F;
        border:10px solid red;
    }
    
    .footer-topcontainer{
    	display: flex;
    	border:10px solid blue;
    }
    
    .footer-container1{
    	margin-left:10%;
    	border:10px solid yellow;
    }
	
    .footer-container2{
    	border:10px solid green;
    	
    }
	
</style>
<footer class="footer">

<div class="footer-topcontainer">
	<div class="footer-container1">
		도기도기 라이프<br>
		도기도기 크리에이터즈<br>
		도기도기 컴백홈<br>
		이용약관<br>
		개인정보처리방침<br>
		사업자정보확인
	</div>
	<div class="footer-container2">
		<img src="${pageContext.request.contextPath}/resources/강아지로그인아이콘.png" width=60 height=60>
	</div>
</div>

<div class="footer-middlecontainer">Follow Us</div>

<div class="footer-bottomcontainer">
	<div class="footer-container3">
		도기도기 주식회사 | 대표 김선동
		서울특별시 강남구 테헤란로 124 5층 501호
		통신판매업신고번호: 2023-서울강남-06234
		사업자등록번호: 123-45-78900
		호스팅: Amazon Web Services
	</div>
	<div class="footer-container4">
		© 2023 All Rights Reserved    
	</div>
</div>
</footer>