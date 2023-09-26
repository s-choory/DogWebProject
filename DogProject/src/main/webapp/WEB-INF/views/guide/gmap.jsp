<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<h1> 동물병원 위치 찾기 테스트 </h1><br><br><br><br><br><!-- 웹사이트 카테고리 여백용 -->
<input type="search" id="search-box">
<input type="button" value="검색">
<div id="search-results"></div><br>
<div style="width:800px; height:300px; float:left; margin-right:10px;">
<iframe
height="300"
width="800"
style="border:0"
loading="lazy"
allowfullscreen
src="https://www.google.com/maps/embed/v1/place?key=AIzaSyB8Qu5wxAHCx1ZScxQwe-3Q9JkNVRj58w8&q=에이콘아카데미 강남점&region=KR&language=ko"></iframe>
</div>
<!-- google embed API 기본위치 -->
<div style="overflow:auto; width:450px; height:300px; float:left;">
<table border="1">
<tr>
<td>
<img src="image/a.jpg" width="100" height="100">
</td>
<td>
a병원<br><br>
aaaaa시 aaaaaaa구 영업시간 aaaa~aaaaa
</td>
</tr>
<tr>
<td>
<img src="image/a.jpg" width="100" height="100">
</td>
<td>
a병원<br><br>
aaaaa시 aaaaaaa구 영업시간 aaaa~aaaaa
</td>
</tr>
<tr>
<td>
<img src="image/a.jpg" width="100" height="100">
</td>
<td>
a병원<br><br>
aaaaa시 aaaaaaa구 영업시간 aaaa~aaaaa
</td>
</tr>
<tr>
<td>
<img src="image/a.jpg" width="100" height="100">
</td>
<td>
a병원<br><br>
aaaaa시 aaaaaaa구 영업시간 aaaa~aaaaa
</td>
</tr>
</table>
</div>
<br>

<br>

</body>
</html>