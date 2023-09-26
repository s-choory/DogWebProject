<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>고객센터/문의하기</title>
<link rel="stylesheet" href="resources/css2/CC.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<div class="ContactCenter_Top">
	<div class="ContactCenter_Top_Name" align="center">고객센터</div>
	<table class="ContactCenter_Choice_Table">
		<tr>
			<td/>
			<td rowspan="2" class="ContactCenter_Choice_Yes" id="Notice">공지사항</td>
			<td rowspan="2" class="ContactCenter_Choice_No" id="FAQ">FAQ</td>
			<td/>
		</tr>
		<tr>
			<td class="ContactCenter_Choice_Side"/>
			<td class="ContactCenter_Choice_Side"/>
		</tr>
	</table>
</div>
<div class="ContactCenter_Notice">
	<table class="ContactCenter_Notice_Table">
		<tr>
			<td class="ContactCenter_Notice_Top_Count">번호</td>
			<td class="ContactCenter_Notice_Top_Name">제목</td>
			<td class="ContactCenter_Notice_Top_Writer">작성자</td>
			<td class="ContactCenter_Notice_Top_Uploaddate">작성일</td>
			<td class="ContactCenter_Notice_Top_Count">조회</td>
		</tr>
	<% 
	for(int i = 1; i <= 10; i++) { %>
    <tr>
        <td class="ContactCenter_Notice_Bottom_Center"><%= i %></td>
        <td class="ContactCenter_Notice_Bottom_Left">예시입니다</td>
        <td class="ContactCenter_Notice_Bottom_Center">운영자</td>
        <td class="ContactCenter_Notice_Bottom_Center">2023-08-15</td>
        <td class="ContactCenter_Notice_Bottom_Center">1</td>
    </tr>
	<% } %>
	</table>
</div>
</body>
</html>
