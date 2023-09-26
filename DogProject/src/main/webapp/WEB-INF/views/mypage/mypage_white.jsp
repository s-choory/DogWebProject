<%@page import="com.dto.UsersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하는곳2</title>
<style type="text/css">

/* 전체틀 */	
	#full {
		width: 1000px;
		height: 1000px;
		background-color: white;
	}
/* 전체틀 끝 */	
	
	
/* 왼쪽부분 */	
	#screen_left {
		width: 450px;
		height: 1000px;
		background-color: white;
		float: left;
	}
	
	#screenleft-1 {
		width: 350px;
		height: 900px;
		background-color: pink;
		position: relative;
		top: 50px;
		left: 50px;
	}
	
	#userbutton {
		position: relative;
		padding-left: 35%;
	}	
	
	.circle {
		position: relative;
		width: 350px;
		height: 350px;
		border-radius: 50%;
		overflow: hidden;
	}
	
	.view {
		position: relative;
		top: 25px;
		width: 350px;
		height: 350px;
	}
	
	.view_title {
		position: relative;	
		width: 350px;
		height: 50px; 
		border: 1px dashed pink; 
		text-align: center;
		line-height: 70px;
		font-size: 1.5em;
		font-weight: bold; 
	}
	
	.view_text {
		position: relative;	
		top: 10px;
		width: 350px;
		height: 170px; 
		border: 1px dashed pink; 
		text-align: center;
		line-height: 30px;
		font-size: 1.2em;
	}
	
	.view_text input {
 		 width: 100px; /* input 요소의 넓이 조절 */
	}
	
/* 왼쪽부분 끝 */	
	
	
	
/* 오른쪽 부분 */	
	#screenright {
		width: 550px;
		height: 1000px;
		background-color: white;
		float: left;
	}
	
	#rightbox1 {
		width: 450px;
		height:300px;
		background-color: pink;
		position: relative;
		top: 25px;
		left: 50px;	
	}
	
	#rightbox2 {
		width: 450px;
		height: 300px;
		background-color: pink;
		position: relative;
		top: 25px;
		left: 50px;
		margin-top: 25px;
		margin-bottom: 25px; /* 간격 조절 */
	}
	
	#rightbox3 {
		width: 450px;
		height: 300px;
		background-color: pink;
		position: relative;
		top: 25px;
		left: 50px;	
	}
	
	#rightbox_title {
		font-size: 1.5em;
		font-weight: bold; 
	}
	
	#shoppingbasket {
		position: relative;	
		top: 25px;
		left: 25px;
		bottom: 25px;
		width: 400px;
		height: 250px;
		white-space: nowrap; /* 세로 스크롤 삭제 */
		overflow-x:scroll;	 /* 가로 스크롤만 생성 */
		
	}
	
	#shoppingbasket2 {
		position: relative;	
		display: inline-block;
		background-color: white;
		margin-right: 20px;
		margin-bottom: 20px; /* 이미지아래 간격, 추가되었습니다. */
	}
	
	#orderlist {
		position: relative;	
		top: 25px;
		left: 25px;
		bottom: 25px;
		width: 400px;
		height: 250px;
		white-space: nowrap; /* 세로 스크롤 삭제 */
		overflow-x:scroll;	 /* 가로 스크롤만 생성 */
		
	}
	
	#orderlist2 {
		position: relative;	
		display: inline-block;
		background-color: white;
		margin-right: 20px;
		margin-bottom: 20px; /* 이미지아래 간격, 추가되었습니다. */
	}	
	
	 /*  달력 부분 스타일 */ 
 
        td {
            width: 50px;
            height: 29px;
        }

        .Calendar { 
            text-align: center;
            margin: 0 auto; 
        }

        .Calendar>thead>tr:first-child>td { font-weight: bold; }

        .Calendar>thead>tr:last-child>td {
            background-color: gray;
            color: white;
        }        

        .pastDay{ background-color: lightgray; }

        .today{            
            background-color: #FFCA64;            
            cursor: pointer;
        }

        .futureDay{            
            background-color: #FFFFFF;
            cursor: pointer;
        }

        .futureDay.choiceDay, .today.choiceDay{            
            background-color: #3E85EF;            
            color: #fff;
            cursor: pointer;
        }
        
        /* 달력부분 스타일 끝  */
	
	
	
	
