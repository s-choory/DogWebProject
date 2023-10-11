<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resource/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/resource/styles/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/resource/styles/cart.css">
<link rel="stylesheet" type="text/css" href="resources/resource/styles/cart_responsive.css">
<title>상품주문</title>
<style>
.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

.cart_container {
	padding-top: 0px;
}
</style>
</head>
<body>
<div class="super_container">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	//form submin 이벤트 발생시, 문구출력 후 서브밋정지
	window.addEventListener('load', () => {
		  const forms = document.getElementsByClassName('validation-form');
		  Array.prototype.filter.call(forms, (form) => {
		    form.addEventListener('submit', function (event) {
		      if (form.checkValidity() === false) {
		        event.preventDefault();
		        event.stopPropagation();
		      }
		      form.classList.add('was-validated');
		    }, false);
		  });
		}, false);	
	
	
	//배송정보 전달버튼
	$(document).ready(function(){	
		$("#same").on("click",function(){
			if(this.checked){
				$("#orderName").val($("#mname").val());
				$("#sample4_postcode").val($("#mpost").val());
				$("#sample4_roadAddress").val($("#maddress1").val());
				$("#sample4_jibunAddress").val($("#maddress2").val());
				$("#phone").val($("#mphone").val());
			}else{
				$("#orderName").val("");
				$("#sample4_postcode").val("");
				$("#sample4_roadAddress").val("");
				$("#sample4_jibunAddress").val("");
				$("#phone").val("");
			}
		});//end click 
		
		
	    //주문버튼 - 보류기능
// 	    $("#payBtn").on("click",function(){
//         	$(".validation-form").submit();
//         });
		
		
	});	
