<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실예약</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">
<!-- 캘린더 import -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script>
	const servletUrl = "${contextPath}/RevInsert";
	const headCount = ${roomVO.headCount};
	const revList = JSON.parse('${revList}');
	
</script>
<script src="${contextPath}/util/RoomRevCalendar.js"></script>
<script src="${contextPath}/util/CountHead.js"></script>
<style>
	form {
		display: flex;
		justify-content: space-between;
		width: 100%;
	}
	
	#container {
		width: 100%;
		padding-right: 15px;
		padding-left: 15px;
		margin-right: auto;
		margin-left: auto;
		max-width: 1100px;
	}
	
	#rightDiv {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        margin: 0 10px;
        padding: 20px;
        align-items: flex-start; 
        width: 30%;
    }
	#leftDiv {
		display: flex;
		flex-direction: column; /* 내부 요소를 세로로 정렬합니다. */
		flex: 0 0 calc(70% - 10px); /* 부모 컨테이너 너비의 60%에서 10px를 뺀 값으로 설정합니다. */
		padding: 10px;
		margin-right: 10px;
		width: 70%;
	}
	
	.leftTable {
		width: 100%;
		margin-top: 0 auto;
		float: left;
	
	}
	.leftTable td {
 	    font-weight: bold; /* 글씨를 진하게 */ 
 	    font-size: 15pt; /* 글씨 크기를 상대적으로 20% 증가 */ 
 	    color: #333; /* 글씨 색상을 진한 회색으로 */ 
	}
	.leftimg{
		float: left;
		width: auto;
		display: block;
   		margin-left: auto;
    	margin-right: right;
	}
	
/* 	.rightTable { */
/* 	font-weight: bold; */
/* 		width: 200px; */
/* 		border-collapse: separate; */
/* 		border-spacing: 10px; */
/* 		padding: 10px; */
/* 		float: left; */
/* 	} */
	
	#price-range-slider {
		width: 140px;
		margin-left: 5px;
	}
	
	.filter {
		width: 150px;
	}
	
	.filter_select {
		width: 155px;
	}
	
	.headCount {
		width: 60px;
	}
	
	#headTd {
		display: flex; /* 요소들을 가로로 나열 */
		align-items: center; /* 요소들을 세로 중앙 정렬 */
	}
	
	#headTd button {
		margin: 0 5px 0 5px;
	}
	
	#headCount {
		width: 50px;
	}
	
	#price {
		width: 150px;
		border: none;
		outline: none;
		text-align: right;
		font-size: 15pt;
	}
	
/* 	img { */
/* 		width: 300px; */
/* 		height: auto; /* 이미지의 가로 세로 비율을 유지하면서 가로 너비를 300px로 지정 */ */
/* 	} */
	.sliderouter{
		margin: 20px auto;
		width: 700px;
		height: 500px;
	}
	
	.slider {
		width: 700px; /* 슬라이드의 너비 */
		overflow: hidden; /* 넘치는 이미지 숨김 */
		position: relative; /* 상대 위치 지정 */
	}
	
	.slider ul {
		list-style-type: none; /* 리스트 스타일 제거 */
		margin: 0; /* 마진 제거 */
		padding: 0; /* 패딩 제거 */
		display: flex;
	}
	
	.slider ul li {
		
/* 		float: left; /* 왼쪽으로 정렬 */ */
		width: 100%; /* 이미지 너비 */
	}
	/* 이전/다음 버튼 스타일 */
	.prev, .next {
		cursor: pointer; /* 커서 모양 변경 */
		position: absolute; /* 절대 위치 지정 */
		top: 50%; /* 상단 여백 */
		transform: translateY(-50%); /* 수직 정렬 */
		transition: width 0.5s ease;
		background-color: rgba(0, 0, 0, 0.5); /* 배경색 */
		color: white; /* 글자색 */
		padding: 10px; /* 안쪽 여백 */
		z-index: 1; /* 위에 표시 */
	}
	
	.prev {
		left: 0; /* 왼쪽에 배치 */
	}
	
	.next {
		right: 0; /* 오른쪽에 배치 */
	}
	.visual_img {
		 display: flex;
/* 		  width: 4000px; /* 모든 이미지 너비의 합, 동적으로 계산 필요 */ */
	        margin: 0;
	        padding: 0;
	}
	
	.image-container {
/* 		width: 600px; /* 이미지 컨테이너의 너비를 설정합니다. */ */
/* 		height: 400px; /* 이미지 컨테이너의 높이를 설정합니다. */ */
		overflow: hidden; /* 이미지가 넘치는 경우를 처리합니다. */
	}
	
	.image-container img {
		width: 100%; /* 이미지의 너비를 부모 요소에 맞게 설정합니다. */
		height: auto; /* 이미지의 높이를 자동으로 조절하여 비율을 유지합니다. */
		display: block; /* 이미지를 블록 요소로 표시합니다. */
	}
	td {
	    padding-top: 15px; /* 위쪽 패딩 */
	    padding-bottom: 15px; /* 아래쪽 패딩 */
	}
	/* 테이블 기본 설정 */
	.rightTable {
	    width: 100%; /* 테이블의 너비를 전체로 설정 */
	    border-collapse: collapse; /* 셀 사이 공간 없애기 */
	    
	    border-radius: 10px; /* 모서리 둥글게 */
	    overflow: hidden; /* 둥근 모서리에 컨텐츠가 넘치는 것을 숨김 */
	    margin: 20px 0; /* 상하 여백 설정 */
	}
	
	/* 테이블 헤더 및 셀 스타일 */
	.rightTable td {
	    padding: 15px; /* 셀 내부 패딩 */
	    text-align: left; /* 텍스트 왼쪽 정렬 */
	    border-bottom: 1px solid #E6E6FA; /* 셀 하단 테두리, 연한 라벤더색 사용 */
	}
	
	/* 마지막 셀의 테두리 제거 */
	.rightTable tr:last-child td {
	    border-bottom: none;
	}
	.btn_css {
-webkit-border-radius: 13px;
-moz-border-radius: 13px;
border-radius: 13px;

border : 0px;
color: #FFFFFF;
font-family: Arial;
font-size: 15px;
font-weight: 100;
padding: 10px;
background-color: #8D703B;
text-decoration: none;
display: inline-block;
cursor: pointer;
text-align: center;
}

