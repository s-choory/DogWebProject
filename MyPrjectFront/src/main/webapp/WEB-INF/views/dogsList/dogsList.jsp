<%@page import="java.util.List"%>
<%@ page import="com.dto.DogTypeDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>untitle</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	/* 버튼동작부  */
	$(".btn").on('click', (e) => {
		let dogSize = e.target.value;
		location.href='dogsList?dogSize='+dogSize;
	});
	
	/* 검색란동작부 */
	$("#search").on('keyup', (e) => {
		let dogSearch = '';
		if(e.keyCode == 13){
			dogSearch = e.target.value;
			location.href='dogSearch?dogSearch='+dogSearch;
		}
	});

	
	
});
</script>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<!-- 최종 -->
<!-- 상단 클릭 버튼 구현 -->
<table border= "1"> <!-- 테이블 1 -->
<!-- <form action="" method="get" id= "pet"> -->
	<div style= "text-align: center"> <!-- input type center정렬 -->
		<button class="btn" >기본</button>
		<button value="small" class="btn" >소형견</button>
		<button value="big" class="btn" >대형견</button>
<!-- 		<input type="button" value="소형견" id="small-dog"> -->
<!-- 		<input type="button" value="대형견" id="large-dog"> -->
		<!-- 기능보류 -->
		<!-- <input type="button" value="인기순" id= "popularity"> -->
		<input type="search" name="search" placeholder="검색창" id="search" >
	</div>
<!-- </form> -->
</table><!-- 테이블 1 end -->
<!-- 상단 클릭 버튼 구현 끝 -->

<!-- 검색창 구현 -->
<table>
	<div style= "text-align: center">
		
	<!-- <input type="submit" value="검색하기"> -->
	</div>
</table>
<!-- 검색창 구현 끝 -->
<!-- 리스트 관련 데이터 뿌리기 -->
<div id="resultDiv">
<table width="100%" cellspacing="0" cellpadding="0">

	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">
				
				<tr>
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="black"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>

				<tr>
				
<%
 	List<DogTypeDTO> list= (List<DogTypeDTO>)request.getAttribute("list");
	System.out.println("JSP ===== "+list.size());
	%>
<%
	for(int i= 1; i<= list.size(); i++){
		DogTypeDTO dto= list.get(i -1);
		String DogName= dto.getDogName();
		String Picture= dto.getPicture();
	    String Personality= dto.getPersonality();
	    String Characteristic= dto.getCharacteristic();
	    String Introduction= dto.getIntroduction();
	    String Size= dto.getdogSize();
	    int Popularity= dto.getPopularity();
		%>
		
						<td>
							<table style='padding:15px'>
								<tr>
									<td>
										<a href="GoodsRetrieveServlet?gCode=T1"> 							

			<div style="display:inline-block; text-align: left; color:black"><!-- margin?? padding??-->
			<!-- 이미지 삽입부 -->
			<img src="resources/img/dog/<%= Picture%>.png" border="1" align="left" width="200" height="200">
			<span style="margin-top:20px;font-size:15px;" >견종: <%= DogName%></span><br>
			<span style="margin-middle:20px;font-size:12px;" >성격: <%= Personality%></span><br>
			<span style="margin-buttom:20px;font-size:12px;" >특징: <%= Characteristic%></span><br>
			------------------------------ <br>
			<span style="margin-buttom:20px;font-size:12px;" >소개: <%= Introduction%></span><br>
			</div>	
										</a>
									</td>
								</tr>

							</table>
						</td>
					<!-- 한줄에 2개씩 보여주기 -->	
				    
				   <%
				   if(i%2 ==0){%>
						<tr>
						<td height= '10'>
						</tr>
					<%	}//end if
				   %>		
						
<%
	}// end for
%>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>
</div>
<jsp:include page = "../common/footer.jsp" flush="true"/><br>
</body>
</html>