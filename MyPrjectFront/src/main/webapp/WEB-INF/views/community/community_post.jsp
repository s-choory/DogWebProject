<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티-게시물</title>
<style type="text/css">
	body {
	    margin: 0;
	    font-family: Arial, sans-serif;
	}
	
	.box {
    width: 60px;
    height: 60px; 
    border-radius: 70%;
    overflow: hidden;
    
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	.postComment{
		border: 1px solid #ccc;
	    border-radius: 10px;
	    margin-top: 20px;
	    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	    margin-right: 10%;
	}
	.postComment2{
		border: 1px solid #ccc;
	    border-radius: 10px;
	    margin-top: 20px;
	    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	    margin-right: 10%;
	}
	
	  /* 스크롤 고정 입력창 스타일 */
    .fixed-input {
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        background-color: white;
        padding: 10px;
        display: flex;
        align-items: center;
    }
    .input-field {
        flex-grow: 1;
        margin-right: 10px;
        padding: 5px;
        border: 1px solid #ccc;
    }
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
	
</style>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>

<nav class = "title" style="margin-left: 10%;">
	<h1>제목</h1>
	
	<span id ="tag1">태그1</span>
	태그2
</nav>
	<hr align="center" style="border: ridge 3px orange; width: 85%;">
<div class = "postContent" style="margin-left: 10%;">
	<img src="resources/a.jpg" id="로고" width=500 height=300>
	<br>
	<span>게시글 어저구 저쩌구...</span><br>
	file Link:
</div>

<span style="text-align: center; display: block; font-size: 40px">❤️</span>
<span style="text-align: center; display: block;">5</span>
<a style="text-align: right; display: block; margin-right: 20%;">공유</a>
<hr align="center" style="border: ridge 3px orange; width: 85%;">

<div class="postComments" style="margin-left: 10%;">
    N개의 댓글&nbsp&nbsp&nbsp
    최신순<input type="radio" name="commentRadio" value="최신순">
    인기순<input type="radio" name="commentRadio" value="인기순">
    <!-- 사용자 이미지, 닉네임 -->
    <div class="postComment" style="display: flex; align-items: flex-start; margin-top: 10px;">
        <div class="box" style="background: #BDBDBD;">
            <img class="profile" src="resources/a.jpg">
        </div>
        <div style="display: flex; flex-direction: column; margin-left: 10px;">
            <span style="font-size:15px; font-weight: bold;">사용자별명</span>
            <span style="font-size: 8px; color:#bbb">2023-08-14 08:00</span>
            <span style="font-size:12px">댓글내용.. 어쩌구 저쩌구....</span>
            <button style="margin-top: 5px; padding: 2px 5px; font-size: 5px; width: 35px;">답글</button>
        </div>
        <span style="margin-left: auto; margin-right: 10%">🟰</span>
    </div>
    
	<div class="postComment2" style="display: flex; align-items: flex-start; margin-top: 0; margin-left: 10%">
        <div class="box" style="background: #BDBDBD;">
            <img class="profile" src="resources/a.jpg">
        </div>
        <div style="display: flex; flex-direction: column; margin-left: 10px;">
            <span style="font-size:15px; font-weight: bold;">사용자별명</span>
            <span style="font-size: 8px; color:#bbb">2023-08-14 08:00</span>
            <span style="font-size:12px">댓글내용.. 어쩌구 저쩌구....</span>
            <button style="margin-top: 5px; padding: 2px 5px; font-size: 5px; width: 35px;">답글</button>
        </div>
        <span style="margin-left: auto; margin-right: 10%">🟰</span>
    </div>
    
</div>

    <div class="fixed-input">
        <input type="file" id="imageInput" style="display: none;">
        <label for="imageInput" class="attach-button">사진 첨부</label>
        <input type="text" class="input-field" placeholder="내용을 입력하세요...">
        <button class="submit-button">등록</button>
    </div>

<br>
<jsp:include page = "../common/footer.jsp" flush="true"/><br><br><br>
</html>