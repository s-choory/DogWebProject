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

 	.dogtype-wrap{
		display: inline-block;
		text-align: left;
		color: black;
		padding: 10px;
		max-width: 45%;
		max-height: 45%;
		
	}
	.dog-items{
		border: 100px;
		display: flex;
    	flex-direction: column;
    	align-items: center;
	}
	
	.dog-items img{
	  width: 300px;
      height: 300px;
	}
	
	.dog-content{
		font-size: small;
		max-height: 550px;
		max-width: 550px;
	}
	.accordion-button{
		color: black;
	}
	
	#resultDiv{
		
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
<%
 	List<DogTypeDTO> list= (List<DogTypeDTO>)request.getAttribute("list");
	

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
		

		<div class="dogtype-wrap">
			<!-- 이미지 삽입부 -->
			<div class="dog-items">

			<div class="dog-content">
			<img src="resources/DogType/<%= Picture%>.png" border="1"><br>
			<span style="margin-top:20px; font-size:20px;" ><%= DogName%></span><br>
			
			
<div class="accordion" id="accordionPanelsStayOpenExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
        	소개합니다 짜잔!
      </button>
    </h2>
    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
      <div class="accordion-body">
        <span style="margin-buttom:20px; font-size:12px;" >소개: <%= Introduction%></span><br>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
        	성격
      </button>
    </h2>
    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
      <div class="accordion-body">
		<span style="margin-middle:20px; font-size:12px;" >성격: <%= Personality%></span><br>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
        	특징
      </button>
    </h2>
    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
      <div class="accordion-body">
		<span style="margin-buttom:20px; font-size:12px;" >특징: <%= Characteristic%></span><br>
		</div>
    </div>
  </div>
</div>
			
			
			</div>	<!-- dog-items -->
		</div><!-- dogtype-wrap -->
	</div>					
		<%
			}// end for
		%>

</div> <!-- resultDiv -->
<jsp:include page = "../common/footer.jsp" flush="true"/><br>
</body>
</html>