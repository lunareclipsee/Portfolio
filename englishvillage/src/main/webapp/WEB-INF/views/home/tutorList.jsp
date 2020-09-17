<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Hello Spring</title>


<style type="text/css">
body {
	margin: 0px;
}

a {
	text-decoration: none;
}

a:-webkit-any-link {
	color: white;
	cursor: pointer;
}

dl, ul, ol, menu, li {
	list-style: none;
	float: left;
}

#searchBox {
	margin-top: 30px;
}

#mainImg {
	margin-bottom: 30px;
	width: 100%;
}

#searchOptBox>select {
	width: 200px;
	height: 45px;
	margin-right: 10px;
	border: 1px solid #d7e0e0;
	border-radius: 5px;
	font-size: 15px;
	text-align: center;
	padding-left: 10px;
}

#searchKeyBox {
	width: 800px;
	height: 50px;
	background-color: #F2F2F2;
	margin: auto;
	margin-bottom: 20px;
	padding: 6px 39px;
	box-sizing: border-box;
	border-radius: 5px;
}

.seachFont {
	font-size: 20px;
	font-weight: 600;
	margin-right: 20px;
	margin-left: 17px;
	vertical-align: middle;
}

#menuList>div {
	border: 1px solid black;
	width: 200px;
	background-color: orange;
	margin: 20px;
}

#tutorList {
	height: 650px;
	padding: 50px;
}

.tutorInfoDiv {
	width: 340px;
	float: left;
	margin: 10px;
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, .1);
	border-radius: 10px;
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

#mainImg {
	width: 100%;
	height: 1000px;
}

.studyInfo {
	width: 275px;
	padding: 5px 0px 12px 15px;
}

.studyTitle {
	cursor: pointer;
	text-overflow: ellipsis;
}

.studyTitle:hover {
	color: #772ce8;
	cursor: pointer;
}

.price {
	float: left;
	margin-right: 20px;
}

.tutorName {
	margin-right: 20px;
}

.detailInfo {
	display: flex;
	border-radius: 0px 0px 10px 10px;
	background-color: white;
}

.flagBox {
	width: 40px;
	height: 85px;
	padding-top: 10px;
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

.mainImg {
	width: 1920px;
}

.img {
	border-radius: 10px 10px 0px 0px;
	overflow: hidden
} /* 부모를 벗어나지 않고 내부 이미지만 확대 */

@media ( min-width : 1200px) {
	#searchBox {
		width: 720px;
	}
}

@media ( min-width : 992px) {
	#searchBox {
		width: 720px;
	}
}

@media ( min-width : 768px) {
	#searchBox {
		width: 720px;
	}
}
</style>
<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
<script type="text/javascript">


	function moveTutorIntroduceFnc(tutorNo){
		
		location.href = './tutorSelectOne.do?tutorNo=' + tutorNo;

	};
	
	$(document).ready(function() {
	
		/* 제목 입력 시 미리보기 반영 */
		var titleMaxLenght = 14;
		
		for (var i = 0; i < 10; i++) {
			
			var studyTitleStr = $('.studyNameInput').eq(i).val();
			
			if(studyTitleStr.length > titleMaxLenght){
				studyTitleStr = studyTitleStr.substring(0, titleMaxLenght) + '...';
			}
			
			$('.studyNameInput').eq(i).parent().children(0).children(0).text(studyTitleStr);
			
		}
				
	});
			
	
