<%@page import="java.util.List"%>
<%@ page import="com.dto.DogTypeDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견종백과</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
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
<style type="text/css">
	.dogtype{
		display: inline-block;
		text-align: left;
		color: black;
		padding: 10px;
		border: 10px;
	}
</style>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<!-- 최종 -->
<!-- 상단 클릭 버튼 구현 -->
<table border= "1"> <!-- 테이블 1 -->
	<div style= "text-align: center">
		<button class="btn" >전체</button>
		<button value="small" class="btn" >소형견</button>
		<button value="medium" class="btn" >중형견</button>
		<button value="large" class="btn" >대형견</button>
		<!-- 기능보류 -->
		<!-- <input type="button" value="인기순" id= "popularity"> -->
		<input type="search" name="search" placeholder="검색창" id="search" >
	</div>
</table><!-- 테이블 1 end -->

<!-- 리스트 관련 데이터 뿌리기 -->
<div id="resultDiv">
<!-- <table width="100%" cellspacing="0" cellpadding="0">

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

				<tr> -->
				
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
		
						<!-- <td>
							<table style='padding:15px'>
								<tr>
									<td> -->

			<div class="dogtype">
			<!-- 이미지 삽입부 -->
			<img src="resources/DogType/<%= Picture%>.png" border="1" align="left" width="200" height="200">
			<span style="margin-top:20px; font-size:15px;" ><%= DogName%></span><br>
			
			<span style="margin-middle:20px; font-size:12px;" >성격: <%= Personality%></span><br>
			<span style="margin-buttom:20px; font-size:12px;" >특징: <%= Characteristic%></span><br>
			------------------------------ <br>
			<span style="margin-buttom:20px; font-size:12px;" >소개: <%= Introduction%></span><br>
			</div>	
<!-- 									</td>
								</tr>

							</table>
						</td> -->
					<!-- 한줄에 2개씩 보여주기 -->	
				    
				   <%
				   if(i%2 ==0){%>
						<!-- <tr>
						<td height= '10'>
						</tr> -->
						<div></div>
					
					<%	}//end if
				   %>		
						
<%
	}// end for
%>
<!-- 				</tr>
			</table>
		</td>
	</tr> -->
	<!-- <tr>
		<td height="10">
	</tr> -->
<!-- </table> -->
</div>
<jsp:include page = "../common/footer.jsp" flush="true"/><br>
</body>
</html>