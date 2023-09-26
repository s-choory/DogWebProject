<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOPPING MAIN</title>
<link rel="stylesheet" href="#">   
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(function () {
	
    // 클릭 이벤트 핸들러 등록
    $(document).on('click', '.shop_list', function () {
        var num = $(this).attr("data-xxx");
        console.log(num);
        var gProductID = $("#gProductID" + num).val();
        console.log(gProductID);
        var gCategory = $("#gCategory" + num).val();
        console.log(gCategory);
		
        //AJAX 응답으로 받은 데이터(response)에서 특정 영역인 .clcikmig_left, .clcickmig_right' 클래스가 있는 부분만 추출하여 해당 영역들만 업데이트하고, 
        //그 후에는 해당 부분들이 화면에 표시되도록 CSS 속성(display: flex;`)을 설정
        $.ajax({
            url: "goodsRetrieve",
            method: "GET",
            data: { gProductID: gProductID, gCategory: gCategory },
            success: function (response) { //응답받은 data를 이용해 .clickimg 클랙스를 가진 요소의 내용을 업데이트함
                var $response = $(response); //응답 데이터를 jQuery 객체로 변환하여 $response 변수에 저장.
                var clickImgLeftContent = $response.find('.clickimg_left').html(); 
                //$response 객체에서 .clickimg_left 클래스를 가진 요소의 HTML 내용을 추출하여 clickImgLeftContent 변수에 저장.
                var clickImgRightContent = $response.find('.clickimg_right').html();
                
                $(".clickimg .clickimg_left").html(clickImgLeftContent);
                //.clickimg .clikcimge_left선택자로.clickimg클래스를 가진 요소 내부에서.clikcimge_left클래스를 가진 요소의 HTML 내용을clickImgLeftContent` 값으로 업데이트.
                $(".clickimg .clickimg_right").html(clickImgRightContent);
                
                $(".clickimg").css("display", "flex"); // none => flex : 화면에 표시되도록 CSS 속성 변경
            },
            error: function (xhr, status, error) {
                console.error(error);
            }
        });
    });

    const clickimg = $(".clickimg");

    $(document).on('scroll', function() {
        if (clickimg.is(":visible")) { // 이미 보여지고 있는 경우에는 숨기지 않음
            clickimg[0].scrollIntoView(); // 화면 초점 이곳으로 이동
        }
    });

    $(document).on('click', '#closehidden', function () {
        console.log("xzzzz");
        $("#clickimg").css("display","none"); // 닫기 버튼 클릭시 숨김
    });
    
    // 구매 버튼 클릭시  상세구매페이지로 이동 
/*   $(document).on('click', '#buyitem', function () {
	var gProductID = $("#hiddengProductID2").val();
		console.log(">>>>>",gProductID); 
		 $.ajax({
		        url: "goodsRetrieve",
		        method: "POST",
		        data: { gProductID: gProductID },
		        success: function (response) {
		        	console.log(1111111)
		            // 필요없음 컨트롤러의 return이 실행됨
		            window.location.href = "goodsRetrieve.jsp"; // 성공적으로 응답 받으면 response 값으로 리다이렉션
		        },
		        error: function (xhr, status, error) {
		            console.error(error);
		        }
		    });
		
});
*/  
	//구매 버튼 클릭시  상세구매페이지로 이동   (위 코드처럼 비동기 쓰면 오류가 너무 많이나서 간단하게 교체)
	$(document).on('click', '#buyitem', function () {
		var gProductID = $("#hiddengProductID2").val();
			console.log(">>>>>",gProductID); 
			// 폼 선택 후 제출
	        $('#myForm').submit();
	    });
    
    
    
    
    
    
});//end dom
</script>
	
	
	<style>
	
		/*폰트 적용*/
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
		
		html {
		    font-family: "Noto Sans KR", sans-serif;
		}
		
        * { margin: 0; padding: 0; } 
        li { list-style: none; }
       	a { text-decoration: none; }
	</style>

	<style type="text/css"> /* 상품카테고리 */
        .shop_click {
    display: flex;
    justify-content: center; /* 가로 중앙 정렬 */
		}
		
		.shop_click > ul {
		    list-style: none;
		    padding: 0;
		    margin: 0;
		}
		
		.shop_click > ul > li {
		    display: inline-block;
		}
		
		.shop_click > ul > li > a {
		    display: block;
		    padding: 10px 20px;
		    border: 1px groove black;
		}
		
		.shop_click > ul > li:first-child > a { 
		    border-radius: 10px 0 0 10px; 
		}
		
		.shop_click > ul > li:last-child > a {  
		     border-radius: 0 10px 10px 0; 
		}

    </style>
    
    
    
    <style type="text/css"> /* 상품list */
        .listlist {
		    max-width: 1100px;
		    margin: auto;
		    display: flex;
		    justify-content: center; /* 가로 중앙 정렬 */
		}
		
        .listlist .shop_list{
        	display: flex;
			flex-wrap: wrap; /* 상위요소 너비보다 하위요소 너비가 클때 줄바꿈 */
    		justify-content: center;
			
		}
    
        .shop_array {
		  display: flex;
		}
		
		.shop_array a {
		  align-items: center;
		  background-color: gray;
		  color: yellow;
		  border: none;
		  padding:15px;
		  border-radius: 10px;
		  min-height:30px; 
		  min-width:120px;
		}
        
        .shop_array a:hover {
	     	 background-color:blue;
	     	 transition: 0.7s;  /* 전환 시 부드럽게 */
  		}
  		
  		.shop_array a:active {
   			 background-color: red; /* 클릭 시 */
   			 transition: 0.0s;  /* 전환 시 부드럽게 */
		}
		
  		.shop_array a .desc {
   			white-space: pre-wrap;
		}

		
		.shop_list {
			float: left;
        	border: 2px solid black; 
			background-color: white; 
			padding: 15px; 
			width: 200px;
			height: 200px;
			border-radius: 10px;
			margin: auto;
			
        }
        
        .shop_list img {
         	display: flex;
    		justify-content: center;
      		margin:auto;
      		background-color: red;
        } 
        
        .shop_list .listName {
      		text-align: center;
        }
        
        .shop_list .listPrice {
      		text-align: center;
        } 
		
	
		.shop_list  {
		    width: calc(100% / 5);/* 칸 나누기 */
		}
		
		.shop_list > ul > li > .listName {
		    text-align: Center;
		    font-weight: bold;
		}
		.shop_list > ul > li:hover > .listName {
		    text-decoration: underline;
		}
		.shop_list > ul > li > .listPrice {
		    text-align: center;
		    font-weight: normal;
		}
		.shop_list > ul > li > .listPrice::after {
		    content: "원";
		    font-weight:normal;
		}
	
		
		.listfor{
			display: flex;
    		justify-content: center;
		}

		/* 히든 부분 스타일 */
		.clickimg {
		  display: none;
		  position: fixed; /* 고정 위치 */
		  top: 50%; /* 화면 세로 중앙 정렬 */
		  left: 50%; /* 화면 가로 중앙 정렬 */
		  transform: translate(-50%, -50%); /* 가운데 정렬 */
		
		  border: 2px solid black;
		  width: 700px;
		  height:300px;
		  
		  background-color: white; 
		  padding:15px;
		}
		
		.clickimg_left {
		  width: 40%;
		  height:60px;
		}
		
		.clickimg_right {
		  width: 60%;
		  height:60px;
		}



    </style>

