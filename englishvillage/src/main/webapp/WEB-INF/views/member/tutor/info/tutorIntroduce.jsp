<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>튜터소개수정</title>
<script type="text/javascript"
	src="/englishvillage/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('.layoutUl').children().eq(2).addClass('on');
});
</script>
</head>

<body>

	<header><jsp:include page="/WEB-INF/views/common/Header.jsp" /></header>
	<div class="container bs-docs-container contentBox">
		<jsp:include page="/WEB-INF/views/common/memberLayoutEx.jsp" />
		<div class="col-md-9" style="margin-top: 40px">

			<div id="pageName">튜터소개</div>
			<div id="profileImages">
			    <div id='preview'>
			        <img alt="image not found" id="previewImg"
					src="<c:url value='/img/${tutorDto.storeFileName}'/>">
		    	</div>
			</div>
			<div id="profileAll" style="margin-top: 50px; border-style: none;">
				<div class="profileInfoContents">
					이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름 : 
					${tutorDto.memberName}
				</div>
				<div class="profileInfoContents">
					국&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;적 : 
					${tutorDto.memberCountry}
				</div>
				<div class="profileInfoContents">
					나&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이 : 
					${tutorDto.age}
				</div>
				<div class="profileInfoContents">
					평&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점 : ${tutorDto.score}
				</div>
				<div class="profileInfoContents">
					수 &nbsp;&nbsp;업 &nbsp;료 : ${tutorDto.price}
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					시간/회
				</div>
				<div class="profileInfoContents">
					U &nbsp;&nbsp;&nbsp;R &nbsp;&nbsp;&nbsp;L &nbsp;: ${tutorDto.youtubeUrl}
				</div>
				<div class="profileInfoContents">
					강의&nbsp; 제목 : ${tutorDto.studyName}
				</div>
			</div>
			<div>
				<textarea id="introduceContents" disabled="disabled" 
				style="margin-left: 80px;">${tutorDto.tutorIntroduce}
				</textarea>
			</div>
			<form action="tutorMainPage.do">
				<button class="btn btn-success" id="backBtnMove">뒤로가기</button>
			</form>
			<form action="tutorIntroduceRevise.do">
				<button class="btn btn-success" id="updateBtnMove">수정하기</button>
			</form>
			
		</div>
	</div>


</body>

</html>