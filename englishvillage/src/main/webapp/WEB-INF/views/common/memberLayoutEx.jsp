<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
	<c:when test="${member.memberGrade eq 'Y'}">
		<link rel="stylesheet" type="text/css"
			href="/englishvillage/resources/css/student.css?ver=1.5">
		<link rel="stylesheet" type="text/css"
			href="/englishvillage/resources/css/tutor.css?ver=1.5">
	</c:when>

	<c:when test="${member.memberGrade eq 'N'}">
		<link rel="stylesheet" type="text/css"
			href="/englishvillage/resources/css/student.css?ver=1.4">
	</c:when>

	<c:otherwise>
		<link rel="stylesheet" type="text/css"
			href="/englishvillage/resources/css/student.css?ver=1.4">
	</c:otherwise>
</c:choose>
<script type="text/javascript">
	function moveFnc(addr) {

		location.href = addr;
	}

	var loginMoveFnc = function() {
		location.href = '/englishvillage/student/login.do';
	}

	var myPageMoveFnc = function() {
		location.href = '/englishvillage/student/myPage.do'
	}

	var myInfoMoveFnc = function() {
		location.href = '/englishvillage/student/myInfo.do'
	}

	var questionListMoveFnc = function() {
		location.href = '/englishvillage/student/questionList.do'
	}

	function pageMoveDeleteFnc(no) {
		var url = "/englishvillage/student/deleteCtr.do?no=" + no;
		location.href = url;
	}

	var tutorListMoveFnc = function() {
		location.href = '/englishvillage/home.do'
	}

	var tutorIntroduceMoveFnc = function() {
		location.href = '/englishvillage/tutorIntroduce.do'
	}

	var adminMoveFnc = function() {
		location.href = '/englishvillage/admin/studentlist.do'
	}

	var adminMove1Fnc = function() {
		location.href = '/englishvillage/admin/tutorlist.do'
	}

	var adminMove2Fnc = function() {
		location.href = '/englishvillage/admin/questionlist.do'
	}
</script>

<style type="text/css">
/* dl, ul, ol, menu, li { */
/* 	list-style: none; */
/* } */
#mainBox {
	box-sizing: border-box;
	background-color: black;
	border-radius: 30px;
	padding: 50px 0px;
}

#memberName {
	font-size: 20px;
	font-weight: bold;
	color: white;
	text-align: center;
}

.layoutUl li {
	width: 160px;
	height: 40px;
	margin-bottom: 40px;
	border-radius: 30px;
	text-align: center;
	margin: auto;
	margin-bottom: 40px;
}

.layoutUl li.on {
	margin-bottom: 40px;
	width: 160px;
	height: 40px;
	background-color: #778F44;
	border-radius: 30px;
	text-align: center;
	margin: auto;
	margin-bottom: 40px;
}

.layoutUl li a:hover {
	/*  	color: #d9edf7; */
	color: black;
	background-color: #778F44;
	border-radius: 30px;
	width: 160px;
	height: 40px;
}

.layoutUl>li>a {
	color: white;
	text-decoration: none;
	font-size: 18px;
	text-align: center;
	font-weight: bold;
	line-height: 23px;
}

.tableFontMain {
	font-size: 0.1vw;
}

.tableFont {
	font-size: 1vw;
}

.tRight {
	text-align: right;
}

.tLeft {
	text-align: left;
}

.tCenter {
	text-align: center;
}

@media ( min-width : 500px) {
	.navbar-nav {
		float: right;
		margin: 0;
	}
	.navbar-nav>li {
		float: left;
	}
}
</style>

<div class="col-md-3" role="complementary">

	<c:choose>
		<c:when test="${member.memberGrade eq 'N'}">
			<nav id="mainBox"
				class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix-top"
				style="margin-top: 40px">
				<ul class="nav bs-docs-sidenav layoutUl">
					<li id="memberName">${member.memberName}</li>
					<li><a href="myPage.do">마이 페이지</a></li>
					<li><a href="myInfo.do">내 정보</a></li>
					<li><a href="studyList.do">수강내역</a></li>
					<li><a href="questionList.do">문의내역</a></li>
				</ul>
			</nav>

			<nav class="bs-docs-sidebar visible-xs visible-sm affix-top">
				<ul class="nav navbar-nav">
					<li><a href="myPage.do">마이 페이지</a></li>
					<li><a href="myInfo.do">내 정보</a></li>
					<li><a href="studyList.do">수강내역</a></li>
					<li><a href="questionList.do">문의내역</a></li>
				</ul>
			</nav>

		</c:when>

		<c:otherwise>
			<nav id="mainBox"
				class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix-top"
				style="margin-top: 40px">
				<img alt="image not found" id="layoutImg" class="img-circle"
					src="<c:url value='/img/${tutorDto.storeFileName}'/>">
				<ul class="nav bs-docs-sidenav layoutUl">
					<li id="memberName">${member.memberName}튜터님</li>
					<li><a href="tutorMainPage.do">마이 페이지</a></li>
					<li><a href="tutorIntroduce.do">튜터 소개 정보</a></li>
					<li><a href="tutorPrivateInfo.do">내 정보</a></li>
					<li><a href="tutorQnABoard.do">문의내역</a></li>
				</ul>
			</nav>

			<nav class="bs-docs-sidebar visible-xs visible-sm affix-top">

				<ul class="nav navbar-nav">
					<li id="memberName">${member.memberName}튜터님</li>
					<li><a href="tutorMainPage.do">마이 페이지</a></li>
					<li><a href="tutorIntroduce.do">튜터 소개 정보</a></li>
					<li><a href="tutorPrivateInfo.do">내 정보</a></li>
					<li><a href="tutorQnABoard.do">문의내역</a></li>
				</ul>
			</nav>
		</c:otherwise>
	</c:choose>
</div>