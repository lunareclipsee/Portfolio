<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>수강내역</title>
<style type="text/css">
</style>

<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="https://han3283.cafe24.com/js/lightslider/css/lightslider.css" />
<script
	src="https://han3283.cafe24.com/js/lightslider/js/lightslider.js"></script>


<script type="text/javascript">
	$(document).ready(
			function() {
				$('.layoutUl').children().eq(3).addClass('on');

				/* 제목 입력 시 미리보기 반영 */
				var titleMaxLenght = 30;

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
</head>

<body>
	<header><jsp:include page="/WEB-INF/views/common/Header.jsp" /></header>
	<div class="container bs-docs-container contentBox">
		<jsp:include page="/WEB-INF/views/common/memberLayoutEx.jsp" />
		<div class="col-md-9" style="margin-top: 40px">

			<div id="pageName">수강내역</div>

			<table class="table table-hover textCenter tableFont">

				<colgroup>
					<col width="20%">
					<col width="35%">
					<col width="20%">
					<col width="15%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr class="success">
						<th class='textCenter'>수강일</th>
						<th class='textCenter'>강의제목</th>
						<th class='textCenter'>튜터</th>
						<th class='textCenter'>포인트</th>
						<th class='textCenter'>상태</th>
					</tr>
				</thead>

				<c:choose>
					<c:when test="${not empty studyList}">
						<c:forEach var="studyDto" items="${studyList}">
							<tr>
								<td><div class="td_status">
										<fmt:formatDate value="${studyDto.studyDate}"
											pattern="yyyy-MM-dd hh:mm:ss" />
									</div></td>
								<td style="vertical-align: middle;" class="textLeft"><div
										class="td_status studyName">${studyDto.studyName}</div> <input
									class="studyNameInput" type="hidden"
									value="${studyDto.studyName}"></td>

								<td style="vertical-align: middle;"><div class="td_status">
										<a
											href="/englishvillage/tutor/tutorSelectOne.do?tutorNo=${studyDto.tutorNo}">
											${studyDto.tutorName}</a>
									</div></td>
								<td style="vertical-align: middle;">
									<div class="td_status">- ${studyDto.price}</div>
								</td>
								<c:choose>
									<c:when test="${studyDto.evaluateCheck == 'Y'}">
										<td style="vertical-align: middle;">
											<div class="td_status">
												<a class="btn btn-success"
													href="/englishvillage/tutor/tutorSelectOne.do?tutorNo=${studyDto.tutorNo}#evaluate">
													후기확인</a>
											</div>
										</td>
									</c:when>
									<c:when test="${studyDto.evaluateCheck == 'N'}">
										<td style="vertical-align: middle;"><div
												class="td_status">
												<a class="btn btn-danger"
													href="/englishvillage/tutor/tutorSelectOne.do?tutorNo=${studyDto.tutorNo}#commentContents">
													후기작성</a>
											</div></td>
									</c:when>
								</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5"><div class="td_status">수강내역이 존재하지
									않습니다.</div></td>
						<tr>
					</c:otherwise>
				</c:choose>

			</table>

			<!-- 수강내역이 없으면 튜터 추천  -->
			<c:if test="${empty studyList}">
				<img src="<c:url value='/resources/imgs/icon-medal-gold.png'/>"></img>
				<span class="animate__animated animate__rubberBand"
					style="font-size: 15px; font-weight: 500;">최고의 선생님들을 만나보세요!</span>
				<jsp:include page="/WEB-INF/views/common/tutorIntro.jsp" />
			</c:if>
			<c:if test="${not empty studyList}">
				<jsp:include page="/WEB-INF/views/common/paging2.jsp">
					<jsp:param value="${pagingMap}" name="pagingMap" />
				</jsp:include>
				<form action="studyList.do" id="pagingForm" method="get">
					<input type="hidden" id="curPage" name="curPage"
						value="${pagingMap.memberPaging.curPage}">
				</form>
			</c:if>
		</div>



	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>