</script>

		<form class="validation-form" novalidate action="CartOrderDoneServlet"
			method="get" name="validation-form">
			<div class="container mx-auto">
				<div class="input-form-backgroud row">
					<div class="input-form col-md-12 mx-auto">
						<h4 class="mb-3">주문자 정보</h4>
						<div class="row">


							<!-- 입력란 시작 -->
							<div class="col-md-3 mb-3">
								<label for="name">이름</label> <input type="text"
									class="form-control" name="mname" id="mname" placeholder="이름"
									value="" required>
								<div class="invalid-feedback">이름을 입력해주세요.</div>
							</div>
							<div class="col-md-3 mb-3">
								<label for="name">전화번호</label> <input type="text"
									class="form-control" name="mphone" id="mphone"
									placeholder="전화번호" value="" required>
								<div class="invalid-feedback">전화번호를 입력해주세요.</div>
							</div>
							<div class="col-md-3 mb-3">
								<label for="name">우편번호</label> <input type="text"
									class="form-control" name="mpost" id="mpost" placeholder="우편번호"
									value="" required>
								<div class="invalid-feedback">우편번호를 입력해주세요.</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="name">도로명주소</label> <input type="text"
									class="form-control" name="addr1" id="maddress1"
									placeholder="도로명주소" value="" required>
								<div class="invalid-feedback">도로명주소를 입력해주세요.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="nickname">지번주소</label> <input type="text"
									class="form-control" name="addr2" id="maddress2"
									placeholder="지번주소" value="" required>
								<div class="invalid-feedback">지번주소를 입력해주세요.</div>
							</div>
						</div>

						<!-- 체크박스 -->
						<div class="mb-1"></div>
						<div class="form-check col-md-12">
							<input class="form-check-input" type="checkbox" value=""
								id="same"> <label class="form-check-label"
								for="flexCheckDefault"> 배송지가 동일할 경우 선택하세요. </label>
							<hr class="mb-4">
						</div>



						<h4 class="mb-3">배송지 정보</h4>
						<!-- 입력란 시작 -->
						<div class="row">
							<div class="col-md-3 mb-3">
								<label for="name">이름</label> <input type="text"
									class="form-control" name="ordername" id="orderName"
									placeholder="이름" required>
								<div class="invalid-feedback">이름을 입력해주세요.</div>
							</div>
							<div class="col-md-3 mb-3">
								<label for="name">전화번호</label> <input type="text"
									class="form-control" name="phone" id="phone" placeholder="전화번호"
									required>
								<div class="invalid-feedback">전화번호를 입력해주세요.</div>
							</div>
							<div class="col-md-3 mb-3">
								<label for="name">우편번호</label> <input type="text"
									class="form-control" name="post" id="sample4_postcode"
									placeholder="우편번호" required>
								<div class="invalid-feedback">우편번호를 입력해주세요.</div>
							</div>
							<div class="col-md-3 mb-3">
								<br> <input type="button" class="btn btn-dark"
									value="우편번호 찾기" onclick="sample4_execDaumPostcode()">
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="name">도로명주소</label> <input type="text"
									class="form-control" name="addr1" id="sample4_roadAddress"
									placeholder="도로명주소" value="" required>
								<div class="invalid-feedback">도로명주소를 입력해주세요.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="nickname">지번주소</label> <input type="text"
									class="form-control" name="addr2" id="sample4_jibunAddress"
									placeholder="지번주소" value="" required>
								<div class="invalid-feedback">지번주소를 입력해주세요.</div>
							</div>
						</div>
						<hr class="mb-4">
						<input type="radio" name="payMethod" value="신용카드" checked>
						신용카드 <input type="radio" name="payMethod" value="계좌이체">
						계좌이체 <input type="radio" name="payMethod" value="무통장 입금">
						무통장입금

					</div>
				</div>
			</div>
			<br>

			<!-- 상품정보,헤더 -->
			<div class="cart_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div
								class="cart_bar d-flex flex-row align-items-center justify-content-start">
								<div class="cart_bar_title_name">Product</div>
								<div class="cart_bar_title_content ml-auto">
									<div
										class="cart_bar_title_content_inner d-flex flex-row align-items-center justify-content-end">
										<div class="cart_bar_title_price l-5">Price</div>
										<div class="cart_bar_title_quantity">Quantity</div>
										<div class="cart_bar_title_total">Total</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- 레코드 시작부 -->
					<div class="row">
						<div class="col">
							<div class="cart_products">
								<ul>
									<li
										class=" cart_product d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-start">

										<!-- 상품 이미지 -->
										<div class="cart_product_image">
											<img src="" alt="" width="100">
										</div> <!-- 상품 이름 -->
										<div class="cart_product_name">
											<a href="product.html">이름</a><br> <font size="2"
												color="#665b5f">옵션 색상</font>
										</div>
										<div class="cart_product_info ml-auto">
											<div
												class="cart_product_info_inner d-flex flex-row align-items-center justify-content-md-end justify-content-start">
												<!-- 상품 가격 -->
												<div class="cart_product_price">가격 원</div>
												<!--상품 수량 -->
												<div class="cart_product_price">수량 ea</div>
												<!-- 총합 가격 -->
												<div class="cart_product_total" id="sum">총합 원</div>


											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col">
							<div
								class="cart_control_bar d-flex flex-md-row flex-column align-items-start justify-content-start">
								<button class="button_clear cart_button" id="delAllCart"
									onclick="location.href = 'Main' ">cancel</button>
								<!-- 계속쇼핑하기버튼 -->
								<button class="button_update cart_button_2 ml-md-auto"
									id="payBtn">Payment</button>
							</div>
						</div>
					</div>


				</div>
			</div>

		</form>



<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
 function sample4_execDaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
             var extraRoadAddr = ''; // 도로명 조합형 주소 변수

             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraRoadAddr += data.bname;
             }
             // 건물명이 있고, 공동주택일 경우 추가한다.
             if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if(extraRoadAddr !== ''){
                 extraRoadAddr = ' (' + extraRoadAddr + ')';
             }
             // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
             if(fullRoadAddr !== ''){
                 fullRoadAddr += extraRoadAddr;
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
             document.getElementById('sample4_roadAddress').value = fullRoadAddr;
             document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

             // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
             if(data.autoRoadAddress) {
                 //예상되는 도로명 주소에 조합형 주소를 추가한다.
                 var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                 document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
             } else if(data.autoJibunAddress) {
                 var expJibunAddr = data.autoJibunAddress;
                 document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

             } else {
                 document.getElementById('guide').innerHTML = '';
             }
         }
     }).open();
 }
</script>


</div>
<script src="resources/resource/js/cart_custom.js"></script>
</body>
</html>