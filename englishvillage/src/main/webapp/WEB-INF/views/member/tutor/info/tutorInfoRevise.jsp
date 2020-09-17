<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>튜터 정보 수정2</title>
<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('.layoutUl').children().eq(3).addClass('on');
        
    $('#modifyPassword').submit(function() {
    	
    	if($('#pwdRevise').val() == $('#pwdReviseCheck').val()) {
    		    		
    	}else{
    		alert('비밀번호와 비밀번호 확인이 일치하지않습니다');
    		return false;
    	}
    });
    
    $('#updateReviseBtn').on("click", function() {
    	
    	if($('#pwdRevise').val() == "" || $('#pwdReviseCheck').val() == "") {
    		alert('비밀번호와 비밀번호 확인을 작성해주세요');
    		return false;
    		
		  	}else{
    	}
    });
});
</script>
</head>

<body>

	<header><jsp:include page="/WEB-INF/views/common/Header.jsp" /></header>
	<div class="container bs-docs-container contentBox">
		<jsp:include page="/WEB-INF/views/common/memberLayoutEx.jsp" />
		<div class="col-md-9" style="margin-top: 40px">

			<div id="pageName">회원정보수정</div>
				<div class="profileTitle">
					<div class="profileContents">
						이름
					</div>
					<div class="profileContents">
						Email
					</div>
					<div class="profileContents">
						비밀번호
					</div>
					<div class="profileContents">
						비밀번호확인
					</div>
					<br/>
					<div class="profileContents">
						성별
					</div>
					<div class="profileContents">
						생년월일
					</div>
					<div class="profileContents">
						국적
					</div>
			</div>
		<form id="modifyPassword" action="./tutorPrivateInfoCtr.do" method="post">	
			<div class="profileTitle">
				<div class="profileContents">
					<input type="text" disabled="disabled" value="${tutorDto.memberName}">
				</div>
				<div class="profileContents">
					<input type="text" disabled="disabled" name="memberEmail" value="${tutorDto.memberEmail}">
				</div>
				<div class="profileContents">
					<input id="pwdRevise" type="password" value="" name="memberPassword">
				</div>
				<div class="profileContents">
					<input id="pwdReviseCheck" type="password" value="">
				</div>
				<br/>
				<div class="profileContents">
					<input type="text" disabled="disabled" value="${tutorDto.memberGender}">
				</div>
				<div class="profileContents">
					<input type="text" disabled="disabled" value="<fmt:formatDate value="${tutorDto.memberBirthDate}"  pattern="yyyy-MM-dd"/>">
				</div>
				<div class="profileContents">
					<input type="text" disabled="disabled" value="${tutorDto.memberCountry}">
					
				</div>
				<input type="hidden" name="memberNo" value="${member.memberNo}"	>
			</div>
						
			<button id="updateReviseBtn"
				class="btn btn-success"
				style="margin-top: 160px;">
				수정하기
			</button>
		</form>
			<button class="btn btn-success" id="deleteReviseBtn"
			onclick="location.href='tutorWithdraw.do'">
				회원탈퇴
			</button>
			<button class="btn btn-success" id="backReviseBtn"
			onclick="location.href='tutorPrivateInfo.do'">
				뒤로가기
			</button>
		
		</div>
	</div>

	

</body>

</html>