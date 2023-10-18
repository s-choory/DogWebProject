<%@page import="com.dto.PostsDTO"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	#로고 {
    display: block;
    margin: 0 auto;
    padding-bottom: 20px;
    padding-top: 10px;
	}
	#search {
    width: 600px; /* 너비 조정 */
    margin: 0 auto; /* 가운데 정렬 */
    font-size: 16px; /* 폰트 크기 조정 */
    padding: 3px; /* 내부 여백 설정 */
    display: block; /* 너비를 설정하려면 display를 block으로 변경 */
   	border-radius: 10px;
    }
    
    .icon{
    display: flex;
  	justify-content: center;
 	align-items: center;
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
    	height: 150px;
        width: 150px;
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
        width: 15%;
        margin-left: 0.7%;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    }

    .product img {
        max-width: 160px;
        margin-bottom: 10px;
        max-height: 120px;
        display: block; /* 이미지를 블록 요소로 설정하여 가로 중앙 정렬 */
    	margin: 0 auto; /* 좌우 여백을 auto로 설정하여 가로 중앙 정렬 */
    }

    .product-content h3 {
        font-size: 20px;
        color: #35424a;
        margin-top: 0;
        margin-bottom: 5px;
        white-space: nowrap; /* 텍스트가 한 줄에 나타나도록 설정 */
    	overflow: hidden; /* 넘치는 부분은 숨김 처리 */
    	text-overflow: ellipsis; /* ...으로 생략 처리 */
    }

    .product-content p {
        font-size: 16px;
        color: #666;
    }

    
    /* 나중에 사이드 마진 조절 */
    .searchList_container{
/*     	margin-left:50px; */
/*     	margin-right:50px; */
    }

</style>

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      $('#search').keypress(function(event) {
        if (event.which === 13) { 
          event.preventDefault(); 
          var searchValue = $(this).val();
          window.location.href = '/test/main_searchList?search='+ encodeURIComponent(searchValue);
        }
      });
    });
    </script>
</head>
<body>
<jsp:include page = "common/top.jsp" flush="true"/><br>
<jsp:include page = "common/side.jsp" flush="true"/><br>
<div class="searchList_container">
<a href="main"><img width="64" height="64" src="https://img.icons8.com/cotton/64/dog--v5.png" alt="dog--v5"/></a>
<a href="main"><img width="64" height="64" src="https://img.icons8.com/cotton/64/dog--v6.png" alt="dog--v6"/></a>
<a href="main"><img width="64" height="64" src="https://img.icons8.com/external-smashingstocks-circular-smashing-stocks/65/external-dog-national-dog-day-smashingstocks-circular-smashing-stocks-15.png" alt="external-dog-national-dog-day-smashingstocks-circular-smashing-stocks-15"/></a>
<a href="main"><img width="64" height="64" src="https://img.icons8.com/cotton/64/dog-sit--v2.png" alt="dog-sit--v2"/></a>
<a href="main"><img width="64" height="64" src="https://img.icons8.com/cotton/64/dog-heart--v3.png" alt="dog-heart--v3"/></a>
<a href="main"><img width="64" height="64" src="https://img.icons8.com/cotton/64/dog-heart--v1.png" alt="dog-heart--v1"/></a>
<a href="main"><img width="64" height="64" src="https://img.icons8.com/external-justicon-flat-justicon/64/external-dog-dog-and-cat-justicon-flat-justicon-1.png" alt="external-dog-dog-and-cat-justicon-flat-justicon-1"/></a>
<a href="main"><img width="64" height="64" src="https://img.icons8.com/external-smashingstocks-circular-smashing-stocks/65/external-dog-national-dog-day-smashingstocks-circular-smashing-stocks.png" alt="external-dog-national-dog-day-smashingstocks-circular-smashing-stocks"/></a>
<a href="main"><img width="64" height="64" src="https://img.icons8.com/avantgarde/100/jake.png" alt="jake"/></a>
<a href="main"><img width="64" height="64" src="https://img.icons8.com/cotton/64/footprint-scanning--v1.png" alt="footprint-scanning--v1"/></a>
<a href="main"><img width="64" height="64" src="https://img.icons8.com/color/96/dog-house.png" alt="dog-house"/></a>
<a href="main"><img width="64" height="64" src="https://img.icons8.com/3d-fluency/94/dog-house.png" alt="dog-house"/></a>
<a href="main"><img width="64" height="64" src="https://img.icons8.com/external-photo3ideastudio-gradient-photo3ideastudio/64/external-pawprint-pet-shop-photo3ideastudio-gradient-photo3ideastudio.png" alt="external-pawprint-pet-shop-photo3ideastudio-gradient-photo3ideastudio"/></a>
<a href="main"><img width="64" height="64" src="https://img.icons8.com/external-creatype-glyph-colourcreatype/64/external-animal-pet-shop-creatype-glyph-colourcreatype.png" alt="external-animal-pet-shop-creatype-glyph-colourcreatype"/></a>

