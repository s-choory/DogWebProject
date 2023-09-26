<%@page import="com.dto.AccompanyingFacilitiesDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Hi+Melody&display=swap" rel="stylesheet">
<style type="text/css">

	body {
	    margin: 0;
	    padding: 0;
	    font-family: Arial, sans-serif;
  	}
	.container {
		margin-left: 10%;
	}
	.address{
		margin-left: 50px;
		border-style:groove;
		border-radius: 5px;
		font-size:16px;
/* 		font-family: 'Gamja Flower', cursive; */
	}
	#addressSearch{
		font-weight: bolder;
		background : yellow;
/* 		font-family: 'Hi Melody', cursive; */
		border-color: white;
	}
	
	.place-title{
/* 		font-family: 'Gamja Flower', cursive; */
		font-weight: bolder; 
		color:#FF9B00; 
		text-decoration:underline; 
		font-size: 24px;
		margin: 7px 0; /* 상하 간격 설정 */
	}
	.place-content{
/* 		font-family: 'Gamja Flower', cursive; */
	    font-size: 16px; /* 글자 크기 설정 */
	    margin: 10px 0; /* 상하 간격 설정 */
	    /* 다른 스타일 속성들도 필요한 대로 추가하세요. */
	}
	.place-colum {
		font-size:10px;
		font-family: Arial, sans-serif;
	    color: #E4E4E4; /* 글자 색상 설정 */
	    background-color: gray;
	    margin : 3px;
	    padding : 3px;
	    border-radius: 10px;
	}
		
    /* 부모 div 스타일링 */
    .map-container {
        display: flex;
        align-items: flex-start; /* 수직 정렬을 맨 위로 설정 */
        justify-content: space-between; /* 수평 간격을 최대로 설정 */
    }

    .map {
        flex: 1; /* 맵이 부모 div의 남은 영역을 모두 차지하게 함 */
        width: 70%; /* 맵의 크기 설정 */
        height: 400px;
    }

    .map-text {
        flex: 1; /* 텍스트가 부모 div의 남은 영역을 모두 차지하게 함 */
        width: 30%; /* 텍스트의 크기 설정 */
        box-sizing: border-box; /* padding 포함한 크기 지정 */
    }
    .address{
    	width:300px;
    	height:25px;
    }
	.text-container {
        flex: 1; /* 텍스트 컨테이너가 부모 div의 남은 영역을 모두 차지하게 함 */
        width: 500px; /* 텍스트 컨테이너의 크기 설정 */
        padding: 10px; /* 텍스트 주위에 간격 추가 */
        box-sizing: border-box; /* padding 포함한 크기 지정 */
        background-color: #FFF; /* 배경색 설정 */
        overflow: auto; /* 스크롤 가능하도록 오버플로 속성 설정 */
        max-height: 463px; /* 텍스트 컨테이너의 최대 높이 설정 */
        border-radius: 10px; /* 스크롤 바의 둥근 모서리 */

    }
	.text-container::-webkit-scrollbar {
   	 width: 23px; /* 스크롤 바의 너비 */
	}
	
	.text-container::-webkit-scrollbar-thumb {
		
		background: linear-gradient( to top, #FFC846, #FFB432, #FF9614, #FF8200);
	    border-radius: 6px; /* 스크롤 바의 둥근 모서리 */
	}

	.text-container::-webkit-scrollbar-track {
   	 	border-radius: 10px;
	    background: linear-gradient( to bottom, #FFEB46, #FFDC37, #FFC31E, #FFB914);
	}   
 
	.link-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-size: 50px;
    }
  
    .link-AccomPlace {
        margin-left: 20%;
        box-sizing: border-box; /* padding 포함한 크기 지정 */
        text-decoration: none;
        font-weight: bold;
        border-radius: 5px;
        color: #fff;
		text-decoration: none;
        padding: 10px 20px;
        border-radius: 15px;
        font-family: 'Poppins', Arial, sans-serif; /* 원하는 글꼴로 변경 */
        transition: background-color 0.3s, color 0.3s;
		background-color: gray;        
    }
    .link-hospital {
        flex: 1; /* 텍스트가 부모 div의 남은 영역을 모두 차지하게 함 */
        margin-left: 15%;
        box-sizing: border-box; /* padding 포함한 크기 지정 */
        margin-right: 33%;
		color: #fff;
		text-decoration: none;
        font-weight: bold;
		font-family: 'Poppins', Arial, sans-serif; /* 원하는 글꼴로 변경 */
        padding: 10px 20px;
        border-radius: 15px;
        transition: background-color 0.3s, color 0.3s;
        background-color: gray;
        
    }
    .categoryimg{
    	background-color: #F9D182;
    	border-radius: 10px;
    	padding : 5px;
    }
    #categoryFilter{
    	border: 1px solid #F9D182;
    	border-radius: 10px;
    	padding-top : 42px;
    	padding-right: 5px;
    	padding-left: 5px;
    }

