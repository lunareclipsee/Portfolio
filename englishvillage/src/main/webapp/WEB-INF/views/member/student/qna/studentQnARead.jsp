<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>나의 문의글</title>
<style type="text/css">
#qnaReadBox {
	width: 1100px;
	height: 600px;
	border: 1px solid #707070;
}
</style>

<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('.layoutUl').children().eq(4).addClass('on');
	});
</script>

<style type="text/css">
</style>
</head>

<body>
	<header><jsp:include page="/WEB-INF/views/common/Header.jsp" /></header>
	<div class="container bs-docs-container contentBox">
		<jsp:include page="/WEB-INF/views/common/memberLayoutEx.jsp" />
		<div class="col-md-9" style="margin-top: 40px">

			<div id="pageName">내 문의</div>

			<!-- 				<form action="./questionRevise.do" method="post"> -->

			<table id='qnaTable' class="table table-bordered">

				<tr>
					<th class="textCenter success" scope="row">문의번호</th>
					<td class="textCenter"><div id="idxBox">${questionBoardDto.idx}</div></td>
					<th class="textCenter success" scope="row">문의일</th>
					<td>
						<div id='boardCreateDate'>
							<fmt:formatDate value="${questionBoardDto.boardCreateDate}"
								pattern="yyyy-MM-dd a hh:mm:ss" />
						</div>
					</td>
				</tr>

				<tr>
					<th class="textCenter success" scope="row">제목</th>
					<td colspan="3">
						<div style="margin-left: 20px">${questionBoardDto.title}</div>

					</td>
				</tr>
				<tr>
					<th class="textCenter success">내용</th>
					<td colspan="3">
						<div style="margin-left: 20px">${questionBoardDto.content}</div>
					</td>
				</tr>
				<c:if test="${not empty questionBoardDto.reply}">
					<tr>
						<th class="textCenter success">답변</th>
						<td colspan="3">
							<div id='reply' style="margin-left: 20px">${questionBoardDto.reply}</div>
							<div style="margin-left: 20px; float: right;">
								답변일 :
								<fmt:formatDate value="${questionBoardDto.commentCreateDate}"
									pattern="yyyy-MM-dd a hh:mm:ss" />
							</div>
						</td>
					</tr>
				</c:if>
			</table>

			<c:if test="${empty questionBoardDto.reply}">
				<!-- 이렇게 해줘야 레알 히든임 -->
				<input class="btn btn-success" type="button" value="수정하기"
					onclick="moveFnc('./questionRevise.do?idx=${questionBoardDto.idx}')">
			</c:if>

			<input id="backListBtn" class="btn btn-default" type="button"
				value="목록"
				onclick="moveFnc('./questionList.do?idx=${questionBoardDto.idx}&keyword=${keyword}&searchOption=${searchOption}')">
			<!-- 				</form> -->
		</div>

	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>