<input type="text" id="search" placeholder="검색어를 입력하세요" value="" />
</div>
<br>
<div class="icon">
<!-- 종분류 --><a href="/test"><img width="85" height="85" src="https://img.icons8.com/color/96/puppy.png" alt="puppy"/></a>&nbsp;&nbsp;&nbsp;
<!-- 커뮤니티 --><a href="/test"><img width="85" height="85" src="https://img.icons8.com/color/96/chat--v1.png" alt="chat--v1"/></a>&nbsp;&nbsp;&nbsp;
<!-- 스토어 --><a href="/test/dogshop_main"><img width="85" height="85" src="https://img.icons8.com/color/96/shopping-bag--v1.png" alt="shopping-bag--v1"/></a>&nbsp;&nbsp;&nbsp;
<!-- 모임찾기 --><a href="/test/MoIm"><img width="85" height="85" src="https://img.icons8.com/color/96/group-task.png" alt="group-task"/></a>&nbsp;&nbsp;&nbsp;
<!-- 맵 --><a href="/test/map"><img width="85" height="85" src="https://img.icons8.com/color/96/where.png" alt="where"/></a>&nbsp;&nbsp;&nbsp;
<!-- 공지문의 --><a href="/test/ContactCenter_FAQ"><img width="85" height="85" src="https://img.icons8.com/color/96/help--v1.png" alt="help--v1"/></a>
</div>
<br><br>
<!-- 게시물 jsp로 반복문 돌리기 -->
<a class="category">인기글</a>
<a class="others" id="postOthers" href="../test/">더보기 +</a>
<!--  검색어에 대한 게시물 정보유무 if문 처리 -->
    <div class="container" style="margin-left: 5%; margin-right: 5%;">
        <section class="posts">
        <%
    LocalDateTime sysdate = LocalDateTime.now();
    List<PostsDTO> post = (List<PostsDTO>)request.getAttribute("popular");
    if (post != null && !post.isEmpty()) {
    for(int i=1;i<=post.size();i++){ 
    	PostsDTO dto = post.get(i-1);
    	int postid=dto.getPostID();
    	String authorid=dto.getAuthorID();
    	String title=dto.getTitle();
    	String post_content=dto.getContent();
    	String textOnly =  post_content.replaceAll("<[^>]+>", "");
    	String previewText = textOnly.substring(0, Math.min(textOnly.length(), 50)) + (textOnly.length() > 50 ? "..." : "");
    	int likes = dto.getLikes();
   		String category= dto.getCategory();
   		String postimage=dto.getImage();
   		String defaultimage="resources/default.jpg";
   	/* 	LocalDateTime creationtime = dto.getCreationtime();
   		Duration durationtime = Duration.between(creationtime,sysdate);
   		long differenceInHours=durationtime.toHours(); */
   		Pattern pattern = Pattern.compile("<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");
        Matcher matcher = pattern.matcher(post_content);
        if (matcher.find()) {
            postimage = matcher.group(1);
     }
   		if (postimage==null) postimage=defaultimage;
 %>
            <div class="post">
            <a href="post?postid=<%=postid%>">
   
       <img src="resources/PostImg/<%=postimage%>" alt="">
    
                </a>
                <div class="post-content">
                    <h3><%=title %></h3>
                    <p><%=previewText %></p>
                    <div class="post-info">
                        <div class="post-meta">
                            <span class="like">좋아요❤️<%=likes%><span id="Like"></span></span>
                            <span class="comment">댓글<span id="Comment"></span></span>
                        </div>
                        
                        <%-- <span class="post-time"><%=differenceInHours%>시간 전</span> <!-- 시간 표시 태그 --> --%>
                    </div>
                </div>
            </div>
            
            <%}
    }%>
        </section>
    </div>
    
<br>
<a class="category">스토어-할인</a>
<a class="others" id="storeOthers" href="dogshop_main">더보기 +</a>

<div class="container" style="margin-left: 5%; margin-right: 5%; white-space: nowrap; overflow: auto;  ">
    <section class="posts">
    <%
    List<GoodsDTO> list = (List<GoodsDTO>)request.getAttribute("random");
    if(list !=null &&!list.isEmpty()){
    for(int i=1;i<=list.size();i++){
    	GoodsDTO dto = list.get(i-1);
    	
    	int productid=dto.getPRODUCTID();
    	String productname=dto.getPRODUCTNAME();
    	String category=dto.getCategory();
    	String content=dto.getContent();
    	int price = dto.getPrice();
    	String image = dto.getImage();
    	int stockquantity = dto.getSTOCKQUANTITY();
 %>
        <div class="product">
        <a href="goodsRetrieve?productid=<%=productid%>">
            <img src="resources/storeimages/<%=image %>.jpg" alt="상품 이미지">
            </a>
            <div class="product-content">
                <h3><%=productname %></h3>
                <p><%=price*0.8%>원/ 20% 할인</p>
            </div>
        </div>
    <%} }%>
    </section>
</div>
<br>



<br>
<jsp:include page = "common/footer.jsp" flush="true"/><br>
</body>
</html>