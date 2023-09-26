<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티-게시물등록</title>
<style type="text/css">
	body {
	    margin: 0;
	    font-family: Arial, sans-serif;
	}
		/* 추가된 스타일 */
	.addPost {
	    margin-left: 10%;
	    max-width: 78%; /* 최대 너비 지정 */
	    padding: 20px;
	    border: 1px solid #ccc;
	    border-radius: 10px;
	    background-color: #f9f9f9;
	}

	.addPost select, .addPost input[type="text"], .addPost textarea {
	    width: 100%;
	    padding: 10px;
	    margin-bottom: 10px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    font-size: 16px;
	}

	.addPost textarea {
	    height: 150px;
	}

	.customButton {
        padding: 5px 10px;
        background-color: #35424a;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
        margin-right: 5px;
    }
    
    /* submit 버튼 스타일 (변경하지 않음) */
    .submitButton {
        padding: 10px 20px;
        background-color: #f8bd24;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
    }

	.addPost button:hover {
	    background-color: #e4a708;
	    transform: translateY(-2px);
	}
	
</style>
</head>

<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>

<div class="addPost">
    <form>
        <label for="dogBreed">견종:</label>
        <select id="dogBreed" style="width:20%">
            <!-- jsp 반복문으로 견종 옵션 넣기. 사용자 반려견을 selected -->
            <option class="dogClass" selected="selected">후추</option>
        </select><br>

        <label for="postTitle">제목 입력:</label><br>
        <input type="text" id="postTitle" placeholder="제목을 입력하세요." style="width:95%"><br>

        <label for="postTags">태그 입력:</label><br>
        <input type="text" id="postTags"  placeholder="태그를 입력하세요. 태그명 앞에 #을 붙여 작성하세요." style="width:95%"><br>

		<button id="boldButton" class="customButton">굵게</button>
		<button id="colorButton" class="customButton">색상</button>
		<button id="fontSizeButton" class="customButton">크기</button><br>
		
		<label>첨부 파일:</label><br>
		<input type="file" id="fileAttachment"><br>
		<label>동영상 첨부:</label><br>
		<input type="file" accept="video/*" id="videoAttachment"><br>
		<label>사진 첨부:</label><br>
		<input type="file" accept="image/*" id="imageAttachment"><br>
        <label for="postContent">글 입력:</label><br>
        <textarea id="postContent" style="width:95%"></textarea><br>

        <button type="submit" class="submitButton">등록</button>
        <button type="reset" class="submitButton" style="background-color: #bbb">초기화</button>
    </form>
</div>

<br>
<jsp:include page = "../common/footer.jsp" flush="true"/><br>

</html>