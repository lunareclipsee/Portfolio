<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>내 정보</title>
<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.layoutUl').children().eq(2).addClass('on');
		$('td>input').css('border', 'none')
		$('td>input:hover').css('border', 'none')
		// #gnb에 자식 요소(li)가 몇번째인지를 확인한 후 on이라는 클래스 추가

	});
</script>

<style type="text/css">
#tableBox {
	width: 400px;
	margin: auto;
	margin-top: 70px;

}
</style>
</head>

<body>
	<header><jsp:include page="/WEB-INF/views/common/Header.jsp" /></header>
	<div class="container bs-docs-container contentBox">
		<jsp:include page="/WEB-INF/views/common/memberLayoutEx.jsp" />
		<div class="col-md-9" style="margin-top: 40px">

			<div id="pageName">회원정보</div>

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
						<td><span>**********</span></td>
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
				<input type="button" value="수정하기" class="btn btn-primary btn-lg pull-right"
					onClick="location.href='/englishvillage/student/studentCheck.do'">
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>