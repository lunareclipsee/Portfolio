<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Hello Spring</title>

<style type="text/css">
	#menuList > div {
		border: 1px solid black; width: 200px;
		background-color: orange;
		margin: 20px;
	}
</style>

<script type="text/javascript">

	window.onload = function () {
		location.href = '/englishvillage/tutor/home.do'
	}

	var loginMoveFnc = function(){
		location.href = '/englishvillage/auth/login.do';
	}
	
	var tutorListMoveFnc = function() {
		location.href = '/englishvillage/tutor/home.do'
	}
	
	var tutorIntroduceMoveFnc = function() {
		location.href = '/englishvillage/tutor/tutorIntroduce.do'
	}
	
	var adminMoveFnc = function() {
		location.href = '/englishvillage/admin/studentList.do'
	}
	
	var adminMove1Fnc = function() {
		location.href = '/englishvillage/admin/tutorList.do'
	}
	
	var adminMove2Fnc = function() {
		location.href = '/englishvillage/admin/questionList.do'
	}
	
</script>


<body>
<!-- <div id="menuList"> -->
<!-- 	<div onclick="loginMoveFnc();" > -->
<!-- 		로그인 버튼 -->
<!-- 	</div> -->
	
<!-- 	<div onclick="mainMoveFnc();" > -->
<!-- 		메인페이지 -->
<!-- 	</div> -->
	
<!-- 	<div onclick="tutorListMoveFnc();" > -->
<!-- 		튜터 목록 -->
<!-- 	</div> -->
	
<!-- 	<div onclick="tutorIntroduceMoveFnc();" > -->
<!-- 		튜터 소개 페이지 -->
<!-- 	</div> -->
	
<!-- 	<div onclick="adminMoveFnc();" > -->
<!-- 		관리자 학생 페이지 -->
<!-- 	</div> -->
	
<!-- 	<div onclick="adminMove1Fnc();" > -->
<!-- 		관리자 튜터 페이지 -->
<!-- 	</div> -->
	
<!-- 	<div onclick="adminMove2Fnc();" > -->
<!-- 		관리자 문의 페이지 -->
<!-- 	</div> -->
<!-- </div> -->
	
</body>

</html>