/* 오른쪽부분 끝 */	
	
/* 하단부분 스타일(내가 쓴글,좋아요한글) */
 
  	#full2 {
		width: 1000px;
		height: 500px;
		background-color: white;
	}
.ContactCenter_Top {
	background: white;
	color: #4646b4;
	width: 100%;
	padding-top:20px;
	padding-bottom:0px;
	margin: 0 auto;
}
.ContactCenter_Top_Name {
	color: black;
	padding-bottom: 40px;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
}
.ContactCenter_Choice_Table {
	border-collapse: separate;
	border-spacing: 0;
	margin: 0 auto;
	width: 100%;
}
.ContactCenter_Choice_Yes {
	background: purple;
	color: white;
	font-size: 20px;
	font-weight: bold;
	width: 25%;
	height: 65px;
	text-align: center;
	border-bottom: 2px solid purple;
}
.ContactCenter_Choice_No {
	background: white;
	color: purple;
	font-size: 20px;
	font-weight: bold;
	width: 25%;
	height: 65px;
	text-align: center;
	border-bottom: 2px solid purple;
}
.ContactCenter_Choice_Side {
	background: white;
	width: 25%;
	height: 32.5px;
}
	
.ContactCenter_Notice {
	background: white;
	color: #4646b4;
	width: 100%;
	padding-top: 20px;
}
.ContactCenter_Notice_Table {
	border-collapse: separate;
	border-spacing: 0;
	margin: 0 auto;
	width: 100%;
	height: 100px;
}
.ContactCenter_Notice_Top_Name {
	font-size: 15px;
	font-weight: bold;
	width: 25%;
	height: 50px;
	text-align: center;
	border-top: 2px solid purple;
	border-bottom: 2px solid #aba8f4;
	}
.ContactCenter_Notice_Top_Count {
	font-size: 15px;
	font-weight: bold;
	width: 5%;
	height: 50px;
	text-align: center;
	border-top: 2px solid purple;
	border-bottom: 2px solid #aba8f4;
	}
.ContactCenter_Notice_Top_Writer {
	font-size: 15px;
	font-weight: bold;
	width: 5%;
	height: 50px;
	text-align: center;
	border-top: 2px solid purple;
	border-bottom: 2px solid #aba8f4;
	}
.ContactCenter_Notice_Top_Uploaddate {
	font-size: 15px;
	font-weight: bold;
	width: 10%;
	height: 50px;
	text-align: center;
	border-top: 2px solid purple;
	border-bottom: 2px solid #aba8f4;
	}
.ContactCenter_Notice_Bottom_Center {
	font-size: 15px;
	width: 120px;
	height: 40px;
	text-align: center;
	border-bottom: 1px solid #c0c0c0;
	}
.ContactCenter_Notice_Bottom_Left {
	font-size: 15px;
	width: 120px;
	height: 40px;
	text-align: left;
	border-bottom: 1px solid #c0c0c0;
	}
.ContactCenter_Notice_Bottom_Pages {
	font-size: 15px;
	height: 40px;
	text-align: center;
	}
.ContactCenter_Notice_Bottom_First {
	font-size: 15px;
	height: 40px;
	text-align: center;
	padding-left: 40px
	}
.ContactCenter_Notice_Bottom_Last {
	font-size: 15px;
	height: 40px;
	text-align: center;
	padding-right: 40px
	}
.ContactCenter_Button {
	width: 50px;
	height: 50px;
	
	text-align: center;
	}
.ContactCenter_FAQ_Table {
	border-collapse: separate;
	border-spacing: 0;
	margin: 0 auto;
	width: 50%;
	height: 50px;
}
.ContactCenter_FAQ_Q {
	font-size: 25px;
	color: purple;
	border-collapse: separate;
	border-spacing: 0;
	margin: 0 auto;
	width: 3%;
	height: 50px;
	border: 1px solid purple;
	text-align: center;
}
.ContactCenter_FAQ_Name {
	border-collapse: separate;
	border-spacing: 0;
	margin: 0 auto;
	width: 47%;
	height: 50px;
	border-bottom: 1px solid black;
	border-top: 1px solid black;
	border-right: 1px solid black;
}
.ContactCenter_FAQ_Q2 {
	font-size: 25px;
	color: purple;
	border-collapse: separate;
	border-spacing: 0;
	margin: 0 auto;
	width: 100%;
	height: 50px;
	text-align: center;
}
.ContactCenter_FAQ_Content {
	background-color : gray;
	border-collapse: separate;
	border-spacing: 0;
	margin: 0 auto;
	width: 50%;
	height: 50px;
	border-bottom: 1px solid black;
	border-top: 1px solid black;
	border-right: 1px solid black;
}
	
