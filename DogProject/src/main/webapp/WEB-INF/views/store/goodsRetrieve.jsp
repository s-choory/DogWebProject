<%@page import="com.dto.UsersDTO"%>
<%@page import="com.dto.ReviewsDTO"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">
.container {
	margin-left: 10%;
	margin-right: 10%;
}

.product-info {
	display: block;
	font-size: 0;
	margin: 0 -5px;
}

.product-options {
	display: inline-block;
	width: 32%;
	padding: 0 5px; /* 간격을 위해 각 너비에 준 패딩 5px을 줌 */
	vertical-align: middle; /* 나란히 배치하는 와중에 수직정렬도 가운데로 하려고 준 속성 */
	text-align: center; /* 영역 안 태그들의 텍스트가 center로 오도록 준 속성 */
}

.product-options2 {
	display: inline-block;
	width: 1%;
	vertical-align: middle; /* 나란히 배치하는 와중에 수직정렬도 가운데로 하려고 준 속성 */
}

/* 옵션과 수량 버튼 스타일 조정 */
.product-options select, .product-options button {
	width: auto; /* 기본 너비 유지 */
	margin-right: 10px; /* 버튼 간격 조절 */
}

/* 추가적인 스타일링을 위한 CSS를 여기에 추가할 수 있습니다. */

/* 세로선 스타일 */
.vertical-line {
	border-left: 1px dotted; /* 세로선 스타일 */
	height: 100%; /* 부모 컨테이너 높이와 동일하게 설정 */
	/* 	    margin-left: 20px; /* 세로선과 상세 정보 간격 조절 */
	*/
}

.detail {
	margin-left: 10%;
	margin-right: 10%;
}

.detail img {
	width: 900px;
	height: 500px;
	margin-bottom: 5px;
	margin: auto;
	display: block;
}

.updown {
	border: 1px solid black;
	width: 0.1px;
	height: 300px;
}

.catecontainer {
	margin-left: 20%;
	margin-right: 20%;
	display: flex; /* 가로로 배치 */
	justify-content: space-between; /* 각 요소 사이의 간격을 최대로 설정 */
	position: sticky; /* 스크롤시 화면 상단에 고정 */
	top: 0; /* 상단에 고정시킵니다. */
	z-index: 1000; /* 다른 요소 위에 놓이도록 설정 */
	text-align: center; /* 텍스트 가운데 정렬 */
}

.catecontainer a {
	text-decoration: none;
	color: #333;
	margin-left: 30px;
	margin-right: 30px;
	padding: 10 30px; /* 각 링크의 여백 설정 */
	transition: background-color 0.3s; /* 배경색 변화 애니메이션 */
	font-size: 20px;
	border: 1px solid;
}

.catecontainer a:hover {
	background-color: #000; /* 호버 시 배경색 변경 */
	color: white;
	font-weight: bold;
}
/* 스크롤 고정 입력창 스타일 */
/*    .fixed-input {
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        background-color: white;
        padding: 10px;
        display: flex;
        align-items: center;
    }
    .input-review {
        flex-grow: 1;
        margin-right: 10px;
        padding: 5px;
        border: 1px solid #ccc;
    }*/
.attach-button {
	padding: 5px 10px;
	background-color: #f8bd24;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.submit-button {
	padding: 5px 10px;
	background-color: #35424a;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#Rating fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#Rating fieldset legend {
	text-align: right;
}

#Rating input[type=radio] {
	display: none;
}

#Rating label {
	font-size: 2em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#Rating label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#Rating label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#Rating input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

