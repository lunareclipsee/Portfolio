<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>문의하기</title>
<style type="text/css">
tr>th {
	text-align: center;
}

td {
	text-align: left;
}
</style>

<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$('#title').focus();
		$('.layoutUl').children().eq(4).addClass('on');
		// 		$('#okBtn').on('click', function(){
		// 			alert("문의글 작성이 완료되었습니다");
		// 	      	$('form').attr('action', 'QuestionAddCtr.do');

		// 	    });

		$('input[type=submit]').click(function() {

			if ($('#title').val() == "") {
				alert("제목을 입력해주세요");
				$('#title').focus()
				return false;
			} else if ($('#content').val() == "") {
				alert("내용을 입력해주세요");
				$('#content').focus()
				return false;
			} else if ($('#title').val() && $('#content').val() != "") {

				alert("문의글 작성이 완료되었습니다!");
				$('form').attr('action', './questionAddCtr.do');
			}

		})

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

			<div id="pageName">문의하기</div>

			<form method="post">

				<table id='qnaAddTable' class="table table-bordered textCenter"
					summary="문의하기">

					<tr>
						<th class="success">이름</th>
						<td><div>${member.memberName}</div> <input type="hidden"
							name='no' value="${member.memberNo}">
					</tr>

					<tr>
						<th class="success" style="vertical-align: middle;">제목</th>
						<td colspan="3"><input type="text" class="form-control"
							id="title" name="title" maxlength="30" placeholder="제목을 입력하세요">
						</td>
					</tr>
					<tr>
						<th class="success" style="vertical-align: middle;">내용</th>
						<td colspan="3"> <textarea class="form-control success"
								id="content" name="content" maxlength="300" rows="5"
								style="resize: none;" placeholder="내용을 입력하세요"></textarea></td>
					</tr>

				</table>

				<input id="okBtn" class="btn btn-success" type="submit" value="작성완료">
				<input id="cancelBtn" class="btn btn-default" type="button"
					value="취소" onclick="questionListMoveFnc()">


			</form>
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>