</style>
<style>
	/* 인포윈도우 스타일 */
	.overlaybox {
		border: none; /* 테두리 없애기 */
	    color: #333;
	    font-family: Arial, sans-serif;
	    border: none; /* 테두리 없애기 */
	    padding: 10px; /* 패딩 없애기 */
	    background-color: transparent; /* 배경색 투명으로 설정 */
	    box-shadow: none; /* 그림자 없애기 */
	}
	
	.boxtitle {
	    font-size: 20px;
	    font-weight: bold;
	    margin-bottom: 8px;
	    color: #FF9B00; /* 주요 제목 색상 */
	    text-decoration: underline;
	}
	
	.categorytext {
	    font-weight: bold;
	}
	
	ul {
	    list-style: none;
	    padding: 0;
	}
	
	li {
	    margin-bottom: 8px;
	    display: flex;
	    align-items: center;
	}
	
	.title {
	    margin-left: 10px;
	}
	
	.arrow {
	    width: 10px;
	    height: 10px;
	    margin-left: 5px;
	    border: solid transparent;
	    border-width: 5px;
	}
	
 	.content2box { 
 		display:block; 
 		align-items: center; /* 내용을 수직 가운데 정렬 */ 
 		text-align:center; 
 		background:#fff; 
 		padding:10px 15px; 
 		font-size:14px; 
 		font-weight:bold; 
 		color:#FF9B00; 
 		border: 1px solid #FF9B00; /* 테두리 추가 */ 
 	    border-radius: 5px; /* 둥근 모서리 */ 
 	    margin: 10px 0; /* 위 아래 여백 추가 */ 
 	    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */ 
	} 
}

</style>

</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<div class = "container">
	<a id="categoryFilter">
		<img class = "categoryimg" src="${pageContext.request.contextPath}/resources/mapimg/전체아이콘.png" width=40 id="all">
		<img class = "categoryimg" src="${pageContext.request.contextPath}/resources/mapimg/의료아이콘.png" width=40 id="의료">
		<img class = "categoryimg" src="${pageContext.request.contextPath}/resources/mapimg/식당아이콘.png" width=40 id="식당">
		<img class = "categoryimg" src="${pageContext.request.contextPath}/resources/mapimg/여행지아이콘.png" width=40 id="여행">
		<img class = "categoryimg" src="${pageContext.request.contextPath}/resources/mapimg/펫용품아이콘.png" width=40 id="서비스">
	</a>
	<br>
<div class = "map-container">
	<div class="map" id="map" style="width:500px;height:500px;"></div>
	<div class="map-text">
		<% if(request.getAttribute("RodeAddress")!= null) {%>
		<input id = "address" class="address" type="text" placeholder="주소를 입력하세요. ex)서울, 부산, 개포 " value="<%= request.getAttribute("RodeAddress")%>" >
		<%} else{%>
		<input id = "address" class="address" type="text" placeholder="주소를 입력하세요. ex)서울, 부산, 개포 ">
		<%} %>
		<button class="btn" id = "addressSearch">검색</button>
		<br>
		<div class="text-container" >
			<%  
			List<AccompanyingFacilitiesDTO> list2 = (List<AccompanyingFacilitiesDTO>)request.getAttribute("list");
			if(request.getAttribute("list2") == null){
				list2 = (List<AccompanyingFacilitiesDTO>)request.getAttribute("list");
			}else if(request.getAttribute("list2")!= null){
				list2 = (List<AccompanyingFacilitiesDTO>)request.getAttribute("list2"); 
			}
				for(int i=0; i<list2.size(); i++){
					String Sname = list2.get(i).getFacilitiesName();
					String Scategory2 = list2.get(i).getCategory2();
					int SpostNumber = list2.get(i).getPostNumber();
					double Slatitude = list2.get(i).getLatitude();
					double Slongitude = list2.get(i).getLongitude();
					String SrodeAddress = list2.get(i).getRodeAddress();
					String ShouseAddress = list2.get(i).getHouseAddress();
					if(SrodeAddress == null)
						SrodeAddress = ShouseAddress;
					String SphoneNumber = list2.get(i).getPhoneNumber();
					String SoperationHours = list2.get(i).getOperationHours();
					String DayOff = list2.get(i).getDayOff();
					String Sparking = list2.get(i).getParking();
					String SRestrictions = list2.get(i).getRestrictions();
			%>
			<div class = "palce-container">
				<div class="place-title" data-xxx=<%= Slatitude %> data-yyy=<%= Slongitude %>><%= Sname %></div>
				<div class = "place-content" >
					<div><span class="place-colum">카테고리</span><%= Scategory2 %></div>
					<div><span class="place-colum">주소</span>(<%= SpostNumber %>) <%= SrodeAddress %></div>
					<div style="font-size: 12px; font-weight: bolder;">&nbsp;&nbsp;&nbsp;[지번] <%= ShouseAddress %></div>
					<div><span class="place-colum">전화번호</span><%= SphoneNumber %> </div>
					<div><span class="place-colum">영업시간</span><%= SoperationHours %> &nbsp; <span class="place-colum">휴일 </span><%= DayOff %></div>
					<div><span class="place-colum">주차가능여부</span><%= Sparking %> &nbsp; <span class="place-colum">제한사항</span><%= SRestrictions %></div>
				</div>
			</div>
				<hr style = "border: 0px; border-top: 0.5px dotted; color:	#969696">
				
			<%	
				}
			%>
		</div>
	</div>
