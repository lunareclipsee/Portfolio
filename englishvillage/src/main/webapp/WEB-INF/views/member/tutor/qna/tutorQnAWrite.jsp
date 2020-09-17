<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>문의내용</title>
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
				$('form').attr('action', './tutorQnAWriteCtr.do');
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
						<th scope="row">이름</th>
						<td><div>${member.memberName}</div> <input type="hidden"
							name='no' value="${member.memberNo}">
					</tr>

					<tr>
						<th scope="row" style="vertical-align: middle;">제목</th>
						<td colspan="3"><input type="text" class="form-control"
							id="title" name="title" maxlength="30" placeholder="제목을 입력하세요">
						</td>
					</tr>
					<tr>
						<th scope="row" style="vertical-align: middle;">내용</th>
						<td colspan="3"><textarea class="form-control"
							id="content" name="content" maxlength="300"
							placeholder="내용을 입력하세요"></textarea></td>
					</tr>

				</table>

				<input id="okayBtn" class="btn btn-success" type="submit" value="작성완료">
				<input id="cancelBtn" class="btn btn-default" type="button"
					value="취소" onclick="location.href='tutorQnABoard.do'">
			</form>
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>