.img{
    width: auto;
    border-radius: 10px;
    cursor: pointer;
    transition: 0.3s;
  }
  /* 이미지 클릭 시, 밝기 조절 */
  .img:hover {opacity: 0.8;}

  .modal {
    display: none; /* 모달창 숨겨 놓기 */
    position: fixed; 
    z-index: 1; /* 모달창을 제일 앞에 두기 */
    padding-top: 100px;
    left: 0; top: 0;
    width: 100%; height: 100%;
    overflow: auto; /* 스크롤 허용 auto */
    cursor: pointer; /* 마우스 손가락모양 */
    background-color: rgba(0, 0, 0, 0.8);
  }
  /* 모달창 이미지 */
  .modal_content {
    margin: auto;
    display: block;
    width: 50%; height: auto;
    max-width: 1000px;
    border-radius: 10px;
    animation-name: zoom;
    animation-duration: 0.8s;
  }
  /* 모달창 애니메이션 추가 */
  @keyframes zoom {
    from {transform: scale(0)}
    to {transform: scale(1)}
  }
  /* 닫기 버튼 꾸미기 */
  .close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
  }
  .close:hover, .close:focus{
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
  }

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		$("#up").click(function(){
			$("#gAmount").attr("value",parseInt($("#gAmount").attr("value"))+1);
		});
		$("#down").click(function(){
			if(parseInt($("#gAmount").attr("value")) > 1)
			$("#gAmount").attr("value",parseInt($("#gAmount").attr("value"))-1);
		});
		
        $(".catecontainer a").click(function (event) {
            event.preventDefault();
            var targetSection = $(this).attr("href"); // 클릭한 링크의 href 값 가져오기
            $("html, body").animate({
				scrollTop: $(targetSection).offset().top,},
                1000 // 스크롤 animation 시간
            );
        });
// 		$("#review-button").click(function(){
// 			console.log($("#review-content").val());
// 		});
	});
	
	function reqCheck(str){
		if(str == 'order'){
			if(confirm("해당 상품을 바로 구매하시겠습니까?"))
				if($("#pSize").val() == '사이즈선택' || $("#Color").val() == '옵션선택'){
					event.preventDefault();
					alert("상품 옵션을 선택하세요");
				}else{
					$("#myForm").attr("action","orderConfirm");
					$("#myForm").submit();
				}
			else{
				event.preventDefault();
			}
		}		
		if(str == 'cart'){
			if($("#pSize").val() == '사이즈선택' || $("#Color").val() == '옵션선택'){
				event.preventDefault();
				alert("상품 옵션을 선택하세요");
			}else{
				$("#myForm").attr("action","addCartList");
				$("#myForm").submit();	
			}
		}		
	}
	
	function reviewUpdate(str, ReviewID){
		console.log(str+'\t'+ReviewID);
		if(str == 'update'){
			if(confirm("해당 리뷰를 수정하시겠습니까?"))
				$("#reviewForm"+ReviewID).attr("action","");
			else{
				event.preventDefault();

			}
		}		
		if(str == 'del'){
			if(confirm("해당 리뷰를 삭제하시겠습니까?"))
				$("#reviewForm"+ReviewID).attr("action","delReview");
			else{
				event.preventDefault();
			}
		}		
	}

<% 
	String msg = (String)request.getAttribute("msg");
	if(msg != null){%>
		alert("<%=msg%>");
<%	
	}
	request.removeAttribute("msg");
%>
</script>
<body>
	<%
 	GoodsDTO dto= (GoodsDTO)request.getAttribute("list");
	String gName = dto.getPRODUCTNAME();
	int gPrice = dto. getPrice();
	String gImage = dto.getImage();
	int gProductID = dto.getPRODUCTID();
	String gCategory = dto.getCategory();
	String gContent = dto.getContent();		
	int gAmount = dto.getSTOCKQUANTITY();