.btn_css:hover {
background-color: #73685d;
}
#downCount, #upCount {
    width: 30px; /* 버튼의 너비 */
    height: 30px; /* 버튼의 높이 */
    font-size: 20px; /* 버튼 내 텍스트 크기 */
    text-align: center; /* 텍스트 중앙 정렬 */
    vertical-align: middle; /* 세로 방향 중앙 정렬 */
    line-height: 30px; /* 버튼 내 줄 높이를 버튼의 높이와 일치시킴 */
    margin: 0; /* 마진 제거 */
    padding: 0; /* 패딩 제거 */
    border: 1px solid #ccc; /* 테두리 스타일 */
 
}
	/* 버튼 스타일 */
	button {	 
	    background-color: #decfa6; /* 연한 복숭아색 */
	    color: #fff;	
	    border-radius: 5px;
	    cursor: pointer;
	}
	
	button:hover {
	    background-color: #FFB6C1; /* 더 밝은 살색으로 호버 효과 */
	}
	
	/* 입력 필드 스타일 */
	input[type="text"] {
	    padding: 8px;
	    border: 1px solid #FFDAB9; /* 테두리 색상 */
	    border-radius: 5px;
	    width: 80%; /* 입력 필드 너비 */
	}
	
	.daterangepicker .drp-calendar .calendar-table .table-condensed tbody tr .disabled {
	    background-color: #f2f2f2; /* 선택 불가능한 날짜의 배경색 */
	    color: #ccc; /* 선택 불가능한 날짜의 텍스트 색상 */
	}
	hr {
        border: none;
        border-top: 1px solid #ccc;
      
          width: 50%; /* 수정된 부분: 수평선의 길이를 50%로 설정 */
    margin: 10px auto;
    }
</style>
<script>
	const roomNo = ${roomVO.roomNo };

    $(function() {
    	// 슬라이드 스크립트
        $(".visual_img li:last").prependTo(
            ".visual_img");

        $(".next").click(function() {
            $(".visual_img").animate({
                marginLeft : "-700px"
            },
            function() {
                $(".visual_img li:first").appendTo(".visual_img");
                $(".visual_img").css({
                    marginLeft : 0
                });
            });
        });

        $(".prev").click(function() {
            $(".visual_img").animate({
                marginLeft : "+1400px"
            },
            function() {
                $(".visual_img li:last").prependTo(".visual_img");
                $(".visual_img").css({
                    marginLeft : 0
                });
            });
        });
        // 슬라이드 스크립트 끝
        
    });
	    
    function fn_process(){
	    /*서버에서 반환한 결과를 받음*/
	    $.ajax({
	       type:"get",
	       async:true,  
	       url:"<c:url value='/RevPayment' />",
	       dataType:"text",
	       data: {roomNo:roomNo},
	       success:function (data,textStatus) {
	          if(data=='usable') {
	        	  swal.fire('예약할 수 있는 객실입니다.');
	        	  checkId = true;
	          }else {
	        	  swal.fire('예약할 수 없는 객실입니다.');
	        	  checkId = false;
		       	  $('#submit').prop("disabled", true);
	          }
	       },
	       error:function(data,textStatus){
	          alert("잘못 입력했습니다.");
	       },
	       complete:function(data,textStatus){
	    	   
	       }
	    });  // ajax() END	 
	    
	 }	// fn_process() END
	 window.onload = function() {
		    var slider = document.querySelector('.visual_img');
		    var liCount = slider.querySelectorAll('li').length; // li 요소의 개수를 가져옵니다.
		    var sliderWidth = 700 * liCount; // 슬라이더의 너비를 계산합니다.
		    slider.style.width = sliderWidth + 'px'; // 슬라이더의 너비를 설정합니다.
	};
    
