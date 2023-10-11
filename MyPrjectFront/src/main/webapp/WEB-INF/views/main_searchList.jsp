<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티-메인화면</title>
<style type="text/css">
	body {
	    margin: 0;
	    font-family: Arial, sans-serif;
	}

	#search {
    width: 40%; /* 너비 조정 */
    margin: 0 auto; /* 가운데 정렬 */
    font-size: 16px; /* 폰트 크기 조정 */
    padding: 3px; /* 내부 여백 설정 */
    display: block; /* 너비를 설정하려면 display를 block으로 변경 */
   	border-radius: 10px;
    }
    
	.category {
        text-align: left; 
        font-size: 24px; 
        margin-top: 20px; 
        margin-left: 5%;
        font-size: 25px;
        font-weight: bolder;
    }
    .others{
        float: right;
        font-size: 24px; 
        margin-top: 4px; 
        margin-right: 5%;
        font-size: 16px;
        font-weight: bolder;
        color : gray;
    }
    .container {
        margin-left: 5%;
        margin-right: 5%;
        border: 1px solid #ccc; /* 테두리 추가 */
        border-radius: 5px;
        padding: 10px; /* 컨테이너 내부에 공간 추가 */
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }

    .post {
        display: flex;
        align-items: flex-start;
        border: 1px solid #ccc;
        padding: 15px;
        border-radius: 5px;
        margin-top: 10px; /* 위쪽 여백을 조절하여 간격 추가 */
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }
    .post img {
        max-width: 150px;
        margin-right: 20px;
    }
     .post-content h3 { 
     font-size: 24px; 
     color: #35424a; 
     margin-top: 0px; 
     margin-bottom: 5px; 
 	} 
	
	.post-content p {
    font-size: 16px;
    color: #666;
	}
	.post-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 10px;
	}
	.post-meta {
	    display: flex;
	    align-items: center;
	}
	.post-meta .like,
	.post-meta .comment {
	    margin-right: 20px;
	    font-size: 14px;
	    color: #666;
	}
	.post-time {
	    font-size: 14px;
	    color: #666;
	}
	
	.product {
        display: inline-block;	/*한줄로 나열*/
        width: 21%;
        margin-left: 0.7%;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }

    .product img {
        max-width: 160px;
        margin-bottom: 10px;
    }

    .product-content h3 {
        font-size: 20px;
        color: #35424a;
        margin-top: 0;
        margin-bottom: 5px;
    }

    .product-content p {
        font-size: 16px;
        color: #666;
    }

    .review {
        font-size: 14px;
        color: gray;
    }
    
    /* 나중에 사이드 마진 조절 */
    .searchList_container{
/*     	margin-left:50px; */
/*     	margin-right:50px; */
    }

</style>
</head>
<body>
<jsp:include page = "common/top.jsp" flush="true"/><br>
<jsp:include page = "common/side.jsp" flush="true"/><br>
<div class="searchList_container">
<h1 style="text-align: center;">검색결과</h1>
<input type="text" id="search" placeholder="입력한 검색어 나옴" value="" />

<!-- 게시물 jsp로 반복문 돌리기 -->
<a class="category">게시글</a>
<a class="others" id="postOthers">더보기 +</a>
<!--  검색어에 대한 게시물 정보유무 if문 처리 -->
    <div class="container" style="margin-left: 5%; margin-right: 5%;">
        <section class="posts">
        <% for(int i = 0; i<2; i++){%>
            <div class="post">
                <img src="resources/a.jpg" id="게시물 1">
                <div class="post-content">
                    <h3>게시물 제목</h3>
                    <p>귀엽고.. 내용이 어쩌구...</p>
                    <div class="post-info">
                        <div class="post-meta">
                            <span class="like">좋아요❤️<span id="Like"></span></span>
                            <span class="comment">댓글<span id="Comment"></span></span>
                        </div>
                        <span class="post-time">2시간 전</span> <!-- 시간 표시 태그 -->
                    </div>
                </div>
            </div>
            <%} %>
        </section>
    </div>
<br>

<a class="category">스토어</a>
<a class="others" id="storeOthers">더보기 +</a>
<div class="container" style="margin-left: 5%; margin-right: 5%;">
    <section class="posts">
    <% for(int i = 0; i<4; i++){%>
        <div class="product">
            <img src="resources/a.jpg" alt="상품 이미지">
            <div class="product-content">
                <h3>상품 이름</h3>
                <p>상품 가격</p>
                <div class="review">리뷰: N개</div>
            </div>
        </div>
    <%} %>
    </section>
</div>
<br>


<a class="category">장소</a>
<a class="others" id="mapOthers">더보기 +</a>
<!--  검색어에 대한 게시물 정보유무 if문 처리 -->
    <div class="container" style="margin-left: 5%; margin-right: 5%;">
        <section class="posts">
        <% for(int i = 0; i<2; i++){%>
            <div class="post">
                <div class="post-content">
                    <h3>병원 or 업소 명칭</h3>
                    <p>장소 카테고리 이름(ex. 동물병원, 동반카페, 펫샵)</p>
                    <div class="post-info">
                        <div class="post-meta">
                            <span class="like">주소<span id="Like"></span></span>
                        </div>
                    </div>
                </div>
            </div>
            <%} %>
        </section>
    </div>
<br>

<a class="category">공지/문의</a>
<a class="others" id="serviceCenterOthers">더보기 +</a>
<!--  검색어에 대한 게시물 정보유무 if문 처리 -->
    <div class="container" style="margin-left: 5%; margin-right: 5%;">
        <section class="posts">
        <% for(int i = 0; i<2; i++){%>
            <div class="post">
                <div class="post-content">
                    <h3>공지..</h3>
                    <p>공지 내용 어쩌구....</p>
                    <div class="post-info">
                    </div>
                </div>
            </div>
            <%} %>
        </section>
    </div>
<br>
</div>
<br>
<jsp:include page = "common/footer.jsp" flush="true"/><br>
</body>
</html>