%>
	<jsp:include page="../common/top.jsp" flush="true" /><br>
	<jsp:include page="../common/side.jsp" flush="true" /><br>
	<div class="container">
		<!-- 상품 정보 컨테이너 -->
		<div class="product-info">
			<!-- 상품 이미지 -->
			<form id="myForm" method="post">
				<input type="hidden" name="ProductID" value="<%=gProductID%>">
				<input type="hidden" name="Image" value="<%=gImage%>"> <input
					type="hidden" name="ProductName" value="<%=gName%>"> <input
					type="hidden" name="Price" value="<%=gPrice%>">

				<div class="product-options">
					<img src="resources/storeimages/<%=gImage%>.jpg" align="left"
						style="width: 400px; height: 300px;">
				</div>
				<!-- 상품 제목과 상세 정보 -->
				<div class="product-options" style="margin-right: 30px;">
					<span style="font-size: 30px;"><%=gName%></span><br>
					<br>
					<hr>
					<br>
					<div style="font-size: 15px;">
						가격:
						<%=gPrice%></div>
					<br>
					<div style="font-size: 15px;">배송 방법: 택배</div>
					<br>
					<div style="font-size: 15px;">배송비: 3500원 (도서 산간지역 별도 배송비 추가)</div>
					<br>
					<div style="font-size: 15px;">
						특징:
						<%=gContent%></div>
				</div>
				<!-- 상품 옵션과 주문 수량 -->
				<div class="product-options2" style="margin-right: 0px;">
					<div class="updown"></div>
				</div>
				<div class="product-options" style="width: 17%">
					<div style="font-size: 16px;">

						사이즈: <select class="select_change" size="1" name="Psize"
							id="pSize">
							<option selected value="옵션선택">사이즈선택</option>
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
							<option value="XL">XL</option>
						</select><br> 색상: <select class="select_change" size="1" name="Color"
							id="Color">
							<option selected value="옵션선택">옵션선택</option>
							<option value="navy">navy</option>
							<option value="black">black</option>
							<option value="ivory">ivory</option>
							<option value="white">white</option>
							<option value="gray">gray</option>
						</select>
					</div>
					<div class="options-and-quantity">
						<div class="td_title">주문수량</div>
						<div style="padding-left: 10px">
							<!-- 패딩 조절 -->
							<input type="text" class="form-control" name="Amount" value="1" id="gAmount" aria-describedby="basic-addon1" style="text-align: right; height: 18px; width: 40px;">
							<img src="resources/up.PNG" id="up">+ 
							<img src="resources/down.png" id="down">-
						</div>
						<button type="button" class="btn btn-primary " onclick="reqCheck('order')">구매</button>
						<button type="button" class="btn btn-primary" onclick="reqCheck('cart')">장바구니</button>
					</div>
				</div>
			</form>
		</div>
		<br>
		<br>
		<hr>
		<div class="catecontainer">
			<a href="#product-info">상품정보</a> <a href="#detail-info">상세안내</a> <a
				href="#product-review">상품리뷰</a>
		</div>

		<!-- </form> -->
		<nav>
			<h2 id="product-info">상품 정보</h2>
		</nav>
		<!-- 상품상세 정보 -->
		<div class="detail">
			<img src="resources/storeimages/<%=gImage%>.jpg" alt="상세페이지1">
			<img src="resources/storeimages/<%=gImage%>.jpg" alt="상세페이지2">
			<img src="resources/storeimages/<%=gImage%>.jpg" alt="상세페이지3">
		</div>
		<div class="detail" id="detail-info">
			<nav>
				<h2>상세 안내</h2>
			</nav>
			<hr>
			<!-- <script type="text/javascript"> -->
			<p>배송 기간 안내</p>
			<p>- 평균배송기간 : 결제완료 후 3일 이내 발송, 발송 후 3일이내 수령(영업일 기준)</p>
			<p>*도서/산간 지역의 경우 1~2일정도 더 소요될 수 있습니다.&nbsp;</p>
			<p>
				<br>
			</p>
			<p>교환 및 반품안내</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				단순 변심으로 인한 교환&middot;환불은 상품 수령 7일 이내에 신청, 왕복 택배비 6,000원을 동봉하여 주시길
				바랍니다.&nbsp;</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>주문
				금액이 100,000원 미만으로 배송비를 지불해주셨다면 동봉금 없이 편도 택배비만 부담합니다.</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>주문
				금액이 100,000원 이상으로 무료 배송인 경우에는 왕복 택배비 6,000원을 부담해주셔야 합니다.</p>
			<div
				style='margin: 0px; padding: 0px; outline: none; color: rgb(0, 0, 0); font-family: "Nanum Gothic", "Noto Sans KR", "Malgun Gothic", "맑은 고딕", AppleGothic, Dotum, 돋움, sans-serif !important;'>
				<br style="margin: 0px; padding: 0px;">
			</div>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				받으신 상품의 교환&middot;반품은 7일 이내 &nbsp;소비자 상담실(00-0000-0000)로 신청 바랍니다.</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				무통보 교환&middot;반품 시, 교환&middot;반품 접수가 처리되지 않습니다.</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				개봉스티커가 훼손된 경우 교환&middot;환불이 불가합니다.&nbsp;</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				상품 하자, 오배송의 경우 수령일로부터 3개월 이내, 그 사실을 알 수 있었던 날로부터 30일 이내까지 교환∙반품이
				가능합니다. (교환/반품비 당사부담)</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				반품 택배 발송은 구매자님께서 발송해주셔야 합니다.</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>&nbsp;&nbsp;</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>교환/반품/환불
				불가할 경우</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>1.
				구매자의 귀책으로 제품이 멸실되거나 훼손된 경우.</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>2.
				구매자의 사용 및 소비로 인해 제품의 가치가 떨어진 경우</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>3.
				시간이 지나 다시 판매하기 곤란할 정도로 제품의 가치가 떨어진 경우</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>4.
				반품/교환 가능 기간을 초과한 경우</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>5.
				회수된 제품이 누락됐거나 입고가 확인되지 않은 경우</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>&nbsp;</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>취소,교환,환불등은
				소비자기본법에 따른 소비자분쟁해결기준(공정거래위원회 고시)에 의거하여 처리됨을 알려드립니다.</p>
			<p>
				<br>
			</p>
			<p>환불안내</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>결제별
				환불안내</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>&nbsp;-
				무통장 결제</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>반품
				보내주실 때 계좌번호, 은행명, 예금주를 적어서 보내주시거나 소비자 상담실(00-0000-0000), 상품문의, 1:1
				문의 남겨주시길 바랍니다.</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>
				<br style="margin: 0px; padding: 0px;">
			</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>-
				핸드폰 결제 핸드폰 결제는 부분취소가 불가능하며, 당월 결제금에 대해서만 결제 취소할 수 있습니다.</p>
			<>
			<p>만일, 부분취소를 희망하시면 취소하지 않는 상품의 가격과 배송비를 자사 입금계좌에 입금해 주시면 전체취소로
				취소가 진행됩니다.</p>
			<p>또한, 당월이 지난 환불건에 대해서는 수수료를 제외한 나머지 금액을 현금으로 환불해 드립니다. &nbsp;</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>
				<br style="margin: 0px; padding: 0px;">
			</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>&nbsp;-
				실시간 계좌이체, 카드</p>
			<p
				style='margin: 0px 0px 3px; padding: 0px; outline: none; color: rgb(51, 51, 51); font-family: Roboto, "Nanum Gothic", Verdana, Dotum, AppleGothic, sans-serif; word-break: break-all; background-color: rgb(255, 255, 255);'>&nbsp;부분
				취소가 불가능하며 취소하지 않으신 상품의 가격과 배송비를 입금해주시면 주문 전체 취소로 처리됩니다.</p>
			<p>
				<br>
			</p>
			<p>AS안내</p>
			<p
				style='margin: 0px; padding: 0px; outline: none; color: rgb(0, 0, 0); font-family: "Nanum Gothic", "Noto Sans KR", "Malgun Gothic", "맑은 고딕", AppleGothic, Dotum, 돋움, sans-serif !important; word-break: break-all;'>-
				소비자분쟁해결 기준(공정거래위원회 고시)에 따라 피해를 보상받을 수 있습니다.</p>
			<p
				style='margin: 0px; padding: 0px; outline: none; color: rgb(0, 0, 0); font-family: "Nanum Gothic", "Noto Sans KR", "Malgun Gothic", "맑은 고딕", AppleGothic, Dotum, 돋움, sans-serif !important; word-break: break-all;'>-
				고객센터(00-0000-0000) / 1:1 문의주시면 빠르게 답변해드리겠습니다.</p>
			<!-- </script> -->
		</div>
		<p
			style="margin: 20px 0; padding: 21px 26px 20px 19px; line-height: 20px; font-size: 14px; color: #757c8a; background: #fafafa; border-radius: 2px; white-space: normal;">
			소비자가 전자상거래등에서 소비자 보호에 관한 법률 제 17조 제1항 또는 제3항에 따라 청약철회를 하고 동법 제 18조
			제1항 에 따라 청약철회한 물품을 판매자에게 반환하였음에도 불구 하고 결제 대금의 환급이 3영업일을 넘게 지연된 경우,
			소비자 는 전자상거래등에서 소비자보호에 관한 법률 제18조 제2항 및 동법 시행령 제21조 2에 따라 지연일수에 대하여
			전상법 시행령으로 정하는 이율을 곱하여 산정한 지연이자(“지연배상금”)를 신청할 수 있습니다. 아울러, 교환∙반품∙보증 및
			결제대금의 환급신청은 [마이페이지]에서 하실 수 있으며, 자세한 문의는 고객센터로 연락하여 주시기 바랍니다.</p>
		<!-- 구매평 -->

		<div class="review" id="product-review">
			<nav>
				<h3>리뷰작성</h3>
			</nav>
		
			<hr>
			<form id="reviewForm" action="reviewAdd" method="post" enctype="multipart/form-data">
			<input type="hidden" name="ProductID" value="<%=gProductID%>">
				<div class="mb-3" id="Rating">
				<fieldset name="Rating">
					<input type="radio" name="Rating" value="5" id="rate1">
						<label for="rate1">⭐</label> 
					<input type="radio" name="Rating" value="4" id="rate2">
						<label for="rate2">⭐</label> 
					<input type="radio" name="Rating" value="3" id="rate3">
						<label for="rate3">⭐</label> 
					<input type="radio" name="Rating" value="2" id="rate4">
						<label for="rate4">⭐</label> 
					<input type="radio" name="Rating" value="1" id="rate5">
						<label for="rate5">⭐</label>
				</fieldset>
			</div>
			<div class="select_img" contenteditable="true"><img src="" /></div><br>
			<label for="rImg" class="attach-button">사진 첨부</label>
			<input type="file" id="rImg" name=file style="display: none;"/>
			<textarea id="review-content" name="ReviewContent"
				style="width: 80%; height: 60px; resize: none;"
				placeholder="리뷰를 입력하세요.&#10;해당 상품의 구입내역을 가진 회원만 리뷰 작성 가능합니다."></textarea>
				<button id="review-button" class="submit-button">등록</button>
			</form>
