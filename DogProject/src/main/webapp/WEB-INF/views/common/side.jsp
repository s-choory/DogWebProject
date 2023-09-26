<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
/* 고정 사이드바 */
	.fixed-sidebar {
	    position: fixed;
	    top: 350px;
	    transform: translateY(-50%);
	    right: 20px;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    z-index: 1000;
	}

	/* 스크롤 버튼 스타일 */
	.scroll-button {
	    background-color: #f8bd24;
	    border: none;
	    border-radius: 40px;
	    color: white;
	    font-size: 15px;
	    padding: 10px;
	    margin: 5px 0;
	    cursor: pointer;
	    transition: background-color 0.3s, transform 0.2s;
	}
	
	.scroll-button:hover {
	    background-color: #e4a708;
	    transform: translateY(-2px);
	}
	
	/* 스크롤 버튼 위치 조정 */
	#scroll-up-button {
	    margin-bottom: 20px;
	}
	
	#scroll-down-button {
	    margin-top: 20px;
	}
</style>
    
<div class="fixed-sidebar">
    <button class="scroll-button" id="scroll-up-button">
        <span>&#9650;</span>
    </button>
    <button class="scroll-button" id="scroll-down-button">
        <span>&#9660;</span>
    </button>
    <br>
</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script type="text/javascript">
	
	//화살표 버튼으로 스크롤링 처리하는 JavaScript
$(document).ready(function () {
    const scrollStep = 10000; // 스크롤 간격 (픽셀 단위)

    const scrollUpButton = $("#scroll-up-button");
    scrollUpButton.click(function () {
        $("html, body").animate({
            scrollTop: $(window).scrollTop() - scrollStep
        }, 500); // 스크롤 animation 시간
    });

    const scrollDownButton = $("#scroll-down-button");
    scrollDownButton.click(function () {
        $("html, body").animate({
            scrollTop: $(window).scrollTop() + scrollStep
        }, 500); // 스크롤 animation 시간
    });
});
</script>

