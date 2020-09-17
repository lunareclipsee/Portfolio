<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="https://han3283.cafe24.com/js/lightslider/css/lightslider.css" />
<script
	src="https://han3283.cafe24.com/js/lightslider/js/lightslider.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	/* 슬라이드 쿼리 */
	$("#slider").lightSlider({
		mode : 'slide', // 이미지가 표시되는 형식 (fade / slide)
		loop : true, // 무한반복 할 것인지
		auto : true, // 자동 슬라이드
		keyPress : true, // 키보드 탐색 허용
		pager : true, // 페이지 표시
		speed : 3000, // 슬라이드 되는 속도
		pause : 5000
	// 이미지가 머무는 시간
	});
	
	/* 제목 입력 시 미리보기 반영 */
	var titleMaxLenght = 16;

	for (var i = 0; i < 10; i++) {

		var studyTitleStr = $('.studyNameInput').eq(i).val();
		if (studyTitleStr.length > titleMaxLenght) {
			studyTitleStr = studyTitleStr.substring(0,
					titleMaxLenght)
					+ '...';
		}

		$('.studyNameInput').eq(i).parent().children(0).text(
				studyTitleStr);
	}

});
	function moveTutorIntroduceFnc(tutorNo) {

		location.href = "/englishvillage/tutor/tutorSelectOne.do?tutorNo=" + tutorNo;

	};
</script>
<style type="text/css">
ul {
	list-style: none outside none;
	padding-left: 0;
	margin: 0;
}

.slide-content .slide-content {
	margin-bottom: 60px;
}

.slider li {
	text-align: center;
	color: black;
	background-size: cover;
	background-position: center;
}

.slider h3 {
	margin: 0;
	padding: 100px 0;
	height: 250px;
}

.slide-content {
	width: 100%;
	height: 300px;
}

.tutorImgDiv {
	width: 340px;
	height: 200px;
	cursor: pointer;
}

.tutorImgDiv:hover {
	width: 340px;
	height: 200px;
	cursor: pointer;
}

.tutorImg {
	width: 340px;
	height: 200px;
}

.studyInfo {
	float: left;
	text-align: left;
	margin-left: 10px;
}

.studyTitle {
	cursor: pointer;
}

.studyTitle:hover {
	color: #772ce8;
	cursor: pointer;
}

.tutorName:hover {
	color: #772ce8;
	cursor: pointer;
}

.detailInfo {
	display: flex;
	margin-top: 5px;
}

.flagBox {
	width: 40px;
	height: 40px;
	float: left;
}

.flagIcon {
	width: 40px;
	height: 40px;
}

.scale {
	transform: scale(1);
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transition: all 0.4s ease-in-out; /* 부드러운 모션을 위해 추가*/
}

.scale:hover {
	transform: scale(1.05);
	-webkit-transform: scale(1.05);
	-moz-transform: scale(1.05);
	-ms-transform: scale(1.05);
	-o-transform: scale(1.05);
}

.img {
	border-radius: 20px;
	overflow: hidden
} /* 부모를 벗어나지 않고 내부 이미지만 확대 */
</style>


<!-- 강사소개 슬라이드 -->
<div class="slide-wrap">
	<ul id="slider" class="slider">

		<c:forEach var="tutorDto" items="${tutorDtoList}" begin="0" end="5">
			<li>
				<div style="width: 100%">
					<div class="img">
						<div class="scale tutorImgDiv"
							onclick="moveTutorIntroduceFnc(${tutorDto.memberNo});">
							<img alt="image not found" class='tutorImg'
								src="<c:url value='/img/${tutorDto.storeFileName}'/>">
						</div>
					</div>

					<div class="detailInfo">
						<div class="studyInfo">

							<div class="flagBox">
								<img class="flagIcon" title="${tutorDto.memberCountry}"
									src="<c:url value='/resources/imgs/worldFlag/${tutorDto.memberCountry}.ico'/>">
							</div>

							<div class="studyInfo">
								<div class="studyTitle"
									onclick="moveTutorIntroduceFnc(${tutorDto.memberNo});">
									<Strong>${tutorDto.studyName}</Strong> <input
										class="studyNameInput" type="hidden"
										value="${tutorDto.studyName}">
								</div>

								<div class="tutorName"
									onclick="moveTutorIntroduceFnc(${tutorDto.memberNo});">
									<span>${tutorDto.memberName}</span>
								</div>

								<div>
									<span class="score"> <c:forEach begin="1"
											end="${tutorDto.score}">
											<span style="color: #ff8b13;">★</span>
										</c:forEach> <c:forEach begin="${tutorDto.score}" end="4">
											<span style="color: grey;">★</span>
										</c:forEach> (${tutorDto.evaluationCount})
									</span>
								</div>
							</div>

						</div>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>
<!-- 강사소개 슬라이드 끝-->
