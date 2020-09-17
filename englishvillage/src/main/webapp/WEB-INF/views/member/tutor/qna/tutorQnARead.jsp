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

					<table id='qnaTable' class="table table-bordered">
					
						<tr>
							<th class="textCenter" scope="row">문의번호</th>
							<td class="textCenter"><div id="idxBox">${questionBoardDto.boardNo}</div></td>
							<th class="textCenter" scope="row">문의일</th>
							<td>
								<div id='boardCreateDate'>
									<fmt:formatDate value="${questionBoardDto.boardCreateDate}"
										pattern="yyyy-MM-dd a hh:mm:ss" />
								</div>
							</td>
						</tr>

						<tr>
							<th class="textCenter" scope="row">제목</th>
							<td colspan="3">
								<div style="margin-left: 20px">${questionBoardDto.title}</div>

							</td>
						</tr>
						<tr>
							<th class="textCenter">내용</th>
							<td colspan="3">
								<div style="margin-left: 20px">${questionBoardDto.content}</div>
							</td>
						</tr>
							<c:if test="${questionBoardDto.answerStatus == 'Y'}">
								<tr>
									<th class="textCenter">답변</th>
									<td colspan="3">
										<div id='reply' style="margin-left: 20px">${questionBoardDto.reply}</div>
										<div style="margin-left: 20px; float: right;">
											답변일 : <fmt:formatDate value="${questionBoardDto.commentCreDate}" 
 												pattern="yyyy-MM-dd a hh:mm:ss" />  
										</div>
									</td>
								</tr>
							</c:if>
					</table>

					<c:if test="${questionBoardDto.answerStatus == 'N'}">
							<input class="btn btn-success" type="button" 
								value="수정하기" onclick="moveFnc('./tutorQnARevise.do?idx=${questionBoardDto.boardNo}')">
					</c:if>
					<input id="backListBtn" class="btn btn-default" type="button" 
						value="목록" onclick="moveFnc('./tutorQnABoard.do?idx=${questionBoardDto.boardNo}&curPage=${curPage}')"> 
		</div>

	</div>

	<input id="curPage" type="hidden" name="curPage" value="${curPage}">
	<input id="idx" type="hidden" name="curPage" value="${curPage}">

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>