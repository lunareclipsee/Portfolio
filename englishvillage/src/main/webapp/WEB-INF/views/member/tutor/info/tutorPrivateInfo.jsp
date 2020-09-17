<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원정보 수정</title>
<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('.layoutUl').children().eq(3).addClass('on');
});
</script>
</head>

<body>


	<header><jsp:include page="/WEB-INF/views/common/Header.jsp" /></header>
	<div class="container bs-docs-container contentBox">
		<jsp:include page="/WEB-INF/views/common/memberLayoutEx.jsp" />
		<div class="col-md-9" style="margin-top: 40px">

			<div id="pageName">회원정보수정</div>
				<div class="profileTitle" style="font-weight: bold;">
					<div class="profileContents">
						이름
					</div>
					<div class="profileContents">
						Email
					</div>
					<div class="profileContents">
						비밀번호
					</div>
					<br/><br/>
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
			<form action="tutorCheckPassword.do">	
				<div class="profileTitle">
					<div class="profileContents">
						${tutorDto.memberName}
					</div>
					<div class="profileContents">
						${tutorDto.memberEmail}
					</div>
					<div class="profileContents">
						********
					</div>
					<br/><br/>
					<div class="profileContents">
						${tutorDto.memberGender}
					</div>
					<div class="profileContents">
						<fmt:formatDate value="${tutorDto.memberBirthDate}"  pattern="yyyy-MM-dd"/>
					</div>
					<div class="profileContents">
						${tutorDto.memberCountry}
					</div>
				</div>
						
					<input type="submit" value="수정하기" id="updateBtn" class="btn btn-success btn-lg">	
			</form>
			
		</div>
	</div>
	

</body>

</html>