</script>

</head>

<body>
	<div id="container">
		<!-- 메인 컨테이너 -->
		<jsp:include page="/include/Header.jsp" flush="false" />

		<div class="row justify-content-center" style="margin-bottom: 50px;">
			<form action="${contextPath }/RevPayment" method="post">
				<input type="hidden" name="roomNo" value="${roomVO.roomNo }" />

				<div id="leftDiv">
					<!-- 왼쪽 컨테이너 -->
					
						<div class="sliderouter">
							<div class="slider">
								<div class="prev">&lt;</div>
								<ul class="visual_img">
									<!-- 이미지 리스트 -->
								 <c:if test="${not empty imgVO}">
							            <c:if test="${not empty imgVO.img1}">
							                <li class="image-container"><img src="${contextPath}/data/${imgVO.img1}" alt="Image 1" /></li>
							            </c:if>
							            <c:if test="${not empty imgVO.img2}">
							                <li class="image-container"><img src="${contextPath}/data/${imgVO.img2}" alt="Image 2" /></li>
							            </c:if>
							            <c:if test="${not empty imgVO.img3}">
							                <li class="image-container"><img src="${contextPath}/data/${imgVO.img3}" alt="Image 3" /></li>
							            </c:if>
							            <c:if test="${not empty imgVO.img4}">
							                <li class="image-container"><img src="${contextPath}/data/${imgVO.img4}" alt="Image 4" /></li>
							            </c:if>
							            <c:if test="${not empty imgVO.img5}">
							                <li class="image-container"><img src="${contextPath}/data/${imgVO.img5}" alt="Image 5" /></li>
							            </c:if>
							    </c:if>
								</ul>
								<div class="next">&gt;</div>
							</div>
						</div>
						<!-- 이전/다음 버튼 -->
						<table class="leftTable" style="text-align: center;">
						<colgroup>
							<col width="30%" >
							<col width="70%" >
						</colgroup>
						<tr>
							<td>
							<span style="font-size: 18pt">${roomVO.roomName }</span><hr>
							<span style="font-size: 10pt; ">KRW  </span>
							<span >${roomVO.roomCost }~</span><hr>
							</td>
							<td rowspan=""> <img src="${contextPath}/data/${imgVO.infoImg}" alt="image" style="width:100%;">
						</tr>
						
						
					</table>
				</div>

				<div id="rightDiv">
    <!-- 오른쪽 컨테이너 -->
    <table class="rightTable">
        <tr>
            <td>
                <strong>객실</strong><br>
                <input type="text" name="roomName" id="roomName" value="${roomVO.roomName }" readonly>
            </td>
        </tr>
        <tr>
            <td>
                <strong>예약 가능한 날짜</strong><br>
                <input type="text" name="checkDate" id="roomRevDate" value="" required readonly>
            </td>
        </tr>
        <tr>
            <td>
                <strong>인원수</strong><br>
                <button type="button" id="downCount" onclick="downValueRoomRev()">-</button>
                <input type="text" name="headCount" id="headCount" value="1" readonly required>
                <button type="button" id="upCount" onclick="upValueRoomRev()">+</button>
            </td>
        </tr>
        <tr>
            <td>
                <strong>총 가격</strong><br>
                <input type="text" name="price" id="price" value="${roomVO.roomCost }" readonly>
            </td>
        </tr>
        <tr>
            <td align="center">
                <input class="btn_css" type="submit" value="예약하기">
            </td>
        </tr>
    </table>
</div>

			</form>
		</div>
	</div>
</body>
<jsp:include page="/include/Footer.jsp" flush="false"  />
</html>