.section-tab-container {
    z-index: 2;
    position: relative;
    margin: -40px auto 0;
    max-width: 800px;
    width: 100%;
}	
	
.tab-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    position: relative;
}	
	
.tab-list--block>li {
    border-bottom: 2px solid #32a69f;
}	
	
/* 하단 끝 */
</style>
    <script>
        window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
        let today = new Date();     // 페이지를 로드한 날짜를 저장
        today.setHours(0,0,0,0);    // 비교 편의를 위해 today의 시간을 초기화

        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
        function buildCalendar() {

            let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
            let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

            let tbody_Calendar = document.querySelector(".Calendar > tbody");
            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

            while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
                tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
            }

            let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

            for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
                let nowColumn = nowRow.insertCell();        // 열 추가
            }

            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

                let nowColumn = nowRow.insertCell();        // 새 열을 추가하고
                nowColumn.innerText = leftPad(nowDay.getDate());      // 추가한 열에 날짜 입력

            
                if (nowDay.getDay() == 0) {                 // 일요일인 경우 글자색 빨강으로
                    nowColumn.style.color = "#DC143C";
                }
                if (nowDay.getDay() == 6) {                 // 토요일인 경우 글자색 파랑으로 하고
                    nowColumn.style.color = "#0000CD";
                    nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
                }


                if (nowDay < today) {                       // 지난날인 경우
                    nowColumn.className = "pastDay";
                }
                else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
                    nowColumn.className = "today";
                    nowColumn.onclick = function () { choiceDate(this); }
                }
                else {                                      // 미래인 경우
                    nowColumn.className = "futureDay";
                    nowColumn.onclick = function () { choiceDate(this); }
                }
            }
        }

        // 날짜 선택
        function choiceDate(nowColumn) {
            if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
            }
            nowColumn.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
        }
        
        // 이전달 버튼 클릭
        function prevCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
            buildCalendar();    // 달력 다시 생성
        }
        // 다음달 버튼 클릭
        function nextCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
            buildCalendar();    // 달력 다시 생성
        }

        // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
        function leftPad(value) {
            if (value < 10) {
                value = "0" + value;
                return value;
            }
            return value;
        }
    </script>
</head>
<body>
<jsp:include page = "../common/top.jsp" flush="true"/><br>
<jsp:include page = "../common/side.jsp" flush="true"/><br>
<% 
	UsersDTO dto = (UsersDTO)session.getAttribute("User"); 	
	String UserName = dto.getUserName();
	String UserAlias = dto.getUserAlias();
	String PhoneNumber = dto.getPhoneNumber();
	String Email1 = dto.getEmail1();
	String Email2 = dto.getEmail2();
	String RodeAddress = dto.getRodeAddress();
	String HouseAddress = dto.getHouseAddress();
	String DogName = dto.getDogName();
	String DogType = dto.getDogType();
