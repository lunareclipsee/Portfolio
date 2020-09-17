<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.layoutUl').children().eq(1).addClass('on');

	});

	function QnAReadFnc(obj, event) {
		var aTagObj = $(obj);
		event.preventDefault();

		var url = '';
		var memberNoObj = '';
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');

		memberNoObj = aTagObj.parent().parent().parent().children('td').eq(0)
				.children();

		url += './questionSelect.do?';
		url += 'idx=' + memberNoObj.html();

		location.href = url;
		return false;
	}

	function moveButPointFnc() {

		location.href = "/englishvillage/student/buyPoint.do";

	}
</script>


<style type="text/css">
a {
	cursor: pointer;
}
</style>
</head>

<body>
	<header><jsp:include page="/WEB-INF/views/common/Header.jsp" /></header>
	<div class="container bs-docs-container contentBox">
		<jsp:include page="/WEB-INF/views/common/memberLayoutEx.jsp" />
		<div class="col-md-9" style="margin-top: 40px">
			<div id="pageName">마이 페이지</div>
			<div class="container">
				<!-- 최근 문의 테이블 시작 -->
				<div class="col-md-4 animate__animated animate__slideInUp">
					<h4 style="font-weight: bold;">
						<a href="/englishvillage/student/questionList.do">최근문의 내역</a>
					</h4>
					<table class="table table-hover tableFontMain">
						<colgroup>
							<col width="10%">
							<col width="40%">
							<col width="20%">
							<col width="20%">

						</colgroup>
						<thead>
							<tr class="success">
								<th class="textCenter">번호</th>
								<th class="textCenter">제목</th>
								<th class="textCenter">날짜</th>
								<th class="textCenter">상태</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${empty qusetionList}">
								<tr>
									<td colspan="4">
										<div class="td_status">문의내역이 존재하지 않습니다.</div>
									</td>
								</tr>
							</c:when>

							<c:when test="${not empty qusetionList}">
								<c:forEach var="questionDto" items="${qusetionList}">
									<tr>
										<td class="textCenter"><div id="idxVal" class="td_status">${questionDto.idx}</div></td>
										<td class="textLeft"><div class="td_status">
												<a href="#" onclick="QnAReadFnc(this, event);"
													style="color: black;"> ${questionDto.title} </a>
											</div></td>


										<td class="textCenter"><div class="td_status">
												<fmt:formatDate value="${questionDto.boardCreateDate}"
													pattern="yyyy-MM-dd" />
											</div></td>

										<td class="textCenter"><c:if
												test="${questionDto.answerStatus == 'Y'}">
												<div class="td_status"
													style="color: green; font-weight: 700">답변완료</div>
											</c:if> <c:if test="${questionDto.answerStatus == 'N'}">
												<div class="td_status"
													style="color: #ff5b5b; font-weight: 700">답변대기중</div>
											</c:if></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>
				</div>
				<!-- 최근문의내역 테이블 끝-->

				<!-- 최근 수강내역 -->
				<div class="col-md-5 animate__animated animate__slideInUp">
					<h4 style="font-weight: bold;">
						<a href="/englishvillage/student/studyList.do">최근수강 내역</a>
					</h4>
					<table class="table table-hover tableFontMain">

						<colgroup>
							<col width="10%">
							<col width="50%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr class="success">
								<th class='textCenter'>번호</th>
								<th class='textCenter'>제목</th>
								<th class='textCenter'>날짜</th>
								<th class='textCenter'>튜터</th>
							</tr>
						</thead>

						<c:choose>
							<c:when test="${not empty studyList}">
								<c:forEach var="studyDto" items="${studyList}">
									<tr>
										<td class="textCenter"><div class="td_status">${studyDto.rnum}</div></td>
										<td style="vertical-align: middle;" class="textLeft"><div
												class="td_status">${studyDto.studyName}</div></td>

										<td class="textCenter"><div class="td_status">
												<fmt:formatDate value="${studyDto.studyDate}"
													pattern="yyyy-MM-dd" />
											</div></td>

										<td class="textCenter"><div class="td_status">
												<a
													href="/englishvillage/tutor/tutorSelectOne.do?tutorNo=${studyDto.tutorNo}">
													${studyDto.tutorName}</a>
											</div></td>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4"><div class="td_status textCenter">수강내역이
											존재하지 않습니다.</div></td>
								<tr>
							</c:otherwise>
						</c:choose>

					</table>
				</div>
			</div>
			<!-- 최근수강내역 테이블 끝-->
			<!-- 튜터 추천  -->
			<div class="slide-content animate__animated animate__slideInUp"
				style="margin-top: 10px">
				<img src="<c:url value='/resources/imgs/icon-medal-gold.png'/>"></img>
				<span class="animate__animated animate__rubberBand"
					style="font-size: 15px; font-weight: 500;">최고의 선생님들을 만나보세요!</span>
				<jsp:include page="/WEB-INF/views/common/tutorIntro.jsp" />
			</div>
		</div>
		<!-- 컨텐츠 박스 끝 -->
	</div>
	<!-- 메인박스 끝 -->
</body>
</html>