<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원 문의내역</title>
<style type="text/css">
</style>
<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.layoutUl').children().eq(4).addClass('on');

		// #gnb에 자식 요소(li)가 몇번째인지를 확인한 후 on이라는 클래스 추가

		$('#qna').on('click', function() {
			// 			var idxObj = $('#idx');
			var url = '';

			url += './questionAdd.do';

			location.href = url;
		});

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
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();

		location.href = url;
		return false;
	}
</script>
</head>

<body>
	<header><jsp:include page="/WEB-INF/views/common/Header.jsp" /></header>
	<div class="container bs-docs-container contentBox">
		<jsp:include page="/WEB-INF/views/common/memberLayoutEx.jsp" />
		<div class="col-md-9" style="margin-top: 40px">

			<div id="pageName">문의내역</div>

			<table class="table table-hover textCenter tableFont">
				<colgroup>
					<col width="15%">
					<col width="45%">
					<col width="20%">
					<col width="20%">

				</colgroup>
				<thead>
					<tr class="success">
						<th class="textCenter">문의번호</th>
						<th class="textCenter">제목</th>
						<th class="textCenter">문의일</th>
						<th class="textCenter">상태</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${not empty qusetionList}">
						<c:forEach var="questionDto" items="${qusetionList}">
							<tr>
								<td style="vertical-align: middle;"><div id="idxVal"
										class="td_status">${questionDto.idx}</div></td>
								<td class="textLeft" style="vertical-align: middle;"><div
										class="td_status">
										<a href="#" onclick="QnAReadFnc(this, event);"
											style="color: black;"> ${questionDto.title} </a>
									</div></td>


								<td><div class="td_status">
										<fmt:formatDate value="${questionDto.boardCreateDate}"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</div></td>

								<td style="vertical-align: middle;">
									<c:if
										test="${questionDto.answerStatus == 'Y'}">
										<div class="td_status" style="color: green; font-weight: 700">
											답변완료</div>
									</c:if> <c:if test="${questionDto.answerStatus == 'N'}">
										<div class="td_status"
											style="color: #ff5b5b; font-weight: 700">답변대기중</div>
									</c:if></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${empty qusetionList}">
						<tr>
							<td colspan="4">
								<div class="td_status">문의내역이 존재하지 않습니다.</div>
							</td>
						</tr>
					</c:when>
				</c:choose>
			</table>


			<input id="qna" class="btn btn-success" type="button" value="문의하기"
				style="float: right;">

			<!-- 리스트가 없으면 페이징 출력안함 -->
			<c:if test="${not empty qusetionList}">
				<jsp:include page="/WEB-INF/views/common/paging2.jsp">
					<jsp:param value="${pagingMap}" name="pagingMap" />
				</jsp:include>
				<form action="questionList.do" id="pagingForm" method="get">
					<input type="hidden" id="curPage" name="curPage"
						value="${pagingMap.memberPaging.curPage}">
				</form>
			</c:if>

			<!-- 검색창  -->
			<div style="margin-top: 20px;">
				<form id='searchingForm' class="form-inline"
					action="./questionList.do" method="post">
					<select id='searchOption' class="form-control" name='searchOption'>
						<c:choose>
							<c:when test="${searchMap.searchOption eq 'all'}">
								<option value="all" selected="selected">제목+내용</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
							</c:when>

							<c:when test="${searchMap.searchOption eq 'title'}">
								<option value="all">제목+내용</option>
								<option value="title" selected="selected">제목</option>
								<option value="content">내용</option>
							</c:when>

							<c:when test="${searchMap.searchOption eq 'content'}">
								<option value="all">제목+내용</option>
								<option value="title">제목</option>
								<option value="content" selected="selected">내용</option>
							</c:when>
						</c:choose>
					</select> <input type="text" id='keyword' class="form-control"
						name="keyword" value="${searchMap.keyword}"
						placeholder="제목 or 내용 검색"> <input type="submit"
						class="btn btn-primary" value="검색">
				</form>
			</div>
		</div>
	</div>

	<form action="/englishvillage/student/questionList.do" id="pagingForm"
		method="get">
		<input type="hidden" id="curPage" name="curPage"
			value="${pagingMap.memberPaging.curPage}"> <input
			type="hidden" name="searchOption" value="${searchMap.searchOption}">
		<input type="hidden" name="keyword" value="${searchMap.keyword}">
	</form>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>