</div>
<br>
<div class="link-container">
	<a href="<%=request.getContextPath()%>/savedogdiv" class="link-AccomPlace">동반업소</a>
	<a href="<%=request.getContextPath()%>/gmap" class="link-hospital">병원찾기</a>
</div>
</div>

<!-- LakaoMap js 코드 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf3452f084f6fdf285cb1adc42a4d2b6"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf3452f084f6fdf285cb1adc42a4d2b6&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script>

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(37.56330525, 127.016417), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var positions = [
		<% 
		List<AccompanyingFacilitiesDTO> list = (List<AccompanyingFacilitiesDTO>)request.getAttribute("list");
		if(request.getAttribute("list2") != null){
			list = (List<AccompanyingFacilitiesDTO>)request.getAttribute("list2");
		}
		for(int i=0; i<list.size(); i++){
			String name = list.get(i).getFacilitiesName();
			double latitude = list.get(i).getLatitude();
			double longitude = list.get(i).getLongitude();
			String category2 = list.get(i).getCategory2();
			int postNumber = list.get(i).getPostNumber();
			String rodeAddress = list.get(i).getRodeAddress();
			String phoneNumber = list.get(i).getPhoneNumber();
			String operationHours = list.get(i).getOperationHours();
			String parking = list.get(i).getParking();
		%>
		{
			content:'<div class="overlaybox">' +
		    '    <div class="boxtitle"><a href="https://map.kakao.com/link/map/<%=name%>,<%=latitude%>,<%=longitude%>" target="_blank" style="color: #FF9B00;"><%=name%></a></div>' +
		    '    <div class="first">' +
		    '        <div class="categorytext">카테고리:<%=category2%></div>' +
		    '    </div>' +
		    '    <ul>' +
		    '        <li>' +
		    '            <span class="title"><a style="color:#FF8200;">(<%=postNumber%>)</a><%=rodeAddress%></span>' +
		    '            <span class="arrow up"></span>' +
		    '        </li>' +
		    '        <li class="up">' +
		    '            <span class="title"><%=phoneNumber%></span>' +
		    '            <span class="arrow up"></span>' +
		    '        </li>' +
		    '        <li>' +
		    '            <span class="title"><%=operationHours%></span>' +
		    '            <span class="arrow up"></span>' +
		    '        </li>' +
		    '        <li>' +
		    '            <span class="title"><%=parking%></span>' +
		    '            <span class="arrow down"></span>' +
		    '        </li>' +
		    '    </ul>' +
		    '<a href="https://map.kakao.com/link/map/<%=name%>,<%=latitude%>,<%=longitude%>" target="_blank">큰지도보기</a>' +
		    '</div>',
		    content2:'<div class="content2box"><%=name%></div>',
			latlng: new kakao.maps.LatLng(<%=latitude%>, <%=longitude%>),
			img: '<%= category2%>'
		},
	<%
		}
	%>
	]

	// 카테고리별 이미지 지정
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	if(positions[i].img.includes('의료')){
		var imageSrc = '${pageContext.request.contextPath}/resources/mapimg/의료아이콘.png'; // 마커이미지의 주소입니다    
	}else if(positions[i].img.includes('식당') || positions[i].img.includes('카페')){
		var imageSrc = '${pageContext.request.contextPath}/resources/mapimg/식당아이콘.png'; // 마커이미지의 주소입니다    
	}else if(positions[i].img.includes('여행') ){
		var imageSrc = '${pageContext.request.contextPath}/resources/mapimg/여행지아이콘.png'; // 마커이미지의 주소입니다    
	}else if(positions[i].img.includes('서비스') ){
		var imageSrc = '${pageContext.request.contextPath}/resources/mapimg/펫용품아이콘.png'; // 마커이미지의 주소입니다    
	}
	
    var imageSize = new kakao.maps.Size(31, 31), // 마커이미지의 크기입니다
    	imageOption = {offset: new kakao.maps.Point(15.5, 31)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	    
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커의 위치
        image: markerImage // 마커이미지 설정 
    });
    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content, // 인포윈도우에 표시할 내용
        removable : true
    });
    var infowindow2 = new kakao.maps.InfoWindow({
        content: positions[i].content2 // 인포윈도우에 표시할 내용
    });
    
