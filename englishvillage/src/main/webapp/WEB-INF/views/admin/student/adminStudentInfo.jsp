<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보 상세조회</title>
<style type="text/css">
#allDiv {
	width: 1600px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	margin-top: 40px;
}

#studentProfileDiv {
	border: 1px solid black;
	width: 600px;
	font-size: 20px;
	box-sizing: border-box;
}

#lineDiv {
	border-bottom: 1px solid #BDBDBD;
}

.manual {
	margin-bottom: 80px;
}

#btn>input {
	width: 150px;
	height: 50px;
	float: right;
	background-color: black;
	color: white;
	font-weight: bold;
	border-radius: 5px 5px/5px 5px;
	font-size: 25px;
}

#memberProfileText {
	font-size: 40px;
	font-weight: bold;
}

#allmanual {
	margin-left: 30px;
}
</style>
<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$('.layoutUl').children().eq(0).addClass('on');
	});

	function pageMoveListFnc() {

		var noObj = $('#no');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');

		var url = '';

		url += './studentList.do?';
		url += 'no=' + noObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();

		location.href = url;

	}
</script>

</head>

<body>
	<!-- 337 3번 문제 MemberUpdateServlet 화면출력 위임 -->

	<jsp:include page="/WEB-INF/views/common/Header.jsp" />

	<div id="allDiv">

		<div id="menuDiv" class="col-md-3">
			<div class="layoutText">
				<span>회원 관리(학생)</span>
			</div>
			<jsp:include page="/WEB-INF/views/common/adminLayoutEx.jsp" />
		</div>


		<div id="studentProfileDiv" class="col-md-6">

			<form action='./studentUpdate.do' method='get'>
				<span id='memberProfileText'>회원정보</span>
				<div id='lineDiv'></div>
				<div id='allmanual'>

					<div class="manual">
						<span>성 명:</span> ${memberListDto.member_name}
					</div>

					<%-- 			번호: ${memberListDto.no}<br> --%>
					<div class="manual">Email: ${memberListDto.member_email}</div>

					<div class="manual">비밀번호: ${memberListDto.password}</div>

					<div class="manual">
						성별:
						<c:choose>
							<c:when test="${memberListDto.gender eq 'F'}">
								<c:out value="여자"></c:out>
							</c:when>
							<c:when test="${memberListDto.gender eq 'M'}">
								<c:out value="남자"></c:out>
							</c:when>
						</c:choose>
					</div>

					<div class="manual">
						생년월일:
						<fmt:formatDate value="${memberListDto.birthDate}"
							pattern="yyyy.MM.dd" />
					</div>

					<%-- 		언어: ${memberListDto.password}<br> --%>
					<div>국적: ${memberListDto.country}</div>

					<%-- 		시간대: ${memberListDto.password}<br> --%>

					<div>
						<input type="hidden" id='no' name="no" value="${memberListDto.no}">
						<input type="hidden" id='searchOption' name="searchOption"
							value="${searchOption}"> <input type="hidden"
							id='keyword' name="keyword" value="${keyword}">
					</div>
				</div>
				<div id='btn'>
					<input type='submit' value='수정하기' style="margin-right: 30px;">
					<input type='button' value='이전 페이지' onClick='pageMoveListFnc();'
						style="margin-right: 30px;">
				</div>
			</form>
		</div>
	</div>

</body>
</html>