</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<div class="shop_click">
	<ul>
		<li><a href="dogshop_main?gCategory=장난감">장난감</a></li>
        <li><a href="dogshop_main?gCategory=식기">관련용품</a></li>
        <li><a href="dogshop_main?gCategory=의류">옷</a></li>
        <li><a href="dogshop_main?gCategory=사료">사료</a></li>
        <li><a href="dogshop_main?gCategory=간식">간식</a></li> 
	</ul>
</div>
<div class="listlist">
	<div class="shop_array">
		<%
			// 지금 열려있는 특정 카태고리를 컨트롤러에 담아 보내주기 위해 파싱 과정 
			List<GoodsDTO>list3 = (List<GoodsDTO>) request.getAttribute("list");
			//list3가 null이거나 비어있을 때에 대한 처리를 추가했습니다. 따라서, list3가 null이 아니고 특정 값이 있다면 해당 값을 사용하여 원하는 동작을 수행할 수 있습니다.
			GoodsDTO dto3 = null;
			String gCategory3 = "";

			if (list3 != null && !list3.isEmpty()) {
				dto3 = list3.get(0);
				gCategory3 = dto3.getCategory();
		%>
		<div><a href="dogshop_MostPopular?gCategory=<%=gCategory3%>" id= "popul">인기순</a></div>
		<div><a href="dogshop_ASCPriceList?gCategory=<%=gCategory3%>" id= "h_price">가격낮은순</a></div>
		<div><a href="dogshop_DESCPriceList?gCategory=<%=gCategory3%>" id= "l_price">가격높은순</a></div>
		<%
		}
		%>
		<!-- a 태그로 교체  -->
		<!-- <div><input type="button" value="인기순" id= "popul"></div>
		<div><input type="button" value="가격높은순" id= "h_price"></div>
		<div><input type="button" value="가격낮은순" id= "l_price"></div> -->
		<!-- <div><input type="button" value="오름차순" id= "asc"></div>
		<div><input type="button" value="내림차순" class= "desc"></div> -->
	</div>