//     var customOverlay = new kakao.maps.CustomOverlay({
//         content: positions[i].content2,
//         yAnchor: 1.5, // Y 축 앵커를 중앙(0.5)으로 설정
//         position: positions[i].latlng,
        
//     });
    
    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow2));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow2));

//     customOverlay.setMap(map);
//     customOverlay.setVisible(false);
    
//     kakao.maps.event.addListener(marker, 'mouseover', function() {
//     	console.log(1);
//     	customOverlay.setVisible(true);    	
//     });
//     kakao.maps.event.addListener(marker, 'mouseout', function() {
//     	customOverlay.setVisible(false);    	
//     });
}
 
	map.setCenter(positions[0].latlng);//마커 다 뿌린 후,리스트 인덱스0번으로 맵 위치조정
    
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	        console.log($(".content2box").parent('div'));
	        console.log($(".content2box").parent('div').parent('div').css('border','0px'));
	        console.log($(".content2box").parent('div').parent('div').css('background','unset'));
	        console.log($(".content2box").parent('div').siblings().css('display','none'));
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
</script>
<script>
	$(function(){
		$("#addressSearch").click(function(){
			console.log($("#address").val());
			var RodeAddress = $("#address").val();
			location.href="http://localhost:8096/test/map/search?RodeAddress="+RodeAddress;
		});
		
		$(".place-title").click(function(data){
			var lat = data.target.dataset.xxx;
			var lon = data.target.dataset.yyy;
			console.log(lat, lon);
            map.setCenter(new kakao.maps.LatLng(lat, lon));
		});
		
		$("#categoryFilter").click(function(data){
 			console.log(data.target.id);
 			var RodeAddress = $("#address").val();
 			var Category2 = data.target.id;	
 			location.href="http://localhost:8096/test/map/search?RodeAddress="+RodeAddress+"&Category2="+Category2;
 			if(data.target.id.includes('all')){
 				location.href="http://localhost:8096/test/map/search?RodeAddress="+RodeAddress;
 			}
		});
		
		$(".categoryimg").mouseover(function(data){
			data.target.style="background-color:#5050FF";
		});
		$(".categoryimg").mouseout(function(data){
			data.target.style="";
		});
		
		$(".place-title").mouseover(function(data){
			data.target.style="color:blue";
		});
		$(".place-title").mouseout(function(data){
			data.target.style="";
		});
		
	})
</script>
<br>
<jsp:include page = "../common/footer.jsp" flush="true"/><br>
<script type="text/javascript">
// 	$(function(){
// 		var infoTitle = document.querySelectorAll('.content2box');
// 		infoTitle.forEach(function(e) {
// 		    var w = e.offsetWidth + 10;
// 		    var ml = w/2;
// 		    e.parentElement.style.top = "82px";
// 		    e.parentElement.style.left = "50%";
// 		    e.parentElement.style.marginLeft = -ml+"px";
// 		    e.parentElement.style.width = w+"px";
// 		    e.parentElement.previousSibling.style.display = "none";
// 		    e.parentElement.parentElement.style.border = "0px";
// 		    e.parentElement.parentElement.style.background = "unset";
// 		});
// 	})
</script>
</body>
</html>