%>
<div id="full">
<h1>mypage</h1>

	<!-- 반나눠서 왼쪽 부분  -->
	<div id="screen_left">
		<div id="screenleft-1">
			<div class="circle"><img src="images/items/dog.jpg" height="350" width="350"/></div>
				<div class="view">
					<div class="view_title">회원정보</div>
					<div class="view_text">
						이름:<input type="text" id="name" value="<%=UserName%>"><Br>
						닉네임:<input type="text" id="nickname" value="<%=UserAlias%>"><Br>
						전화번호:<input type="text" id="tel" value="<%=PhoneNumber%>"><Br>
						이메일:<input type="text" id="email1" value="<%=Email1%>">@<input type="text" id="<%=Email2%>" value="naver.com"><Br>
						주소 :<input type="text" id="address" value="<%=RodeAddress%>"><Br>
					</div>
					<div class="view_title">DOG정보</div>
					<div class="view_text">
						이름 :<input type="text" id="dogname" value="<%=DogName%>"> <Br>
						품종 :<input type="text" id="dogbreed" value="<%=DogType%>"> <Br>
					</div>
				<div id="userbutton">
					 <input type="button" value="수정">
					 <input type="button" value="등록">
				</div>		 
				</div>
		</div>
	</div>
	
	
	
	
	
	<!-- 반나눠서 오른쪽 부분  -->
	<div id="screenright">
	
		<div id="rightbox1" class="rightbox">
			<span id="rightbox_title">달력</span>
				 <!-- 달력 부분 -->
					 <table class="Calendar">
				        <thead>
				            <tr>
				                <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
				                <td colspan="5">
				                    <span id="calYear"></span>년
				                    <span id="calMonth"></span>월
				                </td>
				                <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
				            </tr>
				            <tr>
				                <td>일</td>
				                <td>월</td>
				                <td>화</td>
				                <td>수</td>
				                <td>목</td>
				                <td>금</td>
				                <td>토</td>
				            </tr>
				        </thead>
				
				        <tbody>
				        </tbody>
				    </table>
	   		    <!-- 달력 끝 -->
		</div>
		
		<div id="rightbox2" class="rightbox">
		 <!-- 장바구니 시작 -->
			 <span id="rightbox_title">장바구니</span>
			 <input type="button" value="결제하러가기">
			 <div id="shoppingbasket" >	
				<% 
					int a = 10; // 대충 10개까지 임의 지정
					//data-xxx= Num 
					for(int i = 1; i <= a; i++) { 
				%>
				<div id="shoppingbasket2" >
						<img src="images/items/dogdress.PNG"border="0"  width="200px" height="200px;" style="float: left;" id="image<%=i%>"/>
				
				
				
				</div>
				<% } %>
			</div>
	     <!-- 장바구니 끝 -->	
		</div>
		
		<div id="rightbox3" class="rightbox">
		 <!-- 주문list 시작 -->
			<span id="rightbox_title">주문List</span>
			 <div id="orderlist" >	
				<% 
					int a2 = 10; // 대충 10개까지 임의 지정
					//data-xxx= Num 
					for(int i = 1; i <= a2; i++) { 
				%>
				<div id="orderlist2" >
						<img src="images/items/dogdress.PNG"border="0"  width="200px" height="200px;" style="float: left;" id="image<%=i%>"/>
				
				
				
				</div>
				<% } %>
			</div>
	     <!-- 주문list 끝 -->	
		</div>
		
	
	</div>
</div>

<!-- 하단 부분 시작 ( 내가 쓴글, 좋아요한 글?)  -->
<div id="full2">
	<div class="ContactCenter_Top">
  <div class="ContactCenter_Top_Name" align="center">작성게시물</div>
  <table class="ContactCenter_Choice_Table">
    <tr>
      <td/>
      <td rowspan="2" class="ContactCenter_Choice_Yes" id="Notice">내가 쓴 글</td>
      <td rowspan="2" class="ContactCenter_Choice_No" id="FAQ">좋아요 누른 글</td>
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
    int ViewCCPage = 10; // 한 페이지당 표시할 데이터 건수
    int AllCCPage = 11; // select count 값 넣기
    int AllCCPages = (int) Math.ceil((double) AllCCPage / ViewCCPage); // 전체 페이지 수

    for(int i = 1; i <= ViewCCPage; i++) { %>
    <tr>
      <td class="ContactCenter_Notice_Bottom_Center"><%=i%></td> 
      <td class="ContactCenter_Notice_Bottom_Left">예시입니다</td>
      <td class="ContactCenter_Notice_Bottom_Center">김@@</td>
      <td class="ContactCenter_Notice_Bottom_Center">2023-08-15</td>
      <td class="ContactCenter_Notice_Bottom_Center">1</td>
    </tr>
  <% } %>
  </table>
  <table  class="ContactCenter_Notice_Table">
  	<tr>
  		<td class="ContactCenter_Notice_Bottom_First">이전</td>
  		<% for(int i = 1; i <= AllCCPages; i++) { %>
  		<td class="ContactCenter_Notice_Bottom_Pages"><%=i%></td>
		<% } %>
		<td class="ContactCenter_Notice_Bottom_Last">다음</td>
	</tr>
	</table>
</div>

<jsp:include page = "../common/footer.jsp" flush="true"/><br>
</div>




</body>
</html>