</div>	

<!--////////////////// hidden + 이미지 클릭시 상세정보    /////////////////////////// -->
<% 
	GoodsDTO dto2= (GoodsDTO)request.getAttribute("selectlist");   // 제품들중 선택된 한녀석만의 데이터 정보 
    //dto2가 null인경우 기본이 실행되도록 if문으로 묶기 	
	if(dto2 == null){
		String gName2 = "";
        int gPrice2 = 0;
        String gImage2 = "";
        int gProductID2 = 0;
        String gCategory2 = "";
        String gContent2 = "";		
        int gAmount2 = 0;
%>
<div class="clickimg" id="clickimg">
    <div class="clickimg_left">
        <img src="resources/storeimages/장난감1.jpg" alt="" width="100%" height="100%" id="image" class="image">
    </div>
	<div class="clickimg_right">
    	<ul>
    		<li>z</li>
    		<li>z</li>
    		<li>z</li>
    		<li>z</li>
    	</ul>
    </div>
</div>
<%
} else {
    String gName2 = dto2.getPRODUCTNAME();
    int gPrice2 = dto2.getPrice();
    String gImage2 = dto2.getImage();
    int gProductID2 = dto2.getPRODUCTID();
    String gCategory2= dto2.getCategory();
    String gContent2=	dto2.getContent();		
    int gAmount2=	dto2.getSTOCKQUANTITY();

%>
<div class="clickimg" id="clickimg">
     <div class="clickimg_left">
         <% if (gImage2 == null || gImage2.isEmpty()) { %>
             <img src="resources/storeimages/장난감1.jpg" alt="" width="100%" height="100%"  class=image>
         <% } else { %>
             <img src="resources/storeimages/<%=gImage2%>.jpg" alt="" width="100%" height=="100%" class=image >
         <% } %>  
     </div>
	 <div class="clickimg_right">
    	<ul>
    		<li> <%=gName2%></li><br>
    		<li> <%=gContent2%></li><br>
    		<li>제품가격: <%=gPrice2%></li><br>
    		<li>남은재고: <%=gAmount2%></li><br>
    	</ul>
			<div>
				<input type="button" value="구매" id="buyitem">
			</div>
			<div>
				<input type="button" value="닫기" id="closehidden">
			</div>
			<!--  히든으로  -->
			<form id="myForm" action="/test/goodsRetrieve" method="POST">
				<!--  특정값 넘기기 위해  폼 추가  -->
				<div>
					<input type="hidden" name="gProductID" value="<%=gProductID2%>"
						id="hiddengProductID2">
				</div>
			</form>
		</div>
</div>
<%
}
%>    

<!--////////////////// hidden + 이미지 클릭시 상세정보    /////////////////////////// -->

	
<div class="listfor">
	<form action="">
	<% 
	List<GoodsDTO>list = (List<GoodsDTO>) request.getAttribute("list");
	//int a = 12; //리스트 화면노출 갯수 지정
	//data-xxx= Num 
	if(list !=null ){
	for(int i = 1; i <= list.size(); i++) { 
		GoodsDTO dto = list.get(i-1);
		String gName = dto.getPRODUCTNAME();
		int gPrice = dto. getPrice();
		String gImage = dto.getImage();
		//여기 밑에 4개는 히든으로 넘김 
		int gProductID = dto.getPRODUCTID();
		String gCategory = dto.getCategory();
		String gContent = dto.getContent();		
		int gAmount = dto.getSTOCKQUANTITY();	 
	%>
	<div data-xxx="<%=i%>" class="shop_list" >
		<ul class="row">
			<li class="cell">
	            <div class="img-box"><img src="resources/storeimages/<%=gImage%>.jpg" alt="" width="150" height="150" id="image<%=i%>" class="image"></div>
	            <div id="listName<%=i%>" class="listName"><%=gName%></div>
	            <div id="listPrice<%=i%>" class="listPrice"><%=gPrice%></div>
	            <input type="hidden" name="gProductID" value="<%=gProductID%>" id="gProductID<%=i%>">
	            <input type="hidden" name="gCategory" value="<%=gCategory%>" id="gCategory<%=i%>">
	            <input type="hidden" name="gContent" value="<%=gContent%>">
	            <input type="hidden" name="gAmount" value="<%=gAmount%>">
	        </li>
        
        </ul>
	</div>
	<% } } %>
	 </form>
</div>
<br>
<jsp:include page = "../common/footer.jsp" flush="true"/><br>
</body>
</html>