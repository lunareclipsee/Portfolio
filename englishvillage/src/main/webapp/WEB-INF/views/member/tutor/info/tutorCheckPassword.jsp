<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>정보수정-본인확인</title>

<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('.layoutUl').children().eq(3).addClass('on');
});

function checkFnc() {
	var pwd = document.getElementById('Password').value;
	var pwdCheck = document.getElementById('PasswordCheck').value;
	
	if(pwd == pwdCheck) {
		location.href = "tutorInfoRevise.do";
	}else {
		alert('비밀번호가 틀렸습니다');
	}
}
</script>
</head>

<body>

<header><jsp:include page="/WEB-INF/views/common/Header.jsp" /></header>
	<div class="container bs-docs-container contentBox">

		<jsp:include page="/WEB-INF/views/common/memberLayoutEx.jsp" />
	
		<div id="myPageBox">
			<div id="pageName">본인인증
			</div>
			
			<div id="checkBox">
				<div id="pwdWrite">개인정보 변경을 위해 비밀번호를 입력해주세요</div><br/>
				<input type="password" placeholder="비밀번호" value="" name="memberPassword" id='PasswordCheck'>
				<input type="hidden" value="${member.memberPassword}" name="memberPassword" id='Password'><br/><br/>
				<button onclick="location.href='tutorPrivateInfo.do'" id="pwdCheckBtnBack" class="btn btn-success">뒤로가기</button>
				<button onclick="checkFnc();" id="pwdCheckBtnUpdate" class="btn btn-success">수정하기</button>
			
			</div>
										
			
			
		</div>
	</div>
	
	

</body>

</html>