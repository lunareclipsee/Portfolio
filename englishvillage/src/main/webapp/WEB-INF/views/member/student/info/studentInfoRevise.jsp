<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원정보 수정</title>
<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.layoutUl').children().eq(2).addClass('on');

		$('input[value=변경하기]').click(function() {

			var password = $('#inputPwd');
			var passwordChk = $('#inputPwdChk');

			if (password.val() == "") {
				alert("비밀번호를 입력해주세요.");
				password.focus()
				return false;
			} else if (passwordChk.val() == "") {
				alert("비밀번호확인란을 입력해주세요.");
				passwordChk.focus()
				return false;
			} else if (password.val() != passwordChk.val()) {
				alert("입력하신 비밀번호와 일치하지 않습니다. 다시한번 확인해주세요");
				passwordChk.focus()
				return false;
			} else if (password.val() == passwordChk.val()) {
				alert("회원정보가 성공적으로 변경되었습니다!");
				$('form').attr('action', './updateCtr.do');
			}
		})

		//     	if ($('input[type=password]').val() == "") {
		//     	alert("비밀번호를 입력해주세요.");
		//     	$('input[type=password]').focus()
		//     	return false;
		// 		} else if ($('input[type=password]').val() != "") {

		//     	alert("회원정보가 성공적으로 변경되었습니다!");
		//     	$('form').attr('action', './updateCtr.do');
		// 		}

		//     })
	});
</script>

<style type="text/css">
</style>
</head>

<body>
	<header><jsp:include page="/WEB-INF/views/common/Header.jsp" /></header>
	<div class="container bs-docs-container contentBox">
		<jsp:include page="/WEB-INF/views/common/memberLayoutEx.jsp" />
		<form action='' method='post'>
			<div class="col-md-9" style="margin-top: 40px">

				<div id="pageName">회원정보 수정</div>


				<div id="tableBox">
					<table class="table table-hover tableFont">

						<colgroup>
							<col width="20%">
							<col width="30%">

						</colgroup>
						<tr>
							<th class='tCenter'><span>이름</span></th>
							<td><span>${memberFileDto.memberName}</span></td>
						</tr>
						<tr>
							<th class='tCenter'><span>이메일</span></th>
							<td><span>${memberFileDto.memberEmail}</span></td>
						</tr>
						<tr>
							<th class='tCenter'><span>비밀번호</span></th>
							<td><span class="form-group"><input id="inputPwd" type="password"
									class="form-control" name="memberPassword"
									placeholder="새로운 비밀번호" maxlength="12"></span></td>
						</tr>
						<tr>
							<th class='tCenter'><span>비밀번호 확인</span></th>
							<td><span class="form-group"><input id="inputPwdChk" type="password"
									class="form-control" placeholder="비밀번호 확인" maxlength="12"></span></td>
						</tr>
						<tr>
							<th class='tCenter'><span>성별</span></th>
							<td><span> <c:if
										test="${memberFileDto.memberGender == 'M'}">
											남자
										</c:if> <c:if test="${memberFileDto.memberGender == 'F'}">
											여자			
										</c:if>
							</span></td>
						</tr>
						<tr>
							<th class='tCenter'><span>생일</span></th>
							<td><span><fmt:formatDate
										value="${memberFileDto.memberBirthDate}" pattern="yyyy-MM-dd" /></span>
							</td>
						</tr>
						<tr>
							<th class='tCenter'><span>국적</span></th>
							<td><span>${memberFileDto.memberCountry}</span></td>
						</tr>
					</table>
				</div>

			</div>
			<input class="btn btn-primary btn-lg pull-right"
				style="margin-left: 20px" type='submit' value='변경하기'> <input
				class="btn btn-default btn-lg pull-right" type='button' value='돌아가기'
				onClick='myInfoMoveFnc();'>
		</form>
		<form action='delete.do' method='POST'>
			<input class="btn btn-danger btn-lg" type='submit' value='회원탈퇴'>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>