<%-- 			<%= request.getRealPath("/") %> --%>
			<hr>
			<nav>
				<h3>상품리뷰</h3>
			</nav>
<% 
			 List<ReviewsDTO> rList = (List<ReviewsDTO>)request.getAttribute("ReviewList"); 
			 for(int i=0; i<rList.size(); i++){
				 int ReviewID = rList.get(i).getReviewID();
				 String UserAlias = rList.get(i).getUserAlias();
				 String CreationTime = rList.get(i).getCreationTime();
				 double Rating = rList.get(i).getRating();
				 String ReviewContent = rList.get(i).getReviewContent();
				 String rImg = rList.get(i).getrImg();
				 String rThumbImg = rList.get(i).getrThumbImg();
				 
				 double sum = 0;
				 int n = 0;
				 if(Rating != 0){
					 n++;
				 }
				 sum = sum + Rating;
%>
			<ul>
				<li>
					<div>
						<span><%= UserAlias %></span> <span
							style="font-size: 11px; color: #FFAF0A;"> <% if(Rating == 5) {%>
							<span>⭐⭐⭐⭐⭐</span> <% } else if(Rating == 4) {%> <span
							style="font-size: 11px; color: #FFAF0A;">⭐⭐⭐⭐</span> <% } else if(Rating == 3) {%>
							<span style="font-size: 11px; color: #FFAF0A;">⭐⭐⭐</span> <% } else if(Rating == 2) {%>
							<span style="font-size: 11px; color: #FFAF0A;">⭐⭐</span> <% } else if(Rating == 1) {%>
							<span style="font-size: 11px; color: #FFAF0A;">⭐</span> <% } %>

						</span> <br> <span
							style="font-size: 11px; color: gray; font-weight: bolder;"><%= CreationTime %></span>
					</div> <%if(ReviewContent != null){ %>
					<p><%= ReviewContent %></p> <% } %> <%if(rThumbImg != null){ %> <img
					src="<%= rThumbImg %>" class="img" data-xxx="<%=rImg%>">
					<div class="modal" id="<%=rImg%>">
						<span class="close">&times;</span> <img class="modal_content"
							id="img01">
					</div> <%} %> <!-- 댓글 수정 폼-->
					<form class="collapse multi-collapse-{{id}}">
						                    
						<div class="form-group">
							                        
							<textarea class="form-control" id="comment-content" rows="3">{{comment}}</textarea>
							                    
						</div>

						<button type="button" id="btn-comment-update"
							class="btn btn-outline-primary bi bi-pencil-square">수정</button>
					</form>
<% UsersDTO user = (UsersDTO)session.getAttribute("User");
	if(user != null){
			if(user.getUserAlias().equals(UserAlias)) { %> 
					<form id="reviewForm<%=ReviewID%>" method="post">
						<input type="hidden" name="ReviewID" value="<%=ReviewID%>">
						<input type="hidden" name="ProductID" value="<%=gProductID%>">
						<button class="btn btn-danger btn-sm"
							onclick="reviewUpdate('del', <%=ReviewID%>)">삭제</button>
					</form>
					<button class="btn btn-primary btn-sm" type="button"
						data-bs-toggle="collapse"
						data-bs-target="#collapseExample<%=ReviewID%>"
						aria-expanded="false" aria-controls="collapseExample">수정</button>
<% } }%>
					<div class="collapse" id="collapseExample<%=ReviewID%>">
						<div class="card card-body">
							<form id="reviewUpdateForm" action="updateReview" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="ReviewID" value="<%=ReviewID%>">
								<input type="hidden" name="ProductID" value="<%=gProductID%>">
								<div class="mb-3" id="Rating">
									<span style="font-size: 20px; color: #FFAF0A;"> <%
								 	if (Rating == 5) {
								 %> <span>⭐⭐⭐⭐⭐</span> <%
								 	} else if (Rating == 4) {
								 %> <span style="font-size: 20px; color: #FFAF0A;">⭐⭐⭐⭐</span> <%
								 	} else if (Rating == 3) {
								 %> <span style="font-size: 20px; color: #FFAF0A;">⭐⭐⭐</span> <%
								 	} else if (Rating == 2) {
								 %> <span style="font-size: 20px; color: #FFAF0A;">⭐⭐</span> <%
								 	} else if (Rating == 1) {
								 %>
								<span style="font-size: 20px; color: #FFAF0A;">⭐</span> <%
								 	}
								 %>
									</span>
									<span style="color: gray; font-size: 11px;">(평점과 이미지는 수정할 수 없습니다.)</span>
								</div>
								<div class="select_img" id="select_img" contenteditable="true">
									<img src="<%= rThumbImg %>" />
								</div>
								<textarea id="review-content" name="ReviewContent"
									style="width: 80%; height: 60px; resize: none;"
									placeholder="리뷰를 입력하세요.&#10;해당 상품의 구입내역을 가진 회원만 리뷰 작성 가능합니다."><%= ReviewContent %></textarea>
								<button id="review-button" class="submit-button">수정</button>
							</form>

						</div>
					</div>
				</li>
			</ul>
			<hr>
			<%
				}
			%>
			<!-- 리뷰 사진 등록 -->

	<script type="text/javascript">
		//사진첨부
		$("#rImg").change(function(){
			if(this.files && this.files[0]){
				var reader = new FileReader;
				reader.onload = function(data){
					$(".select_img img").attr("src", data.target.result).width(500);
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		
		//모달창 이벤트 
		$(".img").click(function() {
			var imageUrl = $(this).data("xxx");
			modalDisplay("block");
			$(".modal_content").attr("src", imageUrl);
		})
		$(".close").click(function() {
			modalDisplay("none");
		})
		$(".modal").click(function() {
			modalDisplay("none");
		})

		function modalDisplay(text) {
			$(".modal").attr("style","display:"+text);
		}
	</script>

		</div>
	</div>
	<jsp:include page="../common/footer.jsp" flush="true" /><br>
</body>
</html>

