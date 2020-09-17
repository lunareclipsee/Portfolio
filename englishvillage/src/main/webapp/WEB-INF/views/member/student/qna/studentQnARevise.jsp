<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>문의 수정</title>
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

		$('#okBtn').on('click', function() {
			
			if ($('#title').val() == "") {
				alert("제목을 입력해주세요.");
				$('#title').focus();
				return false;
			}else if ($('#content').val() == "") {
				alert("내용을 입력해주세요.");
				$('#content').focus();
				return false;
			}
			alert("문의글 수정이 완료되었습니다.");
			$('form').attr('action', './questionReviseCtr.do');
		});

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

			<div id="pageName">문의 수정</div>

				<form method="post">
				
					<table id='qnaReviceTable' class="table table-bordered">

						<tr>
							<th class="textCenter success" scope="row">문의번호</th>
							<td><div class="textCenter">${questionBoardDto.idx}</div> 
								<input id='idx' type="hidden" name='idx' value='${questionBoardDto.idx}'>
							</td>
							<th class="textCenter success" scope="row">문의일</th>
							<td><div id='boardCreateDate'>
									<fmt:formatDate value="${questionBoardDto.boardCreateDate}"
										pattern="yyyy-MM-dd a hh:mm:ss" />
								</div></td>
						</tr>

						<tr>
							<th scope="row" class="textCenter success" style="vertical-align: middle;">제목</th>
							<td colspan="3">
								<input type="text" class="form-control" id="title" name="title" maxlength="30" value="${questionBoardDto.title}">
							</td>
						</tr>
						<tr>
							<th scope="row" class="textCenter success" style="vertical-align: middle;">내용</th>
							<td colspan="3">
							<textarea class="form-control" id="content" name="content"  maxlength="300" rows="5" style="resize: none;">${questionBoardDto.content}</textarea>
							
							
<%-- 								<input type="text" class="form-control" id="content" name="content" maxlength="300" value="${questionBoardDto.content}"> --%>
							</td>
						</tr>
					</table>
							<input id="okBtn" class="btn btn-success" type="submit" value="변경하기">
							<input id="cancelBtn" class="btn btn-default" type="button" value="취소"	onclick="moveFnc('./questionSelect.do?idx=${questionBoardDto.idx}')">

				</form>
		</div>

	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>