</script>
<body style="background-color: #f5f5f5;">

	<jsp:include page="/WEB-INF/views/common/Header.jsp" />
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class=""></li>
			<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img class="first-slide mainImg"
					src="/englishvillage/resources/imgs/s.jpg" alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>영어 지금 시작하세요!</h1>
						<p>Note: 어쩌구 저쩌구</p>
						<p>
							<a class="btn btn-lg btn-primary" href="commonRegister.do"
								role="button">Sign up today</a>
						</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="second-slide mainImg"
					src="/englishvillage/resources/imgs/s1.jpg" alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>영어의 시대</h1>
						<p>Note: 어쩌구 저쩌구</p>
						<p>
							<a class="btn btn-lg btn-primary" href="login.do" role="button">Learn
								more</a>
						</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img class="third-slide mainImg"
					src="/englishvillage/resources/imgs/s2.jpg" alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>지금 당장 가입하세요!</h1>
						<p>Note: 어쩌구 저쩌구</p>
						<p>
							<a class="btn btn-lg btn-primary" href="commonRegister.do"
								role="button">Sign up today</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>




	<div id="searchBox" class="container">
		<form class="form-inline" action="./home.do#searchOptBox"
			method="post">
			<span class="seachFont">검색조건</span> <select id="searchOptBox"
				class="form-control" name='countrySearch'>
				<c:choose>
					<c:when test="${searchMap.countrySearch eq 'all'}">
						<option value='all' selected>국적</option>
						<option value='USA'>미국</option>
						<option value='Ireland'>아일랜드</option>
						<option value='Canada'>캐나다</option>
						<option value='England'>영국</option>
						<option value='KOREA'>한국</option>
					</c:when>
					<c:when test="${searchMap.countrySearch eq 'USA'}">
						<option value='all'>국적</option>
						<option value='USA' selected>미국</option>
						<option value='Ireland'>아일랜드</option>
						<option value='Canada'>캐나다</option>
						<option value='England'>영국</option>
						<option value='KOREA'>한국</option>
					</c:when>
					<c:when test="${searchMap.countrySearch eq 'Ireland'}">
						<option value='all'>국적</option>
						<option value='USA'>미국</option>
						<option value='Ireland' selected>아일랜드</option>
						<option value='Canada'>캐나다</option>
						<option value='England'>영국</option>
						<option value='KOREA'>한국</option>
					</c:when>
					<c:when test="${searchMap.countrySearch eq 'Canada'}">
						<option value='all'>국적</option>
						<option value='USA'>미국</option>
						<option value='Ireland'>아일랜드</option>
						<option value='Canada' selected>캐나다</option>
						<option value='England'>영국</option>
						<option value='KOREA'>한국</option>
					</c:when>
					<c:when test="${searchMap.countrySearch eq 'England'}">
						<option value='all'>국적</option>
						<option value='USA'>미국</option>
						<option value='Ireland'>아일랜드</option>
						<option value='Canada'>캐나다</option>
						<option value='England' selected>영국</option>
						<option value='KOREA'>한국</option>
					</c:when>
					<c:when test="${searchMap.countrySearch eq 'KOREA'}">
						<option value='all'>국적</option>
						<option value='USA'>미국</option>
						<option value='Ireland'>아일랜드</option>
						<option value='Canada'>캐나다</option>
						<option value='England'>영국</option>
						<option value='KOREA' selected>한국</option>
					</c:when>
				</c:choose>
			</select> <select class="form-control" name='ageSearch'>
				<c:choose>
					<c:when test="${searchMap.ageSearch eq '0'}">
						<option value='0' selected>나이</option>
						<option value='20'>20대</option>
						<option value='30'>30대</option>
						<option value='40'>40대이상</option>
					</c:when>
					<c:when test="${searchMap.ageSearch eq '20'}">
						<option value='0'>나이</option>
						<option value='20' selected>20대</option>
						<option value='30'>30대</option>
						<option value='40'>40대이상</option>
					</c:when>
					<c:when test="${searchMap.ageSearch eq '30'}">
						<option value='0'>나이</option>
						<option value='20'>20대</option>
						<option value='30' selected>30대</option>
						<option value='40'>40대이상</option>
					</c:when>
					<c:when test="${searchMap.ageSearch eq '40'}">
						<option value='0'>나이</option>
						<option value='20'>20대</option>
						<option value='30'>30대</option>
						<option value='40' selected>40대이상</option>
					</c:when>
				</c:choose>
			</select> <select class="form-control" name='genderSearch'>
				<c:choose>
					<c:when test="${searchMap.genderSearch eq 'all'}">
						<option value='all' selected>성별</option>
						<option value='M'>남자</option>
						<option value='F'>여자</option>
					</c:when>
					<c:when test="${searchMap.genderSearch eq 'M'}">
						<option value='all'>성별</option>
						<option value='M' selected>남자</option>
						<option value='F'>여자</option>
					</c:when>
					<c:when test="${searchMap.genderSearch eq 'F'}">
						<option value='all'>성별</option>
						<option value='M'>남자</option>
						<option value='F' selected>여자</option>
					</c:when>
				</c:choose>
			</select>

			<!-- 				<input id="keyWordBox" type="text" name="keyword" placeholder="키워드를 입력해주세요"> -->
			<input class="form-control" type="text" name="keyword"
				placeholder="키워드를 입력해주세요"> <input class="btn btn-primary"
				type="submit" value="검색">
		</form>
	</div>
	<div id="tutorList">
		<c:choose>
			<c:when test="${empty tutorDtoList}">
				<div style="font-weight: bold; font-size: 25px;">조건에 만족하는 튜터가
					없습니다! 다시 검색해주세요~</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="tutorDto" items="${tutorDtoList}">
					<div
						class="tutorInfoDiv clearfix animate__animated animate__fadeInDown">
						<div class="img">
							<div class="scale tutorImgDiv"
								onclick="moveTutorIntroduceFnc(${tutorDto.memberNo});">
								<img alt="image not found" class='tutorImg'
									src="<c:url value='/img/${tutorDto.storeFileName}'/>">
							</div>
						</div>

						<div class="detailInfo">
							<div class="studyInfo">
								<div class="studyTitle"
									onclick="moveTutorIntroduceFnc(${tutorDto.memberNo});">
									<h4>
										<Strong>${tutorDto.studyName}</Strong>
									</h4>
									<input class="studyNameInput" type="hidden"
										value="${tutorDto.studyName}">
								</div>
								<div style="margin-left: 10px">
									<div>
										<span class="tutorName">${tutorDto.memberName}</span> <span
											class="country">${tutorDto.memberCountry}</span>
									</div>

									<div>
										<span class="price" id="priceDiv">30,000원 / 40분</span> <span
											class="score"> <c:forEach begin="1"
												end="${tutorDto.score}">
												<span style="color: #ff8b13;">★</span>
											</c:forEach> <c:forEach begin="${tutorDto.score}" end="4">
												<span style="color: grey;">★</span>
											</c:forEach> (${tutorDto.evaluationCount})
										</span>
									</div>
								</div>
							</div>
							<div class="flagBox">
								<img class="flagIcon" title="${tutorDto.memberCountry}"
									src="<c:url value='/resources/imgs/worldFlag/${tutorDto.memberCountry}.ico'/>">

							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>

	<div style="clear: left; padding: 30px">
		<jsp:include page="/WEB-INF/views/common/paging3.jsp">
			<jsp:param value="${pagingMap}" name="pagingMap" />
		</jsp:include>
	</div>

	<form action="./home.do#searchOptBox" id='pagingForm' method="get">
		<input type="hidden" name="countrySearch"
			value="${searchMap.countrySearch}"> <input type="hidden"
			name="ageSearch" value="${searchMap.ageSearch}"> <input
			type="hidden" name="genderSearch" value="${searchMap.genderSearch}">
		<input type="hidden" name="keyword" value="${searchMap.keyword}">
		<input type="hidden" id='curPage' name='curPage'
			value="${pagingMap.memberPaging.curPage}">
	</form>



</body>
<script type="text/javascript"
	src="/englishvillage/resources/js